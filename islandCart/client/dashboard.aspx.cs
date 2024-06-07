using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace islandCart.client
{
    public partial class dashboard : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                if (Session["cid"] == null || string.IsNullOrEmpty(Session["cid"].ToString()))
                {
                    Response.Redirect("~/client/index.aspx");
                }
                else
                {
                    getCustomerData();
                    getWishList();
                    getOrder();
                }









            }
        }

        protected void btnInfo_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            con.Open();
            ucmd.CommandText = "UPDATE CUSTOMER SET firstname=@fn ,lastname=@ln,phone=@phn where c_id=@cid";
            ucmd.Parameters.AddWithValue("@fn", txtfn.Text.Trim().ToLower());
            ucmd.Parameters.AddWithValue("@ln", txtln.Text.Trim().ToLower());
            ucmd.Parameters.AddWithValue("@phn", txtphn.Text.Trim().ToLower());
            ucmd.Parameters.AddWithValue("@cid", Session["cid"]);

            ucmd.ExecuteNonQuery();
            //ADD ALERT MESSAGE
            Response.Redirect("~/client/dashboard.aspx");


        }

         void getCustomerData()
         {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM customer where c_id=@cid";
            scmd.Parameters.AddWithValue("@cid", Session["cid"]);

            con.Open();
            SqlDataReader reader;

            reader = scmd.ExecuteReader();

            while (reader.Read())
            {
                txtfn.Text = reader["firstname"].ToString();
                txtln.Text = reader["lastname"].ToString();
                txtphn.Text = reader["phone"].ToString();

            }
            con.Close();

         }

        protected void chknewsletter_CheckedChanged(object sender, EventArgs e)
        {   
            if (chknewsletter.Checked)
            {
                SqlConnection con = new SqlConnection(_conString);
                SqlCommand icmd = new SqlCommand();
                icmd.Connection = con;
                icmd.CommandText = "INSERT INTO newslettersubcriber (email) values(@em)";
                icmd.Parameters.AddWithValue("@em", Session["email"]);
                icmd.CommandType = CommandType.Text;
                con.Open();
                icmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/client/dashboard.aspx");


            }
        }


        void getWishList()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "SELECT w.wishlist_id, p.product_id,p.product_name , p.product_price , p.quantity from product p ,customer_wishlist w where w.product_id=p.product_id AND w.c_id=@cid";
            scmd.Parameters.AddWithValue("@cid",Session["cid"]);
            scmd.Connection = con;
            SqlDataAdapter da1 = new SqlDataAdapter(scmd);
            DataTable productDetails = new DataTable();

            using (da1)
            {
                da1.Fill(productDetails);
            }


            rptWishlist.DataSource = productDetails;
            rptWishlist.DataBind();



        }

       

        protected void lnkButtonDel_Click(object sender, EventArgs e)
        {
            LinkButton lnkButton = (LinkButton)sender;
            int wid = Convert.ToInt32(lnkButton.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "DELETE FROM customer_wishlist where wishlist_id=@wid";
            icmd.Parameters.AddWithValue("@wid", wid);



            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/client/dashboard.aspx");

        }



        protected string DisplayProductImage(object pid)
        {

            string product_id = pid.ToString();
            string imageUrl= getProductImage(product_id);

            return imageUrl;

        }

       string getProductImage(string pid)
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT CONCAT(file_name, filePath)as FileName from product_file where product_id=@pid order by file_id asc ";

            scmd.Parameters.AddWithValue("@pid", pid);


            SqlDataReader dr;

            con.Open();
            string imageUrl = "";
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                imageUrl = dr["FileName"].ToString();

            }

            return imageUrl;

       }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            con.Open();
            ucmd.CommandText = "UPDATE customer set password=@pwd where c_id=@cid";
            ucmd.Parameters.AddWithValue("@pwd", Encrypt(txtConpwd.Text));
           
            ucmd.Parameters.AddWithValue("@cid", Session["cid"]);

            ucmd.ExecuteNonQuery();
            //ADD ALERT MESSAGE
            Response.Redirect("~/client/logout.aspx"); //HERE SIGNOUT 
        }

        public string Encrypt(string clearText)
        {
            // defining encrytion key 
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new
    byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    // encoding using key 
                    using (CryptoStream cs = new CryptoStream(ms,
    encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        void getOrder()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "SELECT \r\n    o.order_id, \r\n    FORMAT(CAST(o.order_date AS datetime), 'dd/MM/yyyy HH:mm') AS order_date,\r\n    LOWER(o.status) as orderStatus, \r\n    COUNT(ot.product_id) AS product_count,\r\n\tSUM(p.product_price*ot.quantity) AS subtotal\r\nFROM \r\n    orders o\r\nJOIN \r\n    order_item ot ON o.order_id = ot.order_id\r\nJoin \r\n\tproduct p ON p.product_id=ot.product_id\r\nWHERE o.c_id=@cid\r\nGROUP BY \r\n    o.order_id, \r\n    o.order_date, \r\n    o.status,\r\n\tp.product_id\r\n";
            scmd.Parameters.AddWithValue("@cid", Session["cid"]);
            scmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();

            using (da)
            {
                da.Fill(dt);
            }


            rptOrder.DataSource = dt;
            rptOrder.DataBind();


        }



    }
}