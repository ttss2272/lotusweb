using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLSaleTransaction
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        
        public string SaveSaleTransation(int SaleTransactionID,string SaleTransactionNo,int WarehouseID, int MedicalID,string SellingDate, int UpdatedByUserID,decimal DiscountAmt,decimal BalAmt)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveSaleTransaction_USP", con);   
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SaleTransactionID", SaleTransactionID);
            cmd.Parameters.AddWithValue("@SaleTransactionNo", SaleTransactionNo);
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalID);
            cmd.Parameters.AddWithValue("@SellingDate", SellingDate);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@DiscountAmount", DiscountAmt);
            cmd.Parameters.AddWithValue("@BalanceAmount", BalAmt);

            con.Open();
            string Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
        }

        public string SaveTempSaleDetail(int SaleProductID, int ProductID, decimal Quantity, decimal SalePrice)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveTempSaleDetail_USP", con);    //Sp not created
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);
            
            con.Open();
            string Result = cmd.ExecuteNonQuery().ToString();
            con.Close();
            return Result;
        }

         public DataSet GetTempSaleDetail(int SaleProductID)
        {
            DataSet dsTempSaleProductDetail = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetTempSaleDetail_USP", con);       //SP not created
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SaleTransactionID", SaleProductID);

            con.Open();

            SqlDataAdapter daGetSaleDetailData = new SqlDataAdapter(cmd);
            dsTempSaleProductDetail = new DataSet();
            daGetSaleDetailData.Fill(dsTempSaleProductDetail);
            con.Close();
            return dsTempSaleProductDetail;
        }
    }
}
