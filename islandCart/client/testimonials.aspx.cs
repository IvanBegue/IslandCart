using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Diagnostics;
using static System.Runtime.CompilerServices.RuntimeHelpers;
using System.Security.Cryptography;
namespace islandCart.client
{
    public partial class testimonials : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                CheckUserLogin();
                GetTotalRating();
                getAverageRating();
                GetTestimonials();
                getUserReview();
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
         

                
                int rate = Convert.ToInt32(Request.Form["rate"]);

                SqlConnection con = new SqlConnection(_conString);
                SqlCommand icmd = new SqlCommand();
                icmd.Connection = con;
                icmd.CommandText = "INSERT INTO testimonials (c_id,description,rating) VALUES(@cid,@desc,@rate)";
                icmd.Parameters.AddWithValue("@cid", Session["cid"]);
                icmd.Parameters.AddWithValue("@desc", txtReview.Text.ToLower());
                icmd.Parameters.AddWithValue("@rate", rate);


                icmd.CommandType = CommandType.Text;

                con.Open();
                icmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/client/testimonials.aspx");
            
            




        }

        void GetTotalRating()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT \r\n    CAST((COUNT(CASE WHEN rating = 1 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_1,\r\n\r\n    CAST((COUNT(CASE WHEN rating = 2 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_2,\r\n\r\n    CAST((COUNT(CASE WHEN rating = 3 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_3,\r\n\r\n    CAST((COUNT(CASE WHEN rating = 4 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_4,\r\n\r\n    CAST((COUNT(CASE WHEN rating = 5 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_5\r\nFROM \r\n    testimonials\r\n\r\nwhere status = 1";

            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();

            while (dr.Read())
            {
                lblBar5.Width = Convert.ToInt32(dr["percentage_5"].ToString());
                lblTotal5.Text = dr["percentage_5"].ToString() + "%";


                lblBar4.Width = Convert.ToInt32(dr["percentage_4"].ToString());
                lblTotal4.Text = dr["percentage_4"].ToString() + "%";

                lblBar3.Width = Convert.ToInt32(dr["percentage_3"].ToString());
                lblTotal3.Text = dr["percentage_3"].ToString() + "%";

                lblBar2.Width = Convert.ToInt32(dr["percentage_2"].ToString());
                lblTotal2.Text = dr["percentage_2"].ToString() + "%";

                lblBar1.Width = Convert.ToInt32(dr["percentage_1"].ToString());
                lblTotal1.Text = dr["percentage_1"].ToString() + "%";
            }

            con.Close();





        }

        void getAverageRating()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT CASE\r\nWHEN AVG(rating) > 5 THEN 5\r\nELSE AVG(rating)\r\nEND AS average_rating,\r\ncount(testimonials_id) As total_testimonial\r\nFROM testimonials\r\nWHERE status = 1";

            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();
            if (dr.Read())
            {
                lblAvgRating.Text = dr["average_rating"].ToString();
                lblTotalReviews.Text = dr["total_testimonial"].ToString();
            }
           
            con.Close();
        }

        void GetTestimonials()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT t.testimonials_id,t.description,t.rating,FORMAT(t.date_posted, 'dd MMM yyyy HH:mm') As date_posted,c.c_id,CONCAT(c.firstname,' ',c.lastname) as UserName ,c.profile_img\r\nFROM customer c , testimonials t\r\nwhere t.c_id=c.c_id AND t.status=1\r\nORDER by t.testimonials_id desc";

            scmd.Connection = con;
            SqlDataAdapter da1 = new SqlDataAdapter(scmd);
            DataTable TestimonialsDetails = new DataTable();

            using (da1)
            {
                da1.Fill(TestimonialsDetails);
            }

            rptTestimonials.DataSource = TestimonialsDetails;
            rptTestimonials.DataBind();
           


        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "UPDATE testimonials set status=0 where c_id=@id";
            icmd.Parameters.AddWithValue("@id", Session["cid"]);
          


            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/client/testimonials.aspx");

        }

        void CheckUserLogin()
        {
            if (Session["cid"] == null) 
            {
                string returnUrl = HttpContext.Current.Request.Url.PathAndQuery;

                Response.Cookies["returnUrl"].Value = returnUrl;
                Response.Cookies["returnUrl"].Expires = DateTime.Now.AddDays(1);

                btnToLogin.Visible = true;
                btnPost.Visible = false;
            }
            else
            {
                btnToLogin.Visible = false;
                btnPost.Visible = true;
            }
        }


        void getUserReview()
        {
            if (Session["cid"] != null)
            {
                



                SqlConnection con = new SqlConnection(_conString);
                SqlCommand scmd = new SqlCommand();

                scmd.Connection = con;
                scmd.CommandType = CommandType.Text;
                scmd.CommandText = "SELECT * FROM testimonials where c_id=@id AND status=1";

                scmd.Parameters.AddWithValue("@id", Session["cid"]);

                con.Open();

                SqlDataReader reader;

                reader = scmd.ExecuteReader();

                if (reader.HasRows)
                {
                    if(reader.Read())
                    {
                        SetEditForm();
                        lblHeader.Text = "Thank you for your review";
                        txtReview.Text = reader["description"].ToString();
                        lblRating.Text = reader["rating"].ToString();
                    }
                }
                   

                con.Close();
            }

        }

        void SetEditForm()
        {
            btnEdit.Visible = true;
            btnPost.Visible = false;
            pnlRating.Visible = false;
            lblReview.Text = "Edit Your Review";
            pnlUserRating.Visible = true;
            txtReview.ReadOnly = true;
            btnRmv.Visible = true;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlRating.Visible = true;
            btnEdit.Visible = false;
            btnRmv.Visible = false;
            btnSave.Visible = true;
            btnCancel.Visible = true;
            txtReview.ReadOnly = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditForm();
            btnSave.Visible = false;
            btnCancel.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            int rate = Convert.ToInt32(Request.Form["rate"]);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE testimonials set description=@desc, rating=@rate,date_posted=@dte WHERE c_id=@id";
            ucmd.Parameters.AddWithValue("@desc", txtReview.Text.ToLower());
            ucmd.Parameters.AddWithValue("@rate", rate);
            ucmd.Parameters.AddWithValue("@dte", DateTime.Now);

            ucmd.Parameters.AddWithValue("@id", Session["cid"]);

            ucmd.CommandType = CommandType.Text;

            con.Open();
            ucmd.ExecuteNonQuery();
            con.Close();

            SetEditForm();
            btnSave.Visible = false;
            btnCancel.Visible = false;
            Response.Redirect("~/client/testimonials.aspx");
        }
    }
}