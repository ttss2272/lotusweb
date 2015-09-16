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

        public string SaveCountry(int CountryID, string CountryName, int UpdatedByUserID, int IsActive)
        {
            string Result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveCounty_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@CountryID", CountryID);
            cmd.Parameters.AddWithValue("@CountryName", CountryName);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();

            return Result;
           
        }

        public DataSet GetCountry(int CountryID, int IsActive)
        {
            DataSet dsCountry = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetCountry_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CountryID", CountryID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsCountry = new DataSet();
            daGetCountryData.Fill(dsCountry);
            con.Close();
            return dsCountry;
 
        }
    }
}
