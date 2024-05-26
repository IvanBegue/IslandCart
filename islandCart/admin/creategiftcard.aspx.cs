using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace islandCart.admin
{
    public partial class adddiscount : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayGiftCard();
            }
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO giftcard (g_name,g_price,quantity,status) VALUES (@name,@prc,@qnt,@st)";

            con.Open();
            icmd.Parameters.AddWithValue("@name", txtName.Text.ToLower());
            icmd.Parameters.AddWithValue("@prc", txtPrice.Text);
            icmd.Parameters.AddWithValue("@qnt",txtQnt.Text);
            icmd.Parameters.AddWithValue("@st",1);
            icmd.ExecuteNonQuery();


            con.Close();

            Response.Redirect("~/admin/creategiftcard.aspx");



        }


        int currentRow = 1;
        protected void rptLovDiscount_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;

            }
        }

        void DisplayGiftCard()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM giftcard where status=1 ORDER BY g_id DESC";

            con.Open();

            SqlDataReader dr;
           
            dr = scmd.ExecuteReader();
            rptLovDiscount.DataSource = dr;
            rptLovDiscount.DataBind();
            con.Close();


        }

       

        protected void btnCnl_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/creategiftcard.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string id = btnEdit.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE giftCard SET g_name=@name,g_price=@prc,quantity=@qnt where g_id=@id";


            con.Open();
            ucmd.Parameters.AddWithValue("@id", id);
            ucmd.Parameters.AddWithValue("@name",txtName.Text.ToLower());
            ucmd.Parameters.AddWithValue("@prc",txtPrice.Text);
            ucmd.Parameters.AddWithValue("@qnt", txtQnt.Text);



            ucmd.ExecuteNonQuery();


            con.Close();

            Response.Redirect("~/admin/creategiftcard.aspx");







        }

        protected void btnEditDiscount_Click(object sender, EventArgs e)
        {

            HeaderDiscount.Text = "Update Giftcard";
            btnAdd.Visible = false;
            btnEdit.Visible = true;
            Button btnEditDiscount = (Button)sender;
            int id = int.Parse(btnEditDiscount.CommandArgument);

            btnEdit.CommandArgument =id.ToString();

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT * FROM giftcard where g_id=@id";

            scmd.Parameters.AddWithValue("@id", id);


            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();

            while (dr.Read())
            {
                txtName.Text = dr["g_name"].ToString();
                txtPrice.Text = dr["g_price"].ToString();
                txtQnt.Text = dr["quantity"].ToString();




            }
           
            con.Close();

        }

        

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string id = btnEdit.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE giftCard SET status=0 where g_id=@id";


            con.Open();
            ucmd.Parameters.AddWithValue("@id", id);
           



            ucmd.ExecuteNonQuery();


            con.Close();

            Response.Redirect("~/admin/creategiftcard.aspx");
        }
    }
}