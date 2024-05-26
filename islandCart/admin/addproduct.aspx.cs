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
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;

namespace islandCart.admin
{
    public partial class addproduct : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        private int lastPid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getBrand();
                getSize();
                getColor();
                getSubcategory();


                ListItem li = new ListItem("--Select an Option--","-1");
                ddlBrand.Items.Insert(0, li);


            }
        }

        void getBrand()
        {


            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * from Brand where status=1 Order by brand asc";
            scmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable dtbrand = new DataTable();

            using (dtbrand)
            {
                da.Fill(dtbrand);

            }

            ddlBrand.DataSource = dtbrand;
            ddlBrand.DataTextField = "brand";
            ddlBrand.DataValueField = "brand_id";

            ddlBrand.DataBind();

        }
        void getSize()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * from size";
            scmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable dtSize = new DataTable();

            using (dtSize)
            {
                da.Fill(dtSize);

            }

            rptsize.DataSource = dtSize;


            rptsize.DataBind();
        }


        protected string GetColorName(Color color)
        {
            string colorName = string.Empty;

            
            foreach (System.Reflection.PropertyInfo prop in typeof(System.Drawing.Color).GetProperties())
            {
                if (prop.PropertyType == typeof(System.Drawing.Color))
                {
                    System.Drawing.Color knownColor = (System.Drawing.Color)prop.GetValue(null);
                    if (knownColor.ToArgb() == color.ToArgb())
                    {
                        colorName = prop.Name;
                        break;
                    }
                }
            }

            return colorName;
        }
        protected System.Drawing.Color GetColorFromHex(string hexColor)
        {
            

            // Convert hex string to Color object
            return System.Drawing.ColorTranslator.FromHtml(hexColor);
        }
        void getColor()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * from color";
            scmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable dtColor = new DataTable();

            using (dtColor)
            {
                da.Fill(dtColor);

            }

            rptColor.DataSource = dtColor;


            rptColor.DataBind();
        }




        protected void getSubcategory()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select sc.sub_category_id,sc.sub_category ,sc.category_id,c.category_name\r\nfrom productsubcategory sc , productcategory c\r\nwhere sc.category_id=c.category_id\r\nAND sc.status=1";
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }


            ddlSubcategory.Items.Clear();
            ddlSubcategory.Items.Add(new ListItem("-- Select category --", ""));
            Dictionary<string, List<ListItem>> categoriesWithSubcategories = new Dictionary<string, List<ListItem>>();


            foreach (DataRow row in dtcat.Rows)
            {
                string categoryName = row["category_name"].ToString();
                string subcategoryName = row["sub_category"].ToString();
                string subcategoryId = row["sub_category_id"].ToString();

                if (!categoriesWithSubcategories.ContainsKey(categoryName))
                {
                    categoriesWithSubcategories[categoryName] = new List<ListItem>();
                }

                categoriesWithSubcategories[categoryName].Add(new ListItem(subcategoryName, subcategoryId));
            }


            foreach (var category in categoriesWithSubcategories)
            {

                ListItem group = new ListItem(category.Key, "");
                group.Attributes.Add("disabled", "disabled");
                group.Attributes.Add("class", "optgroup");
                group.Attributes.Add("style", "font-weight: bold;");
                ddlSubcategory.Items.Add(group);


                foreach (var item in category.Value)
                {
                    ddlSubcategory.Items.Add(item);
                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT  INTO product (product_name,product_description,product_sku,product_price,brand_id,subcategory_id,weight,quantity,video_link) values(@txtnme,@desc,@sku,@price,@bid,@subid,@weight,@qnt,@video) SELECT SCOPE_IDENTITY();";

            con.Open();
            string txtSku = "111";
            string weight = txtWeight.Text + " " + ddlWeight.SelectedValue;
            icmd.Parameters.AddWithValue("@txtnme",txtName.Text.ToLower());
            icmd.Parameters.AddWithValue("@desc", txtDescription.Text.ToLower());
            icmd.Parameters.AddWithValue("@sku", txtSku.ToLower());
            icmd.Parameters.AddWithValue("@price",txtprice.Text);
            icmd.Parameters.AddWithValue("@bid", ddlBrand.Text);
            icmd.Parameters.AddWithValue("@subid", ddlSubcategory.SelectedValue);
            icmd.Parameters.AddWithValue("@weight", weight);
            icmd.Parameters.AddWithValue("@qnt",txtQuantity.Text);
            icmd.Parameters.AddWithValue("@video", txtvideo.Text);
            lastPid = Convert.ToInt32(icmd.ExecuteScalar());



         
          


           
            foreach (FileUpload fileUpload in new FileUpload[] { productImg1, productImg2 , productImg3  , productImg4})
            {
                if (fileUpload.HasFile)
                {
                   
                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string savePath = Server.MapPath("~/assets/images/product/") + fileName;

                        // Save the file
                        fileUpload.PostedFile.SaveAs(savePath);

                    SaveProductImage(lastPid,fileName);
                }
            }

            


           

            
            con.Close();
            SaveProductSize();
            SaveProductColor();
            Response.Redirect("~/admin/addproduct.aspx");
        }



        void SaveProductImage(int pid , string image)
        {
            string filePath = "~/assets/images/product/";  //File path where image is stored
            
            using (SqlConnection con = new SqlConnection(_conString))
            {


                con.Open();
                using (SqlCommand icmd = new SqlCommand("INSERT INTO product_file (file_name,product_id,filepath) VALUES(@fn,@pid,@fp)", con))
                {


                    icmd.Parameters.AddWithValue("@fn", filePath );
                    icmd.Parameters.AddWithValue("@pid", pid);
                    icmd.Parameters.AddWithValue("@fp", image);

                    icmd.ExecuteNonQuery();
                }

                con.Close();

            }
        }


        void SaveProductColor()
        {
            foreach (RepeaterItem item in rptColor.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfColor = (HiddenField)item.FindControl("hfColor");
                    TextBox txtQuantityColor = (TextBox)item.FindControl("txtQuantityColor");

                    if (txtQuantityColor != null)
                    {
                        string color = hfColor.Value;

                        using (SqlConnection con = new SqlConnection(_conString))
                        {
                            con.Open();

                            SqlCommand icmd = new SqlCommand();
                            icmd.Connection = con;
                            icmd.CommandText = "INSERT INTO productcolor (color,product_id,quantity) VALUES(@clr,@pid,@qnt)";

                            icmd.Parameters.AddWithValue("@clr", color);
                            icmd.Parameters.AddWithValue("@pid", lastPid);
                            icmd.Parameters.AddWithValue("@qnt", txtQuantityColor.Text);

                            icmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }

                        
                    
                   
                }
            }




        }

        private bool Int32(string color)
        {
            throw new NotImplementedException();
        }

        void SaveProductSize()
        {
            foreach (RepeaterItem item in rptsize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfSizeId = (HiddenField)item.FindControl("hfSizeId");
                    TextBox txtSizeTotal = (TextBox)item.FindControl("txtSizeTotal");

                    int sizeId = Convert.ToInt32(hfSizeId.Value);

                    // Insert into productsize table
                    using (SqlConnection conSize = new SqlConnection(_conString))
                    {
                        SqlCommand icmdSize = new SqlCommand();
                        icmdSize.Connection = conSize;
                        icmdSize.CommandText = "INSERT INTO productsize (size_id, product_id, quantity) VALUES (@size, @pid, @qnt)";

                        icmdSize.Parameters.AddWithValue("@size", sizeId);
                        icmdSize.Parameters.AddWithValue("@pid", lastPid);
                        icmdSize.Parameters.AddWithValue("@qnt", txtSizeTotal.Text);

                        conSize.Open();
                        icmdSize.ExecuteNonQuery();
                        conSize.Close();
                    }
                }
            }

        }



    }
}