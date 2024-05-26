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
    public partial class color : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                getColor();
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT  INTO color (color) VALUES (@clr)";

            con.Open();

            icmd.Parameters.AddWithValue("@clr",txtColor.Text);
       
            icmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/color.aspx");

        }
       

      

        void getColor()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM COLOR order by color desc";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptColor.DataSource = dr;
            rptColor.DataBind();
            con.Close();
        }
        int currentRow = 1;
        protected void rptColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }

        

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = true;
            pnlAdd.Visible = false;
            Button btnId = (Button)sender;
            string id = btnId.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM color where color=@id";
            scmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                btnSave.CommandArgument = dr["color"].ToString();
                string color = dr["color"].ToString();
                DvColor.Style["background-color"] = color;

            }
            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Button btnId = (Button)sender;
            string id = btnId.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE color set color=@new where color=@clr";

            con.Open();
            ucmd.Parameters.AddWithValue("@new", txtNwColor.Text);
            ucmd.Parameters.AddWithValue("@clr", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/color.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {

            Button btnId = (Button)sender;
            string id = btnId.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "DELETE FROM color where color=@clr";

            con.Open();

            ucmd.Parameters.AddWithValue("@clr", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/color.aspx");
        }
    }
}