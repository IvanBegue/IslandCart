using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace islandCart.client
{
    public partial class shoppingcart : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                GetCartProduct();
            }

        }

        void GetCartProduct()
        {
            HttpCookie cartCookie = Request.Cookies["cart"];
            if (cartCookie != null && !string.IsNullOrEmpty(cartCookie.Value))
            {
                string[] cartItems = cartCookie.Value.Split('|');

                using (SqlConnection con = new SqlConnection(_conString))
                {
                    using (SqlCommand scmd = new SqlCommand())
                    {

                        List<string> paramNames = new List<string>();
                        for (int i = 0; i < cartItems.Length; i++)
                        {

                            string paramName = "@pid" + i;
                            paramNames.Add(paramName);
                            scmd.Parameters.AddWithValue(paramName, cartItems[i]);
                        }


                        string inClause = string.Join(", ", paramNames);

                        scmd.CommandText = $"SELECT p.product_id,   p.product_name, p.product_price,sc.sub_category, \r\nCONCAT(pf.file_name, '', pf.filepath) AS fileName\r\nFROM product p\r\nJOIN productsubcategory sc ON p.subcategory_id = sc.sub_category_id\r\nJOIN (SELECT pf.product_id, MIN(pf.file_id) AS min_file_id\r\nFROM product_file pf\r\nGROUP BY pf.product_id) max_pf ON max_pf.product_id = p.product_id\r\nJOIN product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.min_file_id\r\nWHERE   p.product_id IN ({inClause})";
                        
                        scmd.Connection = con;

                        SqlDataAdapter daCart = new SqlDataAdapter(scmd);
                        DataTable cartList = new DataTable();

                        con.Open();
                        daCart.Fill(cartList);
                        con.Close();

                        rptProductCart.DataSource = cartList;
                        rptProductCart.DataBind();
                        //pnlPay.Visible = true;
                        //pnlChkBtn.Visible = true;
                    }
                }
                getSumCart();
            }
            else
            {
                pnlEmpty.Visible = true;
            }



        }

        void getSumCart() //CALCULATING TOTAL OF SHOPPING CART
        {


            HttpCookie cartCookie = Request.Cookies["cart"];

            if (cartCookie != null && !string.IsNullOrEmpty(cartCookie.Value))
            {
                string[] cartItems = cartCookie.Value.Split('|');

                using (SqlConnection con = new SqlConnection(_conString))
                {
                    using (SqlCommand scmd = new SqlCommand())
                    {

                        List<string> paramNames = new List<string>();
                        for (int i = 0; i < cartItems.Length; i++)
                        {
                            // Create a unique parameter name for each item
                            string paramName = "@pid" + i;
                            paramNames.Add(paramName); // Add the parameter name to the list
                            scmd.Parameters.AddWithValue(paramName, cartItems[i]);
                        }


                        string inPid = string.Join(", ", paramNames);


                        scmd.CommandText = $"SELECT SUM(product_price) AS TotalPrice FROM product WHERE product_id IN ({inPid})";
                        scmd.Connection = con;
                        con.Open();
                        var result = scmd.ExecuteScalar();
                        decimal subTotal = 0;
                        int deliveryCost = 200;
                        decimal discount = 0;
                        if (result != DBNull.Value)
                        {
                            subTotal = Convert.ToDecimal(result);
                        }
                        con.Close();
                        lblDiscount.Text = $"Rs {discount}";
                        lblDeliveryCost.Text = $"Rs {deliveryCost}";

                        lblSubTotal.Text= $"Rs {subTotal}";

                        lblTotalPrice.Text = $"Rs {subTotal + deliveryCost}";


                    }
                }
            }
            else
            {
                lblTotalPrice.Text = $"Rs 0.00";
            }
        }

        protected void rptProductCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                string productIdToDelete = e.CommandArgument.ToString();


                RemoveItemFromCart(productIdToDelete);
            }
        }

        private void RemoveItemFromCart(string productIdToRemove)
        {

            HttpCookie cartCookie = Request.Cookies["cart"];
            if (cartCookie != null && !string.IsNullOrEmpty(cartCookie.Value))
            {

                List<string> cartItems = cartCookie.Value.Split('|').ToList();


                cartItems.Remove(productIdToRemove);

                cartCookie.Value = String.Join("|", cartItems);
                cartCookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cartCookie);

            }
            GetCartProduct();

            Response.Redirect(Request.RawUrl);



        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            List<int> selectedProductId = new List<int>();

            foreach(RepeaterItem item in rptProductCart.Items)
            {
                CheckBox chkProduct = (CheckBox)item.FindControl("chkProduct");
                if (chkProduct != null && chkProduct.Checked)
                {
                    int productId = int.Parse(chkProduct.Attributes["value"]);
                    selectedProductId.Add(productId);
                }
            }

            Session["SelectedProductId"] = selectedProductId;

            Response.Redirect("~/client/checkout.aspx");
        }
    }
}