using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Xml.Linq;
using islandCart.admin;
using System.Security.Cryptography;

namespace islandCart.client
{
    public partial class allproducts : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                displayProducts();
                getBrand();
                GetSubCategory();
            }




        }




        protected void displayProducts()
        {
            string productName = Request.QueryString["q"];

            if (Request.QueryString["q"] != null)
            {

                SqlConnection con = new SqlConnection(_conString);
                SqlCommand scmd = new SqlCommand();
                scmd.CommandText = "SELECT \r\n    p.product_id,\r\n    p.product_name,\r\n    p.product_price,\r\n    sc.sub_category,\r\n    (SELECT TOP 1  CONCAT(pf.file_name,'',pf.filepath ) FROM product_file pf WHERE pf.product_id = p.product_id ORDER BY pf.file_id) AS fileName\r\nFROM \r\n    product p\r\nJOIN \r\n    productsubcategory sc ON p.subcategory_id = sc.sub_category_id\r\nWHERE \r\n    p.product_name LIKE '%' + @productname + '%' \r\n    AND p.status = 1 \r\nORDER BY \r\n    p.product_id DESC;\r\n";
                scmd.Parameters.AddWithValue("@productname", productName);
                scmd.Connection = con;
                SqlDataAdapter da1 = new SqlDataAdapter(scmd);
                DataTable productDetails = new DataTable();

                using (da1)
                {
                    da1.Fill(productDetails);
                }
                rptProduct.DataSource = productDetails;
                rptProduct.DataBind();
            }
            else if (txtSearch.Text != "" || chkSub.Items.Cast<ListItem>().Any(item => item.Selected) || chkBrand.Items.Cast<ListItem>().Any(item => item.Selected))
            {

                SearchProduct();
            }
            else
            {
                getProducts();

            }
        }

        protected void getProducts()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT \r\n    p.product_id,\r\n    p.product_name,\r\n    p.product_price,\r\n    sc.sub_category,\r\n    CONCAT(pf.file_name, '', pf.filepath) AS fileName\r\nFROM \r\n    product p\r\nJOIN \r\n    productsubcategory sc ON p.subcategory_id = sc.sub_category_id\r\nJOIN \r\n    (SELECT pf.product_id, MIN(pf.file_id) AS min_file_id\r\n     FROM product_file pf\r\n     GROUP BY pf.product_id) max_pf ON max_pf.product_id = p.product_id\r\nJOIN \r\n    product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.min_file_id\r\nWHERE \r\n    p.status = 1 \r\nORDER BY \r\n    p.product_id DESC";

            con.Open();

            SqlDataReader dr;
            dr = scmd.ExecuteReader();


            rptProduct.DataSource = dr;
            rptProduct.DataBind();

            con.Close();




        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string pid = btn.CommandArgument;
           

            List<string> cartItems = GetCartItemsFromCookie();
           
         
            cartItems.Add(pid);

            StoreCartItemsInCookie(cartItems);
            Response.Redirect("~/client/allproducts.aspx");

        }

        private List<string> GetCartItemsFromCookie()
        {
            List<string> cartItems = new List<string>();
            HttpCookie cartCookie = Request.Cookies["cart"];

            if (cartCookie != null && !string.IsNullOrEmpty(cartCookie.Value))
            {

                string[] items = cartCookie.Value.Split('|');//Add delimeters
                cartItems.AddRange(items);

            }

            return cartItems;
        }

        private void StoreCartItemsInCookie(List<string> cartItems)
        {
            HttpCookie cartCookie = new HttpCookie("Cart");


            cartCookie.Value = string.Join("|", cartItems);//Add delimeters


            cartCookie.Expires = DateTime.Now.AddDays(100);


            Response.Cookies.Add(cartCookie);
        }



        protected void lnkWishlist_Click(object sender, EventArgs e)
        {

            LinkButton lnkButton = (LinkButton)sender;
            int pid = Convert.ToInt32(lnkButton.CommandArgument);

            bool isInWishlist = IsInWishlist(pid.ToString());

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;

            if(Session["cid"] != null)
            {
                if (isInWishlist)
                {
                    deleteProductWishlist(pid);
                }
                else
                {
                    setwishlist(pid);
                }
                


            }
            else
            {
                Response.Cookies["pwid"].Value = pid.ToString();
                Response.Cookies["pwid"].Expires = DateTime.Now.AddDays(100);

                Response.Redirect("~/client/login.aspx");
            }


            con.Close();
            Response.Redirect("~/client/allproducts.aspx");



        }

        void  setwishlist(int pid)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;

            con.Open();
            icmd.CommandText = "INSERT INTO customer_wishlist (product_id,c_id) VALUES(@pid,@cid)";
            icmd.Parameters.AddWithValue("@pid", pid);

            icmd.Parameters.AddWithValue("@cid", Session["cid"]);

            icmd.ExecuteNonQuery();

            con.Close();

        }

        void deleteProductWishlist(int pid)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "DELETE FROM customer_wishlist where product_id=@pid AND c_id=@cid";
            icmd.Parameters.AddWithValue("@pid ",pid);
            icmd.Parameters.AddWithValue("@cid", Session["cid"]);


            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();
        }


        void GetSubCategory()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandText = "Select DISTINCT s.sub_category_id , s.sub_category\r\nFROM productsubcategory s ,  product p \r\nWHERE p.subcategory_id=s.sub_category_id";

            scmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable SubCategory = new DataTable();

            using (da)
            {
                da.Fill(SubCategory);
            }
            chkSub.DataSource = SubCategory;
            chkSub.DataTextField = "sub_category";
            chkSub.DataValueField = "sub_category_id";

            chkSub.DataBind();
        }


        void getBrand()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandText = "SELECT p.brand_id , b.brand , COUNT(p.brand_id) As total_brand\r\nfrom product p , brand b\r\nwhere p.brand_id=b.brand_id\r\nGROUP BY p.brand_id , b.brand\r\nORDER BY b.brand ASC";
            scmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable brand = new DataTable();


            using (da)
            {
                da.Fill(brand);
            }

            chkBrand.DataSource = brand;
            chkBrand.DataTextField = "brand";
            chkBrand.DataValueField = "brand_id";

            chkBrand.DataBind();


        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

            SearchProduct();
        }

        void SearchProduct()
        {
            //PERFORMING ADVANCE SEARCH
            string sqlbrand = "";
            string sqlSubCategory = "";
            string product = "";


            List<String> selectedCategories = chkSub.Items.Cast<ListItem>() //Retrieving subcategories
               .Where(item => item.Selected)
               .Select(item => item.Value)
               .ToList();


            List<String> selectedBrand = chkBrand.Items.Cast<ListItem>() //Retrieving brand
               .Where(item => item.Selected)
               .Select(item => item.Value)
               .ToList();



            if (txtSearch.Text != "")
            {
                product = "AND p.product_name LIKE '%' + @Pname + '%' ";

            }


            if (selectedCategories.Any())
            {
                sqlSubCategory = " AND (p.subcategory_id IN (" +
                 string.Join(",", selectedCategories.Select((_, index) => $"@subID{index}")) +
                 "))";

            }

            if (selectedBrand.Any())
            {
                sqlbrand = " AND (p.brand_id IN (" +
                string.Join(",", selectedBrand.Select((_, index) => $"@bid{index}")) +
                "))";
            }


            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT p.product_id, p.product_name, p.product_price, sc.sub_category, p.subcategory_id " +
                                "FROM product p " +
                                "JOIN productsubcategory sc ON p.subcategory_id = sc.sub_category_id " +
                                "WHERE p.status = 1 " + sqlbrand + sqlSubCategory + product +
                                " ORDER BY p.product_id DESC";


            cmd.Parameters.AddWithValue("@Pname", txtSearch.Text.Trim());


            for (int x = 0; x < selectedCategories.Count; x++)
            {
                cmd.Parameters.AddWithValue($"@subID{x}", selectedCategories[x]);
            }

            for (int i = 0; i < selectedBrand.Count; i++)
            {
                cmd.Parameters.AddWithValue($"@bid{i}", selectedBrand[i]);
            }

            SqlDataReader reader;
            con.Open();
            reader = cmd.ExecuteReader();
            rptProduct.DataSource = reader;
            rptProduct.DataBind();
            con.Close();
        }

        protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkWishlist = (LinkButton)e.Item.FindControl("lnkWishlist");

                string productId = DataBinder.Eval(e.Item.DataItem, "product_id").ToString();


                bool isInWishlist = IsInWishlist(productId);

               
                if (isInWishlist)
                {
                    lnkWishlist.CssClass = "mdi mdi-heart text-danger";
                }
                else
                {
                    lnkWishlist.CssClass = "mdi mdi-heart-outline text-danger";
                }

            }



        }

        private bool IsInWishlist(string productId)
        {
            bool flag = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            if (Session["cid"] != null)
            {
                scmd.CommandText = "SELECT COUNT(*) FROM customer_wishlist where product_id=@pid AND c_id =@cid";

                scmd.Parameters.AddWithValue("@pid", productId);
                scmd.Parameters.AddWithValue("@cid", Session["cid"]);


                con.Open();
                int count = (int)scmd.ExecuteScalar();
                con.Close();

                if (count > 0)
                {
                    flag = true;
                }
            }
            

            return flag;



        }





    }
}