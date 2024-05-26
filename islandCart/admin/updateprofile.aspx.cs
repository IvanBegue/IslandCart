using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
namespace islandCart.admin
{
    public partial class updateprofile : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                getUserInfo();
            }
        }

        void getUserInfo()
        {
            string id = (string)Session["uid"];
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * from [user] where user_id=@id";
            scmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            while (dr.Read())
            {
                txtFn.Text = dr["firstname"].ToString();
                txtLn.Text = dr["lastname"].ToString();
                txtEmail.Text = dr["email"].ToString();
                txtUserName.Text = dr["username"].ToString();
            }

            con.Close();


        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            int id = 1;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE [user] set firstname=@fn,lastname=@ln,username=@un,email=@em where user_id=@id";

            con.Open();
            ucmd.Parameters.AddWithValue("@fn",txtFn.Text.ToLower());
            ucmd.Parameters.AddWithValue("@ln",txtLn.Text.ToLower());
            ucmd.Parameters.AddWithValue("@un", txtUserName.Text.ToLower());
            ucmd.Parameters.AddWithValue("@em",txtEmail.Text.ToLower());
            ucmd.Parameters.AddWithValue("@id",id);
            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/updateprofile.aspx");

        }
    }
}