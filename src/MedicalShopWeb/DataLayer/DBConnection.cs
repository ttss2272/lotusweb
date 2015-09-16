using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Configuration;


namespace DataLayer
{
    public class DBConnection
    {
        public SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConMedical"].ToString());

            return conn;
        }
    }
}
