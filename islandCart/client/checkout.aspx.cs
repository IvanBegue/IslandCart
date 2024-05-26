using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;

namespace islandCart.client
{
    public partial class checkout : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString;
        private object con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getSelectItem();
            }
        }

        void getSelectItem()
        {
            List<int> selectedProductIds = Session["SelectedProductId"] as List<int>;

            if (selectedProductIds != null && selectedProductIds.Any())
            {
                using (SqlConnection con = new SqlConnection(_conString))
                {
                    con.Open();

                    using (SqlCommand scmd = new SqlCommand())
                    {
                        string parameterNames = string.Join(",", selectedProductIds.Select((id, index) => $"@pid{index}"));
                        string whereClause = string.Join(" OR ", selectedProductIds.Select((id, index) => $"p.product_id = @pid{index}"));

                        scmd.CommandText = "SELECT p.product_id, p.product_name, p.product_price, CONCAT(pf.file_name, '', pf.filepath) AS fileName " +
                                            "FROM product p " +
                                            "JOIN (SELECT pf.product_id, MIN(pf.file_id) AS min_file_id FROM product_file pf GROUP BY pf.product_id) max_pf " +
                                            "ON max_pf.product_id = p.product_id " +
                                            "JOIN product_file pf ON pf.product_id = max_pf.product_id AND pf.file_id = max_pf.min_file_id " +
                                            $"WHERE {whereClause}";

                        scmd.Connection = con;

                        // Add parameters dynamically
                        for (int i = 0; i < selectedProductIds.Count; i++)
                        {
                            scmd.Parameters.AddWithValue($"@pid{i}", selectedProductIds[i]);
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(scmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            rptCheckoutCart.DataSource = dt;
                            rptCheckoutCart.DataBind();
                        }
                    }
                }
            }

        }
    }
}