using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLDMPLinking
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public string SaveDMPLinking(int DMPID, int DoctorID, int MedicalShopID, int ProductID, int PriceTypeID, decimal Price, int UpdatedByUserID, int IsActive)
        {
            string Result = null;

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveDMPLinking_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DMPID", DMPID);
            cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@PriceTypeID", PriceTypeID);
            cmd.Parameters.AddWithValue("@Price", Price);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            
            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
 
        }

        /*Bind Grid View*/
        public DataSet GetAllDMPDetail(int DoctorID)
        {
            DataSet dsDMPDetail = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDMPDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
            con.Open();

            SqlDataAdapter daGetDMPDetailData = new SqlDataAdapter(cmd);
            dsDMPDetail = new DataSet();
            daGetDMPDetailData.Fill(dsDMPDetail);
            con.Close();
            return dsDMPDetail;
        }

        /*Fill the Form information to edit*/
        public DataSet BindDMPDetail(int DMPID)
        {
            DataSet dsDMPDetail = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindDMPDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DMPID", DMPID);
            con.Open();

            SqlDataAdapter daGetDMPDetailData = new SqlDataAdapter(cmd);
            dsDMPDetail = new DataSet();
            daGetDMPDetailData.Fill(dsDMPDetail);
            con.Close();
            return dsDMPDetail;
        }

        public DataSet GetDmpPrice(int DoctorID, int MedicalShopID, int ProductID)
        {
            DataSet dsDMPPrice = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetDmpPrice_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmd.Parameters.AddWithValue("@MedicalShopID",MedicalShopID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();

            SqlDataAdapter daGetDMPPriceData = new SqlDataAdapter(cmd);
            dsDMPPrice = new DataSet();
            daGetDMPPriceData.Fill(dsDMPPrice);
            con.Close();
            return dsDMPPrice;
        }
    }
}
