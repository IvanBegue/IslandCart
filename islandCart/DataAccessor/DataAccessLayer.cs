using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace islandCart.DataAccessor
{
    public class DataAccessLayer
    {
        private readonly string _conString;

        public DataAccessLayer()
        {
            _conString = WebConfigurationManager.ConnectionStrings["islandCartDB"].ConnectionString; 
        }

        public SqlDataReader GetQuery(string query, out SqlConnection con)
        {

            con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand
            {
                Connection = con,
                CommandType = CommandType.Text,
                CommandText = query
            };

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return reader;

        }
    }
}