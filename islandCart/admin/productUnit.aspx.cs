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
    public partial class productUnit : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getUnit();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO unit (unit,unit_abbr) VALUES (@uit,@ubbr)";
            
            con.Open();
            icmd.Parameters.AddWithValue("@uit", txtWeight.Text.ToLower());
            icmd.Parameters.AddWithValue("@ubbr", txtAbbr.Text.ToLower());

            icmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("~/admin/productUnit.aspx");

        }

        int currentRow = 1;
        protected void rptUnit_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }

        void getUnit()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT u_id,unit,unit_abbr FROM unit where status=1";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptUnit.DataSource = dr;
            rptUnit.DataBind();
            con.Close();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnId = (Button)sender;
            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE unit set status=0 where u_id=@uid";

            con.Open();

            ucmd.Parameters.AddWithValue("@uid", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/productunit.aspx");
        }

        protected void btnEdt_Click(object sender, EventArgs e)
        {
            lblHeader.Text = "Update Product Unit";
            btnAdd.Visible = false;
            btnEdit.Visible = true;

            Button btnId = (Button)sender;
            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM unit where u_id=@id AND status=1";
            scmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                txtWeight.Text = dr["unit"].ToString();
                txtAbbr.Text = dr["unit_abbr"].ToString();
                btnEdit.CommandArgument = dr["u_id"].ToString();


            }
            con.Close();

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnId = (Button)sender;

            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE unit set unit=@uit ,unit_abbr=@ubbr WHERE u_id=@uid";

            con.Open();

            ucmd.Parameters.AddWithValue("@uit", txtWeight.Text.ToLower());
            ucmd.Parameters.AddWithValue("@ubbr", txtAbbr.Text.ToLower());
            ucmd.Parameters.AddWithValue("@uid", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/productunit.aspx");
        }
    }
}