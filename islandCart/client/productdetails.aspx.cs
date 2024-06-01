using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using islandCart.UserAuthentication;
using System.Security.Cryptography;


namespace islandCart.client
{
    public partial class productdetails : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private string pid;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            pid = Request.QueryString["q"];

            if (!Page.IsPostBack)
            {
                getProductDetails();
                GetTotalRating();
                SetSubmitButton();
                getAverageRating();
                getUserRecommendation();

                getRecommedation();
            }

        }



        void getProductDetails()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT  p.product_id,p.product_name,p.product_description,p.product_price, b.brand,p.weight,sc.sub_category ,c.category_name\r\nFROM product p , productsubcategory sc ,productcategory c , brand b\r\nWHERE \r\n    p.subcategory_id = sc.sub_category_id\r\n    AND sc.category_id = c.category_id\r\n    AND p.brand_id=b.brand_id\r\n    AND p.product_id = @pid";

            scmd.Parameters.AddWithValue("@pid", pid);

            SqlDataReader dr;
            con.Open();
            dr = scmd.ExecuteReader();

            if (dr.Read())
            {
                lblProductName.Text = dr["product_name"].ToString();
                lblDescription.Text= dr["product_description"].ToString();
                lblPrice.Text="Rs " + dr["product_price"].ToString();
                lblBrand.Text = dr["brand"].ToString();
                lblWeight.Text = dr["weight"].ToString();
                lblCategory.Text = dr["category_name"].ToString();
                lblTags.Text = dr["sub_Category"].ToString();
                getTotalSell();
                DisplayProductImage();
            }
            else
            {
                Response.Redirect("~/client/allproducts.aspx");
            }
            con.Close();

        }

        void getTotalSell()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "  select COUNT(product_id) As TotalSell\r\n    from orderline\r\n    where product_id=@pid";

            scmd.Parameters.AddWithValue("@pid", pid);

           
            con.Open();
            int totalOrder = (int)scmd.ExecuteScalar();

            lblTotalOrders.DataBind();
            lblTotalOrders.Text = totalOrder.ToString();
            con.Close();

        }

        void DisplayProductImage()
        {
            SqlConnection con = new SqlConnection(_conString);

            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;

            scmd.CommandText = "SELECT CONCAT(file_name, filePath)as FileName from product_file where product_id=@pid";

            scmd.Parameters.AddWithValue("@pid", pid);


            SqlDataAdapter da = new SqlDataAdapter(scmd);
            DataTable dt = new DataTable();

            using (da)
            {
                da.Fill(dt);
            }
            RptMainImg.DataSource = dt;

            RptMainImg.DataBind();

            RptSlideImg.DataSource = dt;

            RptSlideImg.DataBind();

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Authentication userAuth = new Authentication();


            if (!userAuth.IsUserLogin(Session))
            {
                Response.Redirect("~/client/login.aspx");
            }
            else
            {
                int rate = Convert.ToInt32(Request.Form["rate"]);
                SqlConnection con = new SqlConnection(_conString);
                SqlCommand icmd = new SqlCommand();

                icmd.Connection = con;
                icmd.CommandText = "INSERT INTO product_recommendation (description,product_id,c_id,rating) VALUES (@desc,@pid,@cid,@rate)";
                con.Open();
                icmd.Parameters.AddWithValue("@desc", txtReview.Text.Trim());
                icmd.Parameters.AddWithValue("@pid", pid);
                icmd.Parameters.AddWithValue("@cid", Session["cid"]);
                icmd.Parameters.AddWithValue("@rate", rate);

                icmd.CommandType = CommandType.Text;

                icmd.ExecuteNonQuery();
                con.Close();
                //Saveimage(lastid);
                Response.Redirect("~/client/productdetails.aspx?q=" + pid);
            }


           

        }

        void getUserRecommendation()
        {
            Authentication userAuth = new Authentication();

            if (userAuth.IsUserLogin(Session))
            {
                SqlConnection con = new SqlConnection(_conString);
                SqlCommand scmd = new SqlCommand();

                scmd.Connection = con;
                scmd.CommandType = CommandType.Text;
                scmd.CommandText = "SELECT * FROM  product_recommendation where c_id=@id AND status=1";

                scmd.Parameters.AddWithValue("@id", Session["cid"]);

                con.Open();

                SqlDataReader reader;

                reader = scmd.ExecuteReader();

                if (reader.HasRows)
                {
                    if (reader.Read())
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
            btnAdd.Visible = false;
            pnlRating.Visible = false;
            lblReview.Text = "Edit Your Review";
            pnlUserRating.Visible = true;
            txtReview.ReadOnly = true;
            btnRmv.Visible = true;
        }

        void SetSubmitButton()
        {
            Authentication userAuth = new Authentication();

            if (!userAuth.IsUserLogin(Session))
            {
                btnAdd.Visible = false;
                btnLogin.Visible = true;
            }
            else
            {
                btnAdd.Visible = true;
                btnLogin.Visible = false;

            }

        }


       

        void  Saveimage(int lastpid)
        {
            //if (Request.Files.Count > 0)
            //{
            //    foreach (string fileName in Request.Files)
            //    {
            //        HttpPostedFileBase file = request.Files[fileName];
            //        if (file != null && file.ContentLength > 0)
            //        {
            //            string savedFileName = Path.GetFileName(file.FileName);
            //            string savePath = Server.MapPath("~/assets/images/recommendatonimg/") + savedFileName;
            //            file.SaveAs(savePath);
                        
            //        }
            //    }
            //}
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int rate = Convert.ToInt32(Request.Form["rate"]);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand ucmd = new SqlCommand();
            ucmd.Connection = con;
            ucmd.CommandText = "UPDATE product_recommendation SET description=@desc,rating=@rate,date_posted=@dte where c_id=@cid";
            ucmd.Parameters.AddWithValue("@desc", txtReview.Text.ToLower());
            ucmd.Parameters.AddWithValue("@rate", rate);
            ucmd.Parameters.AddWithValue("@dte", DateTime.Now);

            ucmd.Parameters.AddWithValue("@cid", Session["cid"]);

            ucmd.CommandType = CommandType.Text;

            con.Open();
            ucmd.ExecuteNonQuery();
            con.Close();

            SetEditForm();
            btnSave.Visible = false;
            btnCancel.Visible = false;
            Response.Redirect("~/client/productdetails.aspx?q=" + pid);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetEditForm();
            btnSave.Visible = false;
            btnCancel.Visible = false;
        }

        protected void btnRmv_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "UPDATE product_recommendation set status=0 where c_id=@id";
            icmd.Parameters.AddWithValue("@id", Session["cid"]);



            icmd.CommandType = CommandType.Text;

            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/client/productdetails.aspx?q=" + pid);
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


        void getAverageRating()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT CASE WHEN\r\nAVG(rating) > 5 THEN 5 \r\nELSE AVG(rating)\r\nEND AS average_rating,\r\ncount(recommendation_id) As total_recommendation\r\nFROM product_recommendation WHERE status = 1 AND product_id=@pid";
            scmd.Parameters.AddWithValue("@pid", pid);
            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();
            if (dr.Read())
            {
                lblAvgRating.Text = dr["average_rating"].ToString();
                lblTotalReviews.Text = dr["total_recommendation"].ToString();
            }

            con.Close();
        }


        void GetTotalRating()
        {

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT    CAST((COUNT(CASE WHEN rating = 1 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_1,\r\nCAST((COUNT(CASE WHEN rating = 2 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_2,\r\nCAST((COUNT(CASE WHEN rating = 3 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_3,\r\nCAST((COUNT(CASE WHEN rating = 4 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_4,\r\nCAST((COUNT(CASE WHEN rating = 5 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) as INT )AS percentage_5\r\nFROM product_recommendation\r\nwhere status = 1 AND product_id=@pid";

            scmd.Parameters.AddWithValue("@pid", pid);
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


        void getRecommedation()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT \r\n  r.recommendation_id,\r\n  r.description,\r\n  r.rating,\r\n  FORMAT(CAST(r.date_posted AS datetime), 'dd MMM yyyy HH:mm') AS date_posted,\r\n  r.c_id,\r\n  CONCAT(c.firstname, ' ', c.lastname) AS UserName,\r\n  c.profile_img\r\nFROM \r\n  customer c \r\nJOIN \r\n  product_recommendation r ON r.c_id = c.c_id\r\nWHERE \r\n  r.product_id = @pid\r\n  AND r.status = 1 \r\nORDER BY \r\n  r.recommendation_id DESC;";

            scmd.Parameters.AddWithValue("@pid", pid);

            SqlDataAdapter da1 = new SqlDataAdapter(scmd);
            DataTable reviews = new DataTable();

            using (da1)
            {
                da1.Fill(reviews);
            }

            rptRecommendation.DataSource = reviews;
            rptRecommendation.DataBind();

        }
    }
}