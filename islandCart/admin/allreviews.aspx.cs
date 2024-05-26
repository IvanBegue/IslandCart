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
    public partial class allreviews : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getTestimonials();
            }
        }


        int currentRow = 1;
        protected void rptReviews_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;

            }
        }


        void getTestimonials()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT c.c_id,Concat(c.lastname,' ' ,c.firstname) As Customer_Name, c.profile_img AS UserPicture,t.testimonials_id,t.description,t.rating,FORMAT(t.date_posted,'dd/MM/yyyy ') As date_posted\r\nFROM testimonials t , customer c\r\nWHERE t.c_id=c.c_id and t.status=1\r\norder by t.testimonials_id desc";

            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();
            rptReviews.DataSource = dr;
            rptReviews.DataBind();
            con.Close();


        }

      

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Button btnDel = (Button)sender;
            string id = btnDel.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "UPDATE testimonials set status=0 where testimonials_id=@id";
            icmd.Parameters.AddWithValue("id", Convert.ToInt32(id));



            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/admin/allreviews.aspx");
        }
    }
}