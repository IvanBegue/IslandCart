using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace islandCart.client
{
    public partial class index : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (!IsPostBack)
            {
                Page.Title = "Home";
                getCategory();
            }
        }

        void getCategory()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM productCategory WHERE status=1";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptCategory.DataSource = dr;
            rptCategory.DataBind();
            con.Close();


        }
    }
}