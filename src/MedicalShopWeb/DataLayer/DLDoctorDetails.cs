using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace DataLayer
{
    public class DLDoctorDetails
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        public string SaveDoctor(int DoctorID, string DrName, string Specialization, string DOB, int CityId, string Area, string Address,string Mobileno, double OpeningBalance, int IsActive, int UpdatedByUserID)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveDoctorDetails_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmd.Parameters.AddWithValue("@DoctorName", DrName);
            cmd.Parameters.AddWithValue("@Specialization", Specialization);
            cmd.Parameters.AddWithValue("@DOB", DOB);
            cmd.Parameters.AddWithValue("@CityId", CityId);
            cmd.Parameters.AddWithValue("@Area", Area);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@Mobileno", Mobileno);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@OpeningBalance", OpeningBalance);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result; 
        }

        public DataSet GetAllData(int DoctorID)
        {
            
            DataSet dsDoctorDetails = new DataSet();
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDoctorDetailsGridview_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
           
            con.Open();

            SqlDataAdapter daGetDoctorDetailsData = new SqlDataAdapter(cmd);
            dsDoctorDetails = new DataSet();
            daGetDoctorDetailsData.Fill(dsDoctorDetails);
            con.Close();
            return dsDoctorDetails;

        }

        public DataSet GetDoctor()
        {
            DataSet dsDoctor = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDoctorNames_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter daGetDoctorData = new SqlDataAdapter(cmd);
            dsDoctor = new DataSet();
            daGetDoctorData.Fill(dsDoctor);
            con.Close();
            return dsDoctor;
        }

         public DataSet GetDoctorName()
        {
            DataSet dsDoctorName = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDoctorNames_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsDoctorName = new DataSet();
            daGetCountryData.Fill(dsDoctorName);
            con.Close();
            return dsDoctorName;
 
        }



         public DataSet GetDoctorData(int DoctorID)
         {
             DataSet dsDoctorDetails = new DataSet();
             con = conn.GetConnection();
             SqlCommand cmd = new SqlCommand("GetDoctorDetails_USP", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
             con.Open();

             SqlDataAdapter daGetDoctorDetailsData = new SqlDataAdapter(cmd);
             dsDoctorDetails = new DataSet();
             daGetDoctorDetailsData.Fill(dsDoctorDetails);
             con.Close();
             return dsDoctorDetails;
         }
    }
}
