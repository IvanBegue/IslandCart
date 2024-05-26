using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.IO;
using System.Web.UI.HtmlControls;

namespace islandCart.admin
{
    

    public partial class addflashsale : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        private int lastId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getProduct();
                getCategory();
                getSubCategory();

                ListItem li = new ListItem("-- Select an option --","-1");
                ddlCat.Items.Insert(0, li);

                ListItem li2 = new ListItem("-- Select an option --", "-1");
                ddlSubCategory.Items.Insert(0,li2);

            }
        }

        void getProduct()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT p.product_id, p.product_name, CONCAT(pf.file_name, '', pf.filepath) AS fileName \r\nFROM product p\r\nJOIN (\r\n    SELECT pf.product_id, MIN(pf.file_id) AS max_file_id\r\n    FROM product_file pf\r\n    GROUP BY pf.product_id\r\n) max_pf ON max_pf.product_id = p.product_id\r\nJOIN product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.max_file_id\r\nWHERE p.status=1\r\nORDER BY  p.product_id DESC";

            con.Open();

            SqlDataReader dr;
            dr = scmd.ExecuteReader();
            rptProduct.DataSource = dr;
            rptProduct.DataBind();
            con.Close();
        }

        void getCategory()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT category_id,category_name FROM productcategory where status=1 order by category_name ASC";
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }

            ddlCat.DataSource = dtcat;
            ddlCat.DataTextField = "category_name";
            ddlCat.DataValueField = "category_id";

            ddlCat.DataBind();
        }

        void getSubCategory()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM productSubcategory where status=1 order by sub_category asc";
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }

            ddlSubCategory.DataSource = dtcat;
            ddlSubCategory.DataTextField = "sub_category";
            ddlSubCategory.DataValueField = "sub_category_id";

            ddlSubCategory.DataBind();
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string BannerPath = "~/assets/images/banners/" + ImgBanner.FileName;

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand icmd = new SqlCommand();

            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO flashsales (percentage,minimum_percentage,banner,title) VALUES (@per,@min,@banner,@title)SELECT SCOPE_IDENTITY()";

            con.Open();

            icmd.Parameters.AddWithValue("@per",txtPercentage.Text);
            icmd.Parameters.AddWithValue("@min", txtAmount.Text);
            icmd.Parameters.AddWithValue("@banner", BannerPath);

            icmd.Parameters.AddWithValue("@title", txtcode.Text);

            lastId = Convert.ToInt32(icmd.ExecuteScalar());

          

            con.Close();

            SaveBannerImg(); //Saving Banner Image

            if (rbCategory.Checked)
            {
                SetCategoryFlashSales(lastId);
            }


            if (rbSub.Checked)
            {
                SetSubCategoryFlashSales(lastId);
            }
            if (rbProduct.Checked) 
            {
                SetProductFlashSales(lastId);
            }


            Response.Redirect("~/admin/addflashsale.aspx");
        }

        void SaveBannerImg()
        {
            if (ImgBanner.HasFile)
            {

                string fileName = Path.GetFileName(ImgBanner.PostedFile.FileName);
                string savePath = Server.MapPath("~/assets/images/banners/") + fileName;

               
                ImgBanner.PostedFile.SaveAs(savePath);
            }
        }


        void SetCategoryFlashSales(int lastId)
        {

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand icmd = new SqlCommand();

            icmd.Connection = con;

            icmd.CommandText = "INSERT INTO Category_Flashsale (fl_id,category_id,start_date,end_date) VALUES (@id,@cat,@str,@end)";

            con.Open();
            icmd.Parameters.AddWithValue("@id", lastId);
            icmd.Parameters.AddWithValue("@cat",ddlCat.SelectedValue);
            icmd.Parameters.AddWithValue("@str", txtStart.Text);
            icmd.Parameters.AddWithValue("@end", txtEnd.Text);
            icmd.ExecuteNonQuery();

            con.Close();
        }

        void SetSubCategoryFlashSales(int lastId)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();

            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO SubCategory_FlashSales (fl_id,sub_id,start_date,end_date) VALUES (@id,@sub,@str,@end)";

            con.Open();
            icmd.Parameters.AddWithValue("@id", lastId);
            icmd.Parameters.AddWithValue("@sub", ddlSubCategory.SelectedValue);
            icmd.Parameters.AddWithValue("@str", txtStart.Text);
            icmd.Parameters.AddWithValue("@end", txtEnd.Text);
            icmd.ExecuteNonQuery();
            con.Close();

        }



        void SetProductFlashSales(int lastId)
        {
            foreach (RepeaterItem item in rptProduct.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                     CheckBox chkProduct = (CheckBox)item.FindControl("chkProduct");
                    if (chkProduct != null && chkProduct.Checked)
                    {
                        int productId = Convert.ToInt32(chkProduct.ToolTip);

                        SqlConnection con = new SqlConnection(_conString);
                        SqlCommand icmd = new SqlCommand();

                        icmd.Connection = con;
                        icmd.CommandText = "INSERT INTO product_flsale (fl_sales_id,product_id,expiry_date,start_date) VALUES (@id,@pid,@str,@end)";

                        con.Open();
                        icmd.Parameters.AddWithValue("@id", lastId);
                        icmd.Parameters.AddWithValue("@pid", productId);
                        icmd.Parameters.AddWithValue("@str", txtStart.Text);
                        icmd.Parameters.AddWithValue("@end", txtEnd.Text);
                        icmd.ExecuteNonQuery();
                        con.Close();

                    }
                }
            }
        }
    }
}