using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace DataLayer
{
   public class DLSupplier
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        public string SaveSupplier(int SupID, string SupplierName, string CompanyName, string ContactNo, int CityID, string Area, string Address, string ModeOfTransport, string PriceType, int IsActive, int UpdatedByUserID,decimal OpeningBalance)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveSupplier_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SupplierID", SupID);
            cmd.Parameters.AddWithValue("@CompanyName", SupplierName);
            cmd.Parameters.AddWithValue("@ModeOfTransport", ModeOfTransport);
            cmd.Parameters.AddWithValue("@PriceType", PriceType);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@ContactPerson", SupplierName);
            cmd.Parameters.AddWithValue("@ContactNo", ContactNo);
            cmd.Parameters.AddWithValue("@CityID", CityID);

            cmd.Parameters.AddWithValue("@Area", Area);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@OpeningBalance", OpeningBalance);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result; 
        }
       //Function for bind supplier  to dropdown
        public DataSet BindSupplier(int SupplierID)
        {
            DataSet dsSupplier = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindSupplier_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SupplierID", SupplierID);
            
            con.Open();

            SqlDataAdapter daGetSupplierData = new SqlDataAdapter(cmd);
            dsSupplier = new DataSet();
            daGetSupplierData.Fill(dsSupplier);
            con.Close();
            return dsSupplier;
 
        }

       //Bind Grid View
        public DataSet GetSupplier(int SupplierID)
        {
            DataSet dsSupplier = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetAllSupplierDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SupplierID", SupplierID);

            con.Open();

            SqlDataAdapter daGetSupplierData = new SqlDataAdapter(cmd);
            dsSupplier = new DataSet();
            daGetSupplierData.Fill(dsSupplier);
            con.Close();
            return dsSupplier;
 
         }

        public DataSet GetSupplierDetail(int SupplierID)
        {
            DataSet dsSupplier = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetSupplierDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SupplierID", SupplierID);

            con.Open();

            SqlDataAdapter daGetSupplierData = new SqlDataAdapter(cmd);
            dsSupplier = new DataSet();
            daGetSupplierData.Fill(dsSupplier);
            con.Close();
            return dsSupplier;
 
        }
    }
}
