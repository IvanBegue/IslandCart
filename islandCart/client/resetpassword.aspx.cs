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
using System.IO;
using System.Text;

namespace islandCart.client
{
    public partial class resetpassword : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["rtEmail"] == null || string.IsNullOrEmpty(Session["rtEmail"].ToString()))
                {

                    Response.Redirect("~/client/index.aspx");
                }
            }
           
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            con.Open();
            ucmd.CommandText = "UPDATE customer set password=@pwd where email=@em";
            ucmd.Parameters.AddWithValue("@pwd", Encrypt(txtConfirm.Text));

            ucmd.Parameters.AddWithValue("@em", Session["rtEmail"]);

            ucmd.ExecuteNonQuery();

            Session.RemoveAll();

            Session.Abandon();
            //ADD ALERT MESSAGE
            Response.Redirect("~/client/login.aspx");
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