using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{

    public class DLCountry
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public string SaveCountry()
        {
            string Result = null;
            return Result;
        }
    }
}
