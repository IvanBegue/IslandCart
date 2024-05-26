using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace islandCart.client
{
    public partial class productdetails : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private string pid;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            pid = Request.QueryString["q"];

            if (!Page.IsPostBack)
            {
                getProductDetails();
            }

        }



        void getProductDetails()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT  p.product_id,p.product_name,p.product_description,p.product_price, b.brand,p.weight,sc.sub_category ,c.category_name\r\nFROM product p , productsubcategory sc ,productcategory c , brand b\r\nWHERE \r\n    p.subcategory_id = sc.sub_category_id\r\n    AND sc.category_id = c.category_id\r\n    AND p.brand_id=b.brand_id\r\n    AND p.product_id = @pid";

            scmd.Parameters.AddWithValue("@pid", pid);

            SqlDataReader dr;
            con.Open();
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                lblProductName.Text = dr["product_name"].ToString();
                lblDescription.Text= dr["product_description"].ToString();
                lblPrice.Text="Rs " + dr["product_price"].ToString();
                lblBrand.Text = dr["brand"].ToString();
                lblWeight.Text = dr["weight"].ToString();
                lblCategory.Text = dr["category_name"].ToString();
                lblTags.Text = dr["sub_Category"].ToString();
                getTotalSell();
                DisplayProductImage();
            }
            else
            {
                Response.Redirect("~/client/allproducts.aspx");
            }
            con.Close();

        }

        void getTotalSell()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "  select COUNT(product_id) As TotalSell\r\n    from orderline\r\n    where product_id=@pid";

            scmd.Parameters.AddWithValue("@pid", pid);

           
            con.Open();
            int totalOrder = (int)scmd.ExecuteScalar();

            lblTotalOrders.DataBind();
            lblTotalOrders.Text = totalOrder.ToString();
            con.Close();

        }

        void DisplayProductImage()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT CONCAT(file_name, filePath)as FileName from product_file where product_id=@pid";

            scmd.Parameters.AddWithValue("@pid", pid);


            SqlDataAdapter da = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();

            using (da)
            {
                da.Fill(dt);
            }
            RptMainImg.DataSource = dt;

            RptMainImg.DataBind();

            RptSlideImg.DataSource = dt;

            RptSlideImg.DataBind();

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //SAVING RECOMMENDATION 
            int cid = 2;
           

            int rate = Convert.ToInt32(Request.Form["rate"]);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();

            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO product_recommendation (description,product_id,c_id,rating) VALUES (@desc,@pid,@cid,@rate)";
            con.Open();
            icmd.Parameters.AddWithValue("@desc", txtReview.Text.Trim());
            icmd.Parameters.AddWithValue("@pid", pid);
            icmd.Parameters.AddWithValue("@cid", cid);
            icmd.Parameters.AddWithValue("@rate", rate);

            icmd.CommandType = CommandType.Text;

            icmd.ExecuteNonQuery();
            con.Close();
            //Saveimage(lastid);
            Response.Redirect("~/client/productdetails.aspx?q="+pid);

        }


       

        void  Saveimage(int lastpid)
        {
            //if (Request.Files.Count > 0)
            //{
            //    foreach (string fileName in Request.Files)
            //    {
            //        HttpPostedFileBase file = request.Files[fileName];
            //        if (file != null && file.ContentLength > 0)
            //        {
            //            string savedFileName = Path.GetFileName(file.FileName);
            //            string savePath = Server.MapPath("~/assets/images/recommendatonimg/") + savedFileName;
            //            file.SaveAs(savePath);
                        
            //        }
            //    }
            //}
        }

    }
}