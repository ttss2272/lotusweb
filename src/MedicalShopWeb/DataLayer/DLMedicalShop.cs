using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLMedicalShop
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public DataSet GetShopType()
        {
            DataSet dsShopType = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetsShopType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsShopType = new DataSet();
            daGetCountryData.Fill(dsShopType);
            con.Close();
            return dsShopType;
 
        }
    }
}
