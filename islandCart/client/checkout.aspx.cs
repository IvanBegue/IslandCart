using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using Stripe;
using Stripe.Checkout;

namespace islandCart.client
{
    public partial class checkout : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getSelectItem();
            }

            StripeConfiguration.ApiKey = "sk_test_51PF9O0DZISg8Z4OB0EYFBaj8QSnnrxbqlhJAKUUtpOy1aihQWAv3ek07ngkAM1P0IIbidgcwP2fIVOaikBuxM1ZS00hj3Qca5E";

        }

        void getSelectItem()
        {
            List<int> selectedProductIds = Session["SelectedProductId"] as List<int>;
            List<int> selectedProductQuantities = Session["SelectedProductQuantities"] as List<int>;

            if (selectedProductIds != null && selectedProductIds.Any() && selectedProductQuantities != null)
            {
                using (SqlConnection con = new SqlConnection(_conString))
                {
                    con.Open();

                    using (SqlCommand scmd = new SqlCommand())
                    {
                        string parameterNames = string.Join(",", selectedProductIds.Select((id, index) => $"@pid{index}"));
                        string whereClause = string.Join(" OR ", selectedProductIds.Select((id, index) => $"p.product_id = @pid{index}"));

                        scmd.CommandText = "SELECT p.product_id, p.product_name, p.product_price, CONCAT(pf.file_name, '', pf.filepath) AS fileName " +
                                            "FROM product p " +
                                            "JOIN (SELECT pf.product_id, MIN(pf.file_id) AS min_file_id FROM product_file pf GROUP BY pf.product_id) max_pf " +
                                            "ON max_pf.product_id = p.product_id " +
                                            "JOIN product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.min_file_id " +
                                            $"WHERE {whereClause}";

                        scmd.Connection = con;

                        // Add parameters dynamically
                        for (int i = 0; i < selectedProductIds.Count; i++)
                        {
                            scmd.Parameters.AddWithValue($"@pid{i}", selectedProductIds[i]);
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(scmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Add quantity column to DataTable
                            dt.Columns.Add("Quantity", typeof(int));

                            // Add quantities to DataTable
                            for (int i = 0; i < selectedProductIds.Count; i++)
                            {
                                DataRow[] rows = dt.Select($"product_id = {selectedProductIds[i]}");
                                if (rows.Length > 0)
                                {
                                    rows[0]["Quantity"] = selectedProductQuantities[i];
                                }
                            }

                            rptCheckoutCart.DataSource = dt;
                            rptCheckoutCart.DataBind();

                            // Calculate and display the total price
                            decimal totalPrice = 0;
                            foreach (DataRow row in dt.Rows)
                            {
                                int quantity = Convert.ToInt32(row["Quantity"]);
                                decimal productPrice = Convert.ToDecimal(row["product_price"]);
                                totalPrice += quantity * productPrice;
                            }

                            lblTotalPrice.Text =totalPrice.ToString("0.00");

                            Session["totalPrice"] = totalPrice.ToString("0.00"); 

                        }
                    }




                }
            }





        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            double totalPrice;

            if (Session["totalPrice"] != null)
            {

                if (double.TryParse(Session["TotalPrice"].ToString(), out totalPrice))
                {
                    int totalAmount = (int)totalPrice;

                    // Debugging output to check the parsed amount
                    System.Diagnostics.Trace.WriteLine("Total Price from Session: " + totalPrice);
                    Response.Write("Total Price from Session: " + totalPrice + "<br>");
                    System.Diagnostics.Trace.WriteLine("Total Amount: " + totalAmount);
                    Response.Write("Total Amount: " + totalAmount + "<br>");


                    try
                    {




                        // Create Checkout Session
                        var options = new SessionCreateOptions
                        {
                            PaymentMethodTypes = new List<string> { "card" },
                            LineItems = new List<SessionLineItemOptions>
            {
                new SessionLineItemOptions
                {
                    PriceData = new SessionLineItemPriceDataOptions
                    {
                        UnitAmount = totalAmount * 100, // Stripe uses cents, so multiply by 100
                        Currency = "MUR",
                        ProductData = new SessionLineItemPriceDataProductDataOptions
                        {
                            Name = "Your Product Name",
                        },
                    },
                    Quantity = 1,
                },
            },
                            Mode = "payment",
                            SuccessUrl = "https://localhost:44390/client/successpayment",
                            CancelUrl = "https://localhost:44390/client/cancelpayment",
                        };
                        var service = new SessionService();
                        var session = service.Create(options);

                        // Redirect to Stripe Checkout page for payment
                        Response.Redirect(session.Url);
                    }
                    catch (StripeException ex)
                    {
                        // Handle Stripe API errors
                        // Log the error or display a message to the user
                        Response.Write("Error: " + ex.Message);
                    }





                }


            }

            

        }




    }
}