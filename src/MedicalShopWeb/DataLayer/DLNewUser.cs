using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLNewUser
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public DataSet BindUserType()
        {
            DataSet dsUserType = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindUserType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            
            con.Open();

            SqlDataAdapter daGetUserTypeData = new SqlDataAdapter(cmd);
            dsUserType = new DataSet();
            daGetUserTypeData.Fill(dsUserType);
            con.Close();
            return dsUserType;
 
        }

        public string CheckLoginName(string LoginName)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("CheckLoginName_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@LoginName", LoginName);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;

        }

        public string SaveUser(int UserID, string UserName, int UserTypeID, string EmailID, string ContactNo, int CityID, string Area, string Address, int WarehouseID, string LoginName, string Password, int UpdatedByUserID, int IsActive)
        {
            string Result = null;

            con = conn.GetConnection();

            SqlCommand cmd = new SqlCommand("SaveUser_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@LoginName", LoginName);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@ContactNo", ContactNo);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@EmailAddress", EmailID);
            cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.Parameters.AddWithValue("@Area", Area);
            
            
            

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;

        }

        public DataSet BindUser(int UserID)
        {
            DataSet dsUser = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindUser_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", UserID);

            con.Open();

            SqlDataAdapter daGetUserData = new SqlDataAdapter(cmd);
            dsUser = new DataSet();
            daGetUserData.Fill(dsUser);
            con.Close();
            return dsUser;
 
        }

        public DataSet GetUser(int UserID)
        {
            DataSet dsUser = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetUser_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", UserID);

            con.Open();

            SqlDataAdapter daGetUserData = new SqlDataAdapter(cmd);
            dsUser = new DataSet();
            daGetUserData.Fill(dsUser);
            con.Close();
            return dsUser;

        }
    }
}
