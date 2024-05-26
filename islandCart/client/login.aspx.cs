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
using System.Net;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;

namespace islandCart.client
{
    public partial class login : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (Request.Cookies["customerEmail"] != null && Request.Cookies["customerPassword"] != null)
                {
                    try
                    {
                        string email = Request.Cookies["customerEmail"].Value;
                        string password = Request.Cookies["customerPassword"].Value;

                        HdnEmail.Value = email;
                        HdnPassword.Value = password;
                        GeUserName();
                    }
                    catch (Exception ex)
                    {
                        
                        System.Diagnostics.Debug.WriteLine("Exception while retrieving cookies: " + ex.Message);
                    }
                }


            }

        }


        protected void btnlogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM customer WHERE email=@em AND password=@pwd";

            if (Request.Cookies["customerEmail"] != null && Request.Cookies["customerPassword"] != null &&
                !string.IsNullOrEmpty(Request.Cookies["customerEmail"].Value) && !string.IsNullOrEmpty(Request.Cookies["customerPassword"].Value))
            {

                cmd.Parameters.AddWithValue("@em", HdnEmail.Value.Trim());
                cmd.Parameters.AddWithValue("@pwd", Encrypt(HdnPassword.Value.Trim()));

            }else{

                cmd.Parameters.AddWithValue("@em", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", Encrypt(txtpassword.Text.Trim()));
            }


           
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                if (dr.Read())
                {
                    bool rememberMe = Request.Form["chkrememberme"] == "on";

                    //**COOKIES**///
                    Response.Cookies["customerEmail"].Value = txtemail.Text;
                    Response.Cookies["customerPassword"].Value = txtpassword.Text;

                    if (rememberMe)
                    {
                        Response.Cookies["customerEmail"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["customerPassword"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        Response.Cookies["customerEmail"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["customerPassword"].Expires = DateTime.Now.AddDays(-100);

                    }

                    string cid = dr["c_id"].ToString();
                    string firstname = dr["firstname"].ToString();
                    int st = Convert.ToInt32(dr["status"]);
                    string email = dr["email"].ToString();
                    if (st == 0)
                    {
                        //banned ACCOUNT MSG HERE
                    }
                    else
                    {
                        Session["cid"] = cid;
                        Session["sfn"] = firstname;
                        Session["email"] = email;
                        Session["sFlag"] = true;
                        CustomerAudit(cid);



                        if(Request.Cookies["returnUrl"] != null)
                        {
                            string returnUrl = Request.Cookies["returnUrl"].Value;

                            Response.Cookies["returnUrl"].Expires = DateTime.Now.AddDays(-1);

                            Response.Redirect(returnUrl);

                        }
                        else
                        {
                            setWishlist();
                        }
                        

                    }

                }




            }
            else
            {
                //INVALID CREDENTIALS MESSAGE GOES HERE
                Response.Redirect("~/client/login.aspx");
            }

            con.Close();

        }

        void GeUserName()
        {


            if (Request.Cookies["customerEmail"] != null && Request.Cookies["customerPassword"] != null)
            {

                string email = Request.Cookies["customerEmail"].Value;




                SqlConnection con = new SqlConnection(_conString);
                SqlCommand scmd = new SqlCommand();
                scmd.Connection = con;
                scmd.CommandType = CommandType.Text;
                scmd.CommandText = "SELECT * FROM customer where email=@em";
                scmd.Parameters.AddWithValue("@em", email);

                con.Open();
                SqlDataReader reader;

                reader = scmd.ExecuteReader();

                while (reader.Read())
                {
                    BtnLoginCookie.Visible = true;
                    BtnLoginCookie.Text = "Login As " + reader["firstname"];



                }
                con.Close();


            }







        }

            public string Encrypt(string cipherText)
            {
                // defining encrytion key
                string EncryptionKey = "MAKV2SPBNI99212";
                byte[] clearBytes = Encoding.Unicode.GetBytes(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey,
                   new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64,0x65, 0x76 });
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
                        cipherText = Convert.ToBase64String(ms.ToArray());

                    }
                    return cipherText;
                }

            }

            void  CustomerAudit(string cid)
            {
                string ip = "";
                string strHostName = "";
                strHostName = System.Net.Dns.GetHostName();
                IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
                IPAddress[] addr = ipEntry.AddressList;
                ip = addr[2].ToString();

                SqlConnection con = new SqlConnection(_conString);
                SqlCommand icmd = new SqlCommand();
                icmd.Connection = con;
                icmd.CommandText = "INSERT INTO customer_audit (c_id,ip_address) VALUES (@cid,@ip)";
                icmd.Parameters.AddWithValue("@cid",cid);
                icmd.Parameters.AddWithValue("@ip",ip);
                icmd.CommandType = CommandType.Text;

                con.Open();
                icmd.ExecuteNonQuery();
                con.Close();


            }



        void setWishlist()
        {

          

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;

            if(Request.Cookies["pwid"] != null)
            {
                string pid = Request.Cookies["pwid"].Value;
                con.Open();

                icmd.CommandText = "INSERT INTO customer_wishlist (product_id,c_id) VALUES(@pid,@cid)";
                icmd.Parameters.AddWithValue("@pid", pid);

                icmd.Parameters.AddWithValue("@cid",Session["cid"]);

                int rowAffected = icmd.ExecuteNonQuery();

                if (rowAffected > 0 )
                {
                    Response.Cookies["pwid"].Expires = DateTime.Now.AddDays(-100);

                    Response.Redirect("~/client/dashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/client/index.aspx");

                }


                con.Close();
            }
            else
            {
                Response.Redirect("~/client/index.aspx");
            }
               



            

        }

    }


}
