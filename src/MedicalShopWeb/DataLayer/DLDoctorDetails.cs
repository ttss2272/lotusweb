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
        public string SaveDoctor(string DrName, string Specialization, string DOB, int CityId, string Area, string Address, string Mobileno, double OpeningBalance,int IsActive)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveDoctorDetails_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@DoctorID", id);
            cmd.Parameters.AddWithValue("@DrName", DrName);
            //cmd.Parameters.AddWithValue("@Surname", Surname);
            cmd.Parameters.AddWithValue("@Specialization", Specialization);
            cmd.Parameters.AddWithValue("@DOB", DOB);
            //cmd.Parameters.AddWithValue("@Country", CountryId);
            //cmd.Parameters.AddWithValue("@State", StateId);
            cmd.Parameters.AddWithValue("@CityId", CityId);
            cmd.Parameters.AddWithValue("@Area", Area);
            cmd.Parameters.AddWithValue("@Address", Address);
            // cmd.Parameters.AddWithValue("@ProductList", ProductList);
            cmd.Parameters.AddWithValue("@Mobileno", Mobileno);

            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            
            cmd.Parameters.AddWithValue("@OpeningBalance", OpeningBalance);
            conn.Open();
            result = cmd.ExecuteNonQuery().ToString();
            conn.Close();
            return result; 
        }
    }
}
