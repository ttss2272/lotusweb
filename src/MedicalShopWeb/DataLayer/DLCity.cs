using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLCity
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();


        public string SaveCity(int CityID, string CityName, int StateID, int UpdatedByUserID, int IsActive)
        {
            string Result = null;
            con = conn.GetConnection();

            SqlCommand cmd = new SqlCommand("SaveCity_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.Parameters.AddWithValue("@CityName", CityName);
            cmd.Parameters.AddWithValue("@StateID", StateID);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
        }

        public DataSet GetCity(int CityID, int IsActive)
        {
            DataSet dsCity = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetCity_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsCity = new DataSet();
            daGetCountryData.Fill(dsCity);
            con.Close();
            return dsCity;
        }

        public DataSet BindCity(int StateID)
        {
            DataSet dsCity = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindCity_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StateID", StateID);
            
            con.Open();

            SqlDataAdapter daGetCityData = new SqlDataAdapter(cmd);
            dsCity = new DataSet();
            daGetCityData.Fill(dsCity);
            con.Close();
            return dsCity;
 
        }
    }
}
