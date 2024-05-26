using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace islandCart.admin
{
    public partial class login : System.Web.UI.Page
    {

        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM [user] where username=@name OR email=@name";
            con.Open();
            scmd.Parameters.AddWithValue("@name",txtname.Text);
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            if (dr.HasRows)
            {

                if (dr.Read())
                {
                     Session["uid"] = dr["user_id"].ToString();
                    Response.Redirect("~/admin/panel.aspx");

                }
            }


            con.Close();

        }
    }
}