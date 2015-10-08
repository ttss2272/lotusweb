using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLPurchaseProduct
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public string SavePurchaseProduct(int PurchaseTransactionID, int WarehouseID, string PurchaseDate, int SupplierID, string ReceiptNo, string ModeOfPayment, int UpdatedByUserID, int IsActive)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SavePurchaseProduct_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@PurchaseDate", PurchaseDate);
            cmd.Parameters.AddWithValue("@SupplierID", SupplierID);
            cmd.Parameters.AddWithValue("@ModeOfPayment", ModeOfPayment);
            cmd.Parameters.AddWithValue("@SupplierReciptNo", ReceiptNo);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            string Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
        }

        public string SaveTempPurchaseDetail(int PurchaseTransactionID, int ProductID, decimal PurchaseQuantity, decimal PurchasePrice, decimal SellingPrice, string BatchNo, string ExpiryDate)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveTempPurchaseDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@PurchaseRate", PurchasePrice);
            cmd.Parameters.AddWithValue("@SaleRate", SellingPrice);
            cmd.Parameters.AddWithValue("@Quantity", PurchaseQuantity);
            cmd.Parameters.AddWithValue("@BatchNo", BatchNo);
            cmd.Parameters.AddWithValue("@ExpiryDate", ExpiryDate);
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);
            
            con.Open();
            string Result = cmd.ExecuteNonQuery().ToString();
            con.Close();
            return Result;
         }

        public DataSet GetTempPurchaseDetail(int PurchaseTransactionID)
        {
            DataSet dsTempPurchaseDetail = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetTempPurchaseDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);
            
            con.Open();

            SqlDataAdapter daGetPurchaseDetailData = new SqlDataAdapter(cmd);
            dsTempPurchaseDetail = new DataSet();
            daGetPurchaseDetailData.Fill(dsTempPurchaseDetail);
            con.Close();
            return dsTempPurchaseDetail;
        }

        public DataSet GetTotal(int PurchaseTransactionID)
        {
            DataSet dsTempPurchaseTotal = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetTempPurchaseTotal_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);

            con.Open();

            SqlDataAdapter daGetPurchaseTotalData = new SqlDataAdapter(cmd);
            dsTempPurchaseTotal = new DataSet();
            daGetPurchaseTotalData.Fill(dsTempPurchaseTotal);
            con.Close();
            return dsTempPurchaseTotal;
 
        }
    }
}
