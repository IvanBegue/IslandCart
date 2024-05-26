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
    public partial class brand : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getBrand();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO brand (brand) VALUES(@txtbrand)";

            con.Open();
            icmd.Parameters.AddWithValue("@txtbrand",txtBrand.Text.ToLower());
            icmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/brand.aspx");


        }
        int currentRow = 1;
        protected void rptBrand_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }

        void getBrand()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT *\r\nFROM brand where status=1 ORDER BY brand_id desc";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptBrand.DataSource = dr;
            rptBrand.DataBind();
            con.Close();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnId = (Button)sender;
            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE brand set brand=@bname where brand_id=@id";

            con.Open();
            ucmd.Parameters.AddWithValue("bname",txtBrand.Text.ToLower());
            ucmd.Parameters.AddWithValue("@id", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/brand.aspx");
        }

        protected void btnEdt_Click(object sender, EventArgs e)
        {
            lblHeader.Text = "Update Brand";
            btnAdd.Visible = false;
            btnEdit.Visible = true;
            Button btnId = (Button)sender;
            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM brand where brand_id=@id";
            scmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                txtBrand.Text = dr["brand"].ToString();
                btnEdit.CommandArgument = dr["brand_id"].ToString();

            }
            con.Close();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnId = (Button)sender;
            int id = int.Parse(btnId.CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE brand set status=0 where brand_id=@id";

            con.Open();
            
            ucmd.Parameters.AddWithValue("@id", id);

            ucmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/brand.aspx");
        }
    }

}