using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
namespace islandCart.admin
{
    public partial class panel : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                getTotalProducts();
                getTotalCustomer();
                getTotalRating();
                getTotalCourier();
            }
     
        }

        private void getTotalProducts()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT count(*) from product where status=1";
            con.Open();

            int totalProduct = (int)scmd.ExecuteScalar();
            lblProducts.DataBind();
            lblProducts.Text = totalProduct.ToString();
            con.Close();


        }
        private void getTotalCustomer()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT count(*) from customer where status=1";
            con.Open();

            int totalCustomer = (int)scmd.ExecuteScalar();
            lblCustomer.DataBind();
            lblCustomer.Text = totalCustomer.ToString();
            con.Close();

        }

        private void getTotalRating()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT count(*) from testimonials where rating BETWEEN 3 and 5";
            con.Open();

            int totalFeeback = (int)scmd.ExecuteScalar();
            lblRating.DataBind();
            lblRating.Text = totalFeeback.ToString();
            con.Close();

        }

        private void getTotalCourier()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT count(*) from courrier where status=1";
            con.Open();

            int totalCourier = (int)scmd.ExecuteScalar();
            lblCourier.DataBind();
            lblCourier.Text = totalCourier.ToString();
            con.Close();
        }




    }
}