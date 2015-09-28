using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
   public class DLProductType
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        public System.Data.DataSet GetProductType(int ProductTypeID, int IsActive)
        {
            DataSet dsProductType = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetProductType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductTypeID", ProductTypeID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            con.Open();
            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsProductType = new DataSet();
            daGetCountryData.Fill(dsProductType);
            con.Close();
            return dsProductType;
        }
    }
}
