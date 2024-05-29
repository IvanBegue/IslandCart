using System;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;
using System.Net;
using System.Web.UI.WebControls;
using Antlr.Runtime.Tree;
using System.Threading.Tasks;
using System.Web;
using System.Drawing;

namespace islandCart.client
{
    public partial class registration : System.Web.UI.Page

    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void btnregister_Click(object sender, EventArgs e)
        {

            try
            {
                if (IsEmailFound())
                {
                    lblEmailErr.Visible = true;
                    lblEmailErr.Text = "Email already registed login instead";

                }
                else
                {
                    CreateAccount();

                }
            }
            catch
            {
               

                Response.Redirect("~/client/errorpage.aspx");
            }
           
        }


        void CreateAccount()
        {

            int lastCid;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            //icmd.Connection = con;
            icmd.CommandText = "INSERT INTO CUSTOMER (firstname,lastname,email,password) VALUES (@fn,@ln,@em,@pwd);SELECT SCOPE_IDENTITY();";
            icmd.Parameters.AddWithValue("@fn", fn.Text.Trim().ToLower());
            icmd.Parameters.AddWithValue("@ln", ln.Text.Trim().ToLower());
            icmd.Parameters.AddWithValue("@em", userEmail.Text.Trim().ToLower());
            icmd.Parameters.AddWithValue("@pwd", Encrypt(pwd.Text.Trim()));
            icmd.CommandType = CommandType.Text;

            con.Open();
            lastCid= Convert.ToInt32(icmd.ExecuteScalar());
            
            con.Close();

            LoginUser(lastCid);

      



        }


        void LoginUser(int lastCid)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandText = "SELECT * FROM customer WHERE c_id=@id";
            scmd.Parameters.AddWithValue("@id", lastCid);
            SqlDataReader dr;
            con.Open();
            dr = scmd.ExecuteReader();

            if (dr.HasRows)
            {

                if (dr.Read())
                {
                    string cid = dr["c_id"].ToString();
                    string firstname = dr["firstname"].ToString();
                    
                    string email = dr["email"].ToString();

                    Session["cid"] = cid;
                    Session["sfn"] = firstname;
                    Session["email"] = email;
                    Session["sFlag"] = true;

                    CustomerAudit(cid);

                    Response.Redirect("~/client/index.aspx");
                }
            }

        }

        void CustomerAudit(string cid)
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
            icmd.Parameters.AddWithValue("@cid", cid);
            icmd.Parameters.AddWithValue("@ip", ip);
            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();


        }


        bool IsEmailFound()
        {
            bool found = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.Text;
            scmd.Connection = con;
            scmd.CommandText = "SELECT email FROM customer WHERE email=@em";
            scmd.Parameters.AddWithValue("@em", userEmail.Text.Trim().ToLower());

            SqlDataReader dr;
            con.Open();

            dr = scmd.ExecuteReader();

            if (dr.HasRows)
            {
                
                    found = true;
                
            }
            con.Close();

            return found;

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


    }
}