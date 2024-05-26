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
    public partial class editproduct : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        private string  pid; 

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["q"] == null)
                {
                    Response.Redirect("~/assets/listproduct.aspx");

                }
                else
                {
                    pid = Request.QueryString["q"];
                    getProduct();

                }
            }    
           








        }


        void getProduct()
        {

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;

            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT p.product_id ,p.product_name , p.product_description,p.product_price,p.Weight,p.quantity,p.video_link,b.brand_id,b.brand,\r\nsc.sub_category_id,sc.sub_category\r\nFROM product p,brand b , productsubcategory sc\r\nwhere p.brand_id=b.brand_id AND p.subcategory_id=sc.sub_category_id AND \r\np.status=1 AND p.product_id=@pid";



            scmd.Parameters.AddWithValue("@pid",pid);

            con.Open();

            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Text = dr["product_name"].ToString();
                txtDescription.Text = dr["product_description"].ToString();
                txtprice.Text = dr["product_price"].ToString();
                txtQuantity.Text = dr["quantity"].ToString();
                txtvideo.Text = dr["video_link"].ToString();


            }
            else
            {
                Response.Redirect("~/assets/listproduct.aspx");

            }

        }


    }

}