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
    public partial class listproduct : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;



        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                getProducts();
            }

        }

        void getProducts()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();

            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "SELECT p.product_id, p.product_name,FORMAT(p.date_added ,'dd/MM/yyyy') As date_posted,p.product_price,p.quantity,sc.sub_category,c.category_name,b.brand,\r\nCONCAT(pf.file_name, '', pf.filepath) AS fileName \r\nFROM product p\r\nJOIN (SELECT pf.product_id, MIN(pf.file_id) AS max_file_id\r\nFROM product_file pf\r\nGROUP BY pf.product_id) max_pf ON max_pf.product_id = p.product_id\r\nJOIN product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.max_file_id\r\nJOIN productsubcategory sc ON p.subcategory_id=sc.sub_category_id \r\nJOIN productcategory c ON  sc.category_id=c.category_id\r\nJOIN brand b on  p.brand_id=b.brand_id\r\nWHERE p.status=1\r\nORDER BY  p.product_id DESC";

            con.Open();

            SqlDataReader dr;

            dr = scmd.ExecuteReader();
            rptProduct.DataSource = dr;
            rptProduct.DataBind();
            con.Close();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Button btnDel = (Button)sender;
            string pid = btnDel.CommandArgument;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand icmd = new SqlCommand();
            icmd.Connection = con;
            icmd.CommandText = "Update product set status=0 where product_id=@id";
            icmd.Parameters.AddWithValue("@id", Convert.ToInt32(pid));

            icmd.CommandType = CommandType.Text;
            con.Open();
            icmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/admin/listproduct.aspx");

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnDel = (Button)sender;
            string pid = btnDel.CommandArgument;

            string PagePath = "~/admin/editproduct.aspx?q="+pid;

            Response.Redirect(PagePath);

        }

        protected void btnStock_Click(object sender, EventArgs e)
        {

        }
        int currentRow = 1;
        protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label rowNumber = (Label)e.Item.FindControl("lblRowCount");
                rowNumber.Text = currentRow.ToString();
                currentRow++;
            }
        }
    }
}