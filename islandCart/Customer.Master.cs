using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;

namespace islandCart
{
    public partial class Customer : System.Web.UI.MasterPage
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cid"] != null)
            {

                pnllogin.Visible = true;
                pnlDefault.Visible = false;
                lblfn.Text = Session["sfn"].ToString();


            }
            if (!IsPostBack)
            {
                GetCartProduct();
                TotalCart();

                getSumCart();
            }
            
               
            
           
        }

        void TotalCart()
        {
            string NoCart = "0";
            HttpCookie cartCookie = Request.Cookies["cart"];
           if (cartCookie != null && !string.IsNullOrEmpty(cartCookie.Value))
           {
                string[] cartItems = cartCookie.Value.Split('|');

                int itemCount = cartItems.Length;

               
                lblCountCart.Text = itemCount.ToString();



           }
           else
           {
                lblCountCart.Text = NoCart;
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

                   
                        scmd.CommandText = $"Select * from product where product_id IN ({inClause})"; //!Need to rewrite correctly
                        scmd.Connection = con;

                        SqlDataAdapter daCart = new SqlDataAdapter(scmd);
                        DataTable cartList = new DataTable();

                        con.Open();
                        daCart.Fill(cartList);
                        con.Close();

                        rptCart.DataSource = cartList;
                        rptCart.DataBind();
                        pnlcart.Visible = true;
                    }
                }
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
                        decimal totalPrice=0;

                        if(result!=DBNull.Value)
                        {
                            totalPrice=Convert.ToDecimal(result);
                        }
                        con.Close();

                        lblCartSum.Text = $"Rs {totalPrice}";


                    }
                }
            }
            else
            {
                lblCartSum.Text = $"Rs 0.00";
            }
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
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

                cartCookie.Value = String.Join("|",cartItems);
                cartCookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cartCookie);

            }
            GetCartProduct();

            Response.Redirect(Request.RawUrl);



        }

        protected void btnNavSearch_Click(object sender, EventArgs e)
        {
            string ProductSearch = txtNavSearch.Text;

            if (!string.IsNullOrEmpty(ProductSearch))
            {
                Response.Redirect("~/client/allproducts.aspx?q="+ProductSearch);
            }
        }
    }
}