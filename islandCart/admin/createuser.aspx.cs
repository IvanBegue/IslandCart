using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.WebSockets;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Configuration;
using System.Text;
using System.IO;
using System.Configuration;
using System.Net;

namespace islandCart.admin
{
    public partial class createuser : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        private  string Password = "12345678"; //Default Password
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                getRole();
                getUser();
                ListItem li = new ListItem("-- Select an Option --", "-1");
                ddlRole.Items.Insert(0, li);
            }

        }



        void getRole()
        {
          

            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();

            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT * FROM role";
            scmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(scmd);

            DataTable dtRole = new DataTable();


            using (dtRole)
            {
                da.Fill(dtRole);
            }

            ddlRole.DataSource = dtRole;

            ddlRole.DataTextField = "role";
            ddlRole.DataValueField = "role_id";

            ddlRole.DataBind();

        }

        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand icmd = new SqlCommand();

            icmd.Connection = con;

            icmd.CommandText = "INSERT INTO [user] (firstname,lastname,role_id,username,password,email) VALUES(@fn,@ln,@rid,@user,@pwd,@em)";

            string Password = "12345678";

            con.Open();

            icmd.Parameters.AddWithValue("@fn", txtFn.Text.ToLower());
            icmd.Parameters.AddWithValue("@ln", txtLn.Text.ToLower());
            icmd.Parameters.AddWithValue("@rid", ddlRole.SelectedValue);
            icmd.Parameters.AddWithValue("@user", txtUserName.Text);
            icmd.Parameters.AddWithValue("@pwd", Encrypt(Password));
            icmd.Parameters.AddWithValue("@em", txtEmail.Text.ToLower());

            icmd.ExecuteNonQuery();

            con.Close();
            sendemail();
            Response.Redirect("~/admin/createuser.aspx");


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




        private void sendemail()
        {

           

            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "Account Created Successfully";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear "+ txtFn.Text.ToLower()+" your account has been created Successfully\n");
                    msgBody.Append("Your Login Password : 12345678 \n\n");
                    msgBody.Append("Your Username :"+txtUserName.Text);



                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }


        void getUser()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "select u.user_id , u.firstname,u.lastname,u.username,u.email,u.status ,r.role\r\nfrom [user] u , role r\r\nwhere u.role_id =r.role_id\r\norder by u.user_id desc";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptUser.DataSource = dr;
            rptUser.DataBind();
            con.Close();
        }
        int currentRow = 1;
        protected void rptUser_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }
    }


}