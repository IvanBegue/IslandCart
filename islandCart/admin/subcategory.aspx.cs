using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace islandCart.admin
{
    public partial class subcategory : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getCategory();
                displaySubCategory();
            }

           
        }

        public void getCategory()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT category_id,category_name FROM productcategory order by category_name ASC";
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }

            ddlCat.DataSource = dtcat;
            ddlCat.DataTextField = "category_name";
            ddlCat.DataValueField = "category_id";

            ddlCat.DataBind();

        }

        void displaySubCategory()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECt sc.sub_category_id,sc.sub_category ,sc.category_id,c.category_name\r\nFROM productsubcategory sc, productcategory c\r\nWHERE sc.category_id=c.category_id  and sc.status=1 order by sc.sub_category_id DESC";
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            rptsubCategory.DataSource = dr;
            rptsubCategory.DataBind();
            con.Close();

        }

        int currentRow = 1;
        protected void rptsubCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "INSERT INTO productsubcategory (sub_category,category_id) VALUES (@sub,@cid)";

            con.Open();
            icmd.Parameters.AddWithValue("@sub",txtsub.Text.Trim().ToLower());
            icmd.Parameters.AddWithValue("@cid", ddlCat.Text);
            icmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/subcategory.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlUpdate.Visible = true;
            pnlAdd.Visible = false;
           

            Button Buttonsid = (Button)sender;
            int sid = int.Parse(Buttonsid.CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT sc.sub_category_id,sc.sub_category,c.category_name,sc.category_id\r\nFROM productsubcategory sc ,productcategory c\r\nwhere sc.sub_category_id=@sid  AND sc.category_id=c.category_id ";
            scmd.Parameters.AddWithValue("@sid", sid);
            con.Open();
            SqlDataReader dr;
            dr = scmd.ExecuteReader();

            while (dr.Read())
            {
                txtNewSubcat.Text = dr["sub_category"].ToString();
                txtCatName.Text = dr["category_name"].ToString();
                txtsid.Text = dr["sub_category_id"].ToString();
                



                fetchCategoryDropDown();

            }

            con.Close();


           
        }

        void fetchCategoryDropDown()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT category_id,category_name FROM productcategory  order by category_name ASC";
            cmd.Connection = con;
          
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtcat = new DataTable();

            using (da)
            {
                da.Fill(dtcat);
            }

            ddlcat2.DataSource = dtcat;
            ddlcat2.DataTextField = "category_name";
            ddlcat2.DataValueField = "category_id";

            ddlcat2.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE productsubcategory SET sub_category=@sub ,category_id=@cid where sub_category_id=@sid";

            con.Open();
            ucmd.Parameters.AddWithValue("@sub", txtNewSubcat.Text.ToLower());
            ucmd.Parameters.AddWithValue("@cid", ddlcat2.Text);
            ucmd.Parameters.AddWithValue("@sid", txtsid.Text);
            ucmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/subcategory.aspx");

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            Button ButtonSid = (Button)sender;
            int sid = int.Parse(ButtonSid.CommandArgument);

            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE productsubcategory SET status=0 where sub_category_id=@sid";

            con.Open();
            ucmd.Parameters.AddWithValue("@sid", sid);
           
            ucmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/subcategory.aspx");

        }
    }


}