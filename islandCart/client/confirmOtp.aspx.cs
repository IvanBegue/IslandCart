using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace islandCart.client
{
   
    public partial class confirmOtp : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!Page.IsPostBack)
            {
               string  token = Request.QueryString["token"];
                if (Session["rtEmail"] == null || string.IsNullOrEmpty(Session["rtEmail"].ToString()) && token == null)
                {

                    Response.Redirect("~/client/index.aspx");
                }
                else
                {
                    MaskEmail();

                }
            }

        }

        void MaskEmail()
        {
            string email = (string)Session["rtEmail"];

            int atIndex = email.IndexOf('@');
            if (atIndex > 1) 
            {
                string maskedPart = new string('*', atIndex - 1);
                lblEmail.Text= $"{email[0]}{maskedPart}@{email.Substring(atIndex + 1)}";
            }

        }

        protected void btnChk_Click(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            string inputOtp = Encrypt(txtOtp.Text);

            if (inputOtp == token)
            {

                Response.Redirect("~/client/resetpassword.aspx");

            }
            else
            {
                Response.Redirect("~/client/confirmOtp.aspx?token="+token);
                txtOtp.Text = "";
                lblErr.Text = "Incorrect Otp";
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
               new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
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

    }
}