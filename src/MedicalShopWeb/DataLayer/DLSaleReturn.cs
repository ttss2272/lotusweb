using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLSaleReturn
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();


        public string saveReturnSales(int SalesReturnID, string ReturnInvoiceNo, int MedicalShopID, string ReturnDate, int UpdatedByUserID, int WarehouseID, string Comment)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("Usp_SaveReturnSaleTransaction", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("SalesReturnID", SalesReturnID);
            cmd.Parameters.AddWithValue("ReturnInvoiceNo", ReturnInvoiceNo);
            cmd.Parameters.AddWithValue("MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("ReturnDate", ReturnDate);
            cmd.Parameters.AddWithValue("UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("Comment", Comment);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;
        }

        public string SaveReturnSalesRecord(int ProductID, double Quantity, int SalesReturnID, string Reason, double Rate)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("Usp_SaveTempSaleReturn", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);
            cmd.Parameters.AddWithValue("@SalesReturnID", SalesReturnID);
            cmd.Parameters.AddWithValue("@Reason", Reason);
            cmd.Parameters.AddWithValue("@Rate", Rate);

            con.Open();
            result = cmd.ExecuteNonQuery().ToString();
            con.Close();
            return result;
        }

      
    }
}
