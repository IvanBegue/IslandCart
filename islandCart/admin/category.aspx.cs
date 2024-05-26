using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Net.NetworkInformation;
using System.IO;

namespace islandCart.admin
{
    public partial class category : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getCategory();
            }


        }

       void getCategory()
       {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT c.category_id, c.category_name,c.filePath,c.Categoryimage,COUNT(p.product_id) AS product_count\r\nFROM productcategory c \r\nLEFT JOIN productsubcategory sc ON c.category_id = sc.category_id\r\nLEFT JOIN product p ON sc.sub_category_id = p.subcategory_id\r\nWHERE c.status=1\r\nGROUP BY c.category_id, c.category_name,c.filePath,c.Categoryimage\r\norder by c.category_id DESC";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptCategory.DataSource = dr;
            rptCategory.DataBind();
            con.Close();


       }


        int currentRow = 1;
        protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
              
                Label rowNumber = (Label)e.Item.FindControl("lblRowCount"); 
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string ImagePath = "~/assets/adminAssets/images/categoryImg/";
            string picture = "";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;

            if (picCategory.HasFile)
            {
                if (CheckFileType(picCategory.FileName))
                {
                    picture = Path.GetFileName(picCategory.PostedFile.FileName);
                    picCategory.PostedFile.SaveAs(Server.MapPath(ImagePath) +
                   picture);
                    
                    //VALIDATION FOR PICTURE 
                }

            }
            icmd.CommandText = "INSERT INTO productcategory (category_name,filePath,categoryImage) VALUES(@cat,@fp,@img)";

            con.Open();
            icmd.Parameters.AddWithValue("@cat",txtCategory.Text.ToLower());
            icmd.Parameters.AddWithValue("@fp", ImagePath);
            icmd.Parameters.AddWithValue("@img", picture);
            icmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/category.aspx");



        }
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {

                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                case ".webp":
                    return true;
                default:
                    return false;
            }
        }

        

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlUpdate.Visible = true;
            pnlAdd.Visible = false;
            Button ButtonCid = (Button)sender;
            int cid = int.Parse(ButtonCid.CommandArgument);

            

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT category_id, category_name,filePath,categoryimage FROM productcategory  where category_id=@cid";
            scmd.Parameters.AddWithValue("@cid",cid);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            while (dr.Read())
            {
                txtCurrentCat.Text = dr["category_name"].ToString();
                ImgCategoryImg.ImageUrl = dr["filePath"].ToString() + dr["categoryimage"].ToString();
                hdnCid.Text = dr["category_id"].ToString();
            }
            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string ImagePath = "~/assets/adminAssets/images/categoryImg/";
            string picture = "";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;

            if (fupCatImg.HasFile)
            {
                if (CheckFileType(fupCatImg.FileName))
                {
                    picture = Path.GetFileName(fupCatImg.PostedFile.FileName);
                    fupCatImg.PostedFile.SaveAs(Server.MapPath(ImagePath) +
                   picture);

                    //VALIDATION FOR PICTURE 
                }

            }
            ucmd.CommandText = "UPDATE productcategory SET category_name=@cat ,categoryimage=@img where category_id=@cid ";

            con.Open();
            ucmd.Parameters.AddWithValue("@cat", txtCurrentCat.Text.ToLower());
            ucmd.Parameters.AddWithValue("@img", picture);
            ucmd.Parameters.AddWithValue("@cid", hdnCid.Text);
            ucmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/category.aspx");

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            Button ButtonCid = (Button)sender;
            int cid = int.Parse(ButtonCid.CommandArgument);
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE productcategory SET STATUS=0 where category_id=@cid ";

            con.Open();
            ucmd.Parameters.AddWithValue("@cid",cid);
          
            ucmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/category.aspx");
        }
    }
}