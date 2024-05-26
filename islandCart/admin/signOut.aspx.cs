using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace islandCart.admin
{
    public partial class signOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Logout();
            }

        }
        void Logout()
        {

            Session.RemoveAll();

            Session.Abandon();

            Response.Redirect("~/admin/login.aspx");
        }
    }
}