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
        
        public string SaveSaleTransation(int SaleTransctionNo, string date, string warehouse, string medical, string Product, string CurrentStock, decimal SalePrice, decimal Quantity, int UpdatedByUSerID, int IsActive)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveSaleTransacation_USP", con);   
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SaleTransactionNo", SaleTransctionNo);
            cmd.Parameters.AddWithValue("@SellingDate", date);
            cmd.Parameters.AddWithValue("@WarehouseID", warehouse);
            cmd.Parameters.AddWithValue("@MedicalShopID", medical);
            cmd.Parameters.AddWithValue("@ProductID", Product);
           // cmd.Parameters.AddWithValue("@CurrentStock", CurrentStock);
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUSerID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

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
