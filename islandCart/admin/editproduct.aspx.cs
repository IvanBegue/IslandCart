﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Drawing;

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
                    Response.Redirect("~/admin/listproduct.aspx");

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
            string currentBrand;
            string bid;
            string currentSubCategory;
            string sid;
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
                txtWeight.Text = dr["weight"].ToString();
                currentBrand = dr["brand"].ToString();
                bid = dr["brand_id"].ToString();
                currentSubCategory = dr["sub_category"].ToString();
                sid = dr["sub_category_id"].ToString();
                getBrand();

                getProductImage();

                setbrand(currentBrand,bid);

                getSubcategory(currentSubCategory, sid);

                getSize();

                getColor();
            }
            else
            {
                Response.Redirect("~/admin/listproduct.aspx");

            }

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
            int rowCount = 0;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "select COUNT(*) FROM productcolor where product_id=@pid";
            scmd.Connection = con;
            con.Open();
            scmd.Parameters.AddWithValue("@pid", pid);
            rowCount = Convert.ToInt32(scmd.ExecuteScalar());

          

            if (rowCount > 0)
            {
                scmd.CommandText = "select * FROM productcolor where product_id=@pid";

            }
            else
            {
                scmd.CommandText = "select * FROM color";
                
            }
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            DataTable dtColor = new DataTable();

            using (dtColor)
            {
                da.Fill(dtColor);

            }

            rptColor.DataSource = dtColor;

            rptColor.DataBind();

            con.Close();
        }

        protected void rptColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TextBox txtQuantityColor = (TextBox)e.Item.FindControl("txtQuantityColor");
                DataRowView rowView = (DataRowView)e.Item.DataItem;

                if (rowView.DataView.Table.Columns.Contains("quantity"))
                {
                    txtQuantityColor.Text = rowView["quantity"].ToString();

                }
                else
                {
                    txtQuantity.Text = string.Empty;
                }


            }

        }

        void getProductImage()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;

            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "select \r\nCONCAT(file_name,filepath) as fileImage\r\n from product_file WHERE product_id=@pid ORDER BY file_id asc";



            scmd.Parameters.AddWithValue("@pid", pid);

            con.Open();

            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptProductImage.DataSource = dr;
            rptProductImage.DataBind();

            con.Close();

           
        }

        void getBrand()
        {

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT brand,brand_id\r\nfrom Brand b\r\nwhere status=1 \r\nAND brand_id <> (SELECT brand_id from product where product_id=@pid)\r\nOrder by brand asc\r\n";
            scmd.Connection = con;

            scmd.Parameters.AddWithValue("@pid", pid);
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



        void setbrand(string brand,string brandID)
        {

            ListItem li = new ListItem(brand, brandID);
            
           
            ddlBrand.Items.Insert(0, li);
        }

        void getSubcategory(string subcategory,string subId)
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select sc.sub_category_id,sc.sub_category ,sc.category_id,c.category_name\r\nfrom productsubcategory sc , productcategory c\r\nwhere  sc.sub_category_id <>(SELECT subcategory_id from product where product_id=@pid) AND sc.category_id=c.category_id \r\nAND sc.status=1";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@pid", pid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }


            ddlSubcategory.Items.Clear();
            ddlSubcategory.Items.Add(new ListItem(subcategory, subId));
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

        void getSize()
        {
            int rowCount = 0;
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;

        
            scmd.CommandText = "SELECT count(*) FROM productsize where product_id=@pid";

            scmd.Connection = con;
            con.Open();

            scmd.Parameters.AddWithValue("@pid", pid); 

            rowCount = Convert.ToInt32(scmd.ExecuteScalar());

            if(rowCount > 0)
            {
                scmd.CommandText = "SELECT s.size_id, s.size_type, COALESCE(ps.quantity, 0) AS quantity\r\nFROM size s\r\nLEFT JOIN productsize ps ON s.size_id = ps.size_id AND ps.product_id =@pid";
            }
            else
            {
                scmd.CommandText = "SELECT size_id, size_type, 0 AS quantity \r\nFROM size s";
            }


            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable dtSize = new DataTable();

            using (dtSize)
            {
                da.Fill(dtSize);

            }

            rptsize.DataSource = dtSize;
            rptsize.DataBind();
        }


        protected void rptsize_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                
                TextBox txtSizeTotal = (TextBox)e.Item.FindControl("txtSizeTotal");

                DataRowView rowView = (DataRowView)e.Item.DataItem;

                if (rowView.DataView.Table.Columns.Contains("quantity"))
                {
                    txtSizeTotal.Text = rowView["quantity"].ToString();

                }
                else
                {
                    txtSizeTotal.Text = string.Empty;
                }


            }

        }


        bool IsProductHasSize()
        {
            int rowCount = 0;

            bool found = false;

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;


            scmd.CommandText = "SELECT count(*) FROM productsize where product_id=@pid";

            scmd.Connection = con;

            con.Open();

            scmd.Parameters.AddWithValue("@pid", pid);

            rowCount = Convert.ToInt32(scmd.ExecuteScalar());

            con.Close();

            if (rowCount > 0)
            {

                found = true;
            }

            return found;

        }


        void updateProductColor()
        {
            pid = Request.QueryString["q"];

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

                            SqlCommand ucmd = new SqlCommand();
                            ucmd.Connection = con;
                            ucmd.CommandText = "update productcolor set quantity=@qnt where product_id=@pid AND color=@clr";

                            ucmd.Parameters.AddWithValue("@qnt", txtQuantityColor.Text);
                            ucmd.Parameters.AddWithValue("@pid", pid);
                            ucmd.Parameters.AddWithValue("@clr", color);
                           
                           

                            ucmd.ExecuteNonQuery();

                            con.Close();
                        }
                    }




                }
            }


        }

        void updateSize()
        {
            //pid = Request.QueryString["q"];


            foreach (RepeaterItem item in rptsize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfSizeId = (HiddenField)item.FindControl("hfSizeId");
                    TextBox txtSizeTotal = (TextBox)item.FindControl("txtSizeTotal");

                    int sizeId = Convert.ToInt32(hfSizeId.Value);

                    // Insert into productsize table
                    using (SqlConnection con = new SqlConnection(_conString))
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        
                         cmd.CommandText = "UPDATE productsize set quantity=@qnt WHERE size_id=@size AND product_id=@pid";

                        cmd.Parameters.AddWithValue("@size", sizeId);
                        cmd.Parameters.AddWithValue("@pid", pid);
                        cmd.Parameters.AddWithValue("@qnt", txtSizeTotal.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }


        }


       void addSize()
       {
            foreach (RepeaterItem item in rptsize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfSizeId = (HiddenField)item.FindControl("hfSizeId");
                    TextBox txtSizeTotal = (TextBox)item.FindControl("txtSizeTotal");

                    int sizeId = Convert.ToInt32(hfSizeId.Value);

                    // Insert into productsize table
                    using (SqlConnection con = new SqlConnection(_conString))
                    {
                        SqlCommand icmd = new SqlCommand();
                        icmd.Connection = con;
                        icmd.CommandText = "INSERT INTO productsize (size_id, product_id, quantity) VALUES (@size, @pid, @qnt)";

                        icmd.Parameters.AddWithValue("@size", sizeId);
                        icmd.Parameters.AddWithValue("@pid", pid);
                        icmd.Parameters.AddWithValue("@qnt", txtSizeTotal.Text);

                        con.Open();
                        icmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

       }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

                updateProductColor();

                if (IsProductHasSize())
                {
                    updateSize();

                }
                else
                {
                    addSize();
                    
                }

               

            Response.Redirect("~/admin/editproduct.aspx");

        }

       
    }

}