using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace islandCart
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //getUserInfo();
            }
        }

        void getUserInfo()
        {
            string id = (string)Session["uid"];
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT user_id ,CONCAT(lastname, ' ' , firstname) as fn  \r\nFROM [user]\r\nwhere user_id=@id";
            con.Open();
            scmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr;
            dr = scmd.ExecuteReader();
            while (dr.Read())
            {
                lblFnName.Text = dr["fn"].ToString();
            }
           

            con.Close();



        }
    }
}