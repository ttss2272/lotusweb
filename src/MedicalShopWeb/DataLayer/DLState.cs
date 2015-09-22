using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLState
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public string SaveState(int StateID, string StateName, int CountryID, int UpdatedByUserID, int IsActive)
        {
            string Result = null;
            con = conn.GetConnection();

            SqlCommand cmd = new SqlCommand("SaveState_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@StateID", StateID);
            cmd.Parameters.AddWithValue("@StateName", StateName);
            cmd.Parameters.AddWithValue("@CountryID", CountryID);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
        }

        public DataSet GetState(int StateID,int IsActive)
        {
            DataSet dsState = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetState_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StateID", StateID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsState = new DataSet();
            daGetCountryData.Fill(dsState);
            con.Close();
            return dsState;
        }

        public DataSet BindState(int CountryID)
        {
            DataSet dsState = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindState_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CountryID", CountryID);

            con.Open();
            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsState = new DataSet();
            daGetCountryData.Fill(dsState);
            con.Close();
            return dsState;

        }
    }
}
