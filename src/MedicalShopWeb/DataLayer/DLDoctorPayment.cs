using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLDoctorPayment
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        public DataSet GetDoctorPay()
        {
            DataSet dsDoctorPay = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDoctorNames_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter daGetDoctorData = new SqlDataAdapter(cmd);
            dsDoctorPay = new DataSet();
            daGetDoctorData.Fill(dsDoctorPay);
            con.Close();
            return dsDoctorPay;
        }

        public string SaveDoctorsPayment(int DoctorPaymentID, int DoctorsID, string PaidAmountDate, double PaymentAmount, string Comment, int UpdatedByUserID, int IsActive, string RecieptNo)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveDoctorDetails_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DoctorPaymentID", DoctorPaymentID);
            cmd.Parameters.AddWithValue("@DoctorsID", DoctorsID);
            cmd.Parameters.AddWithValue("@PaidAmountDate", PaidAmountDate);
            cmd.Parameters.AddWithValue("@PaymentAmount", PaymentAmount);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@RecieptNo", RecieptNo);
          
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result; 
        }

        public DataTable SetDoctorReciptNo()
        {
            DataTable dt = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("Usp_SetDoctorPaymentRecieptNo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
    }
}
