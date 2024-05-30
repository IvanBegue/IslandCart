using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace islandCart.UserAuthentication
{
    public class Authentication
    {
        public bool IsUserLogin(HttpSessionState session)
        {
            bool flag = true;

            if (session["cid"] == null)
            {
                flag = false;
            }

            return flag;


        }
    }
}