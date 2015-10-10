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
        
        public string SaveSaleTransation(int SaleTransactionID,string SaleTransactionNo,int WarehouseID, int MedicalID,string SellingDate, int UpdatedByUserID)
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
           
            con.Open();
            string Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
        }
        /*
         * Creted by:-Sameer Shinde
         * Date:- 06 Oct 2015
         * Purpose:- Data Save In Sales Transactions Details Table
         */
        public string SaveSaleTransactionDetails(int SaleTansactionID, decimal DiscountAmt,decimal BalaceAmount,string Comment)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveSaleTransactionDetails_USP", con);  
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SaleTansactionID", SaleTansactionID);
            cmd.Parameters.AddWithValue("@DiscountAmount", DiscountAmt);
            cmd.Parameters.AddWithValue("@BalanceAmount", BalaceAmount);
            cmd.Parameters.AddWithValue("@Comment", Comment);
           
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;
        }
        /*
        * Creted by:-Sameer Shinde
        * Date:- 06 Oct 2015
        * Purpose:- Add medical Stock
        */ 
        public int AddMedicalStock(string DateOfStock, decimal CurrentStock, int MedicalShopID, int ProductID)
        {
            int Result = 0;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("AddMedicalStock_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DateOfStock", DateOfStock);
            cmd.Parameters.AddWithValue("@CurrentStock", CurrentStock);
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();
            Result = cmd.ExecuteNonQuery();
            con.Close();
            return Result;
        }

        /*
         * Creted by:-Sameer Shinde
         * Date:- 06 Oct 2015
         * Purpose:- Data Save In Sales Transactions Temp Table
         */ 
        public string SaveTempSaleDetail(int SaleTransactionID, int ProductID, decimal Quantity, decimal SalePrice, decimal DiscountAmt)
        {
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveTempSaleTransactionDetail_USP", con);    
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice);
            cmd.Parameters.AddWithValue("@Quantity", Quantity);
            cmd.Parameters.AddWithValue("@DiscountAmount", DiscountAmt);
            cmd.Parameters.AddWithValue("@SaleTransactionID", SaleTransactionID);
            con.Open();
            string Result = cmd.ExecuteNonQuery().ToString();
            con.Close();
            return Result;
        }
        /*
         * Creted by:-Sameer Shinde
         * Date:- 06 Oct 2015
         * Purpose:- Get Details from Temp sales table
         */ 
         public DataSet GetTempSaleDetail(int SaleProductID)
        {
            DataSet dsTempSaleProductDetail = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetTempSaleDetail_USP", con);      
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SaleTransactionID", SaleProductID);

            con.Open();

            SqlDataAdapter daGetSaleDetailData = new SqlDataAdapter(cmd);
            dsTempSaleProductDetail = new DataSet();
            daGetSaleDetailData.Fill(dsTempSaleProductDetail);
            con.Close();
            return dsTempSaleProductDetail;
        }
         /*
          * Creted by:-Sameer Shinde
          * Date:- 06 Oct 2015
          * Purpose:-Get data from temp table for purpose of Save data in Save Sales Details table 
          */ 
         public DataSet GetDataForSaleTransDetail(int SaleTransactionID)
         {
             DataSet dsGetProductData = new DataSet();

             con = conn.GetConnection();
             SqlCommand cmd = new SqlCommand("GetDataForSaleTransDetail_USP", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.AddWithValue("@SaleTransactionID", SaleTransactionID);

             con.Open();

             SqlDataAdapter daGetSaleDetailData = new SqlDataAdapter(cmd);
             dsGetProductData = new DataSet();
             daGetSaleDetailData.Fill(dsGetProductData);
             con.Close();
             return dsGetProductData;
         }
         public DataSet GetTotal(int SaleTransactionID)
         {
             DataSet dsTempSalesTotal = new DataSet();

             con = conn.GetConnection();
             SqlCommand cmd = new SqlCommand("GetTempSalesTotal_USP", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.AddWithValue("@SaleTransactionID", SaleTransactionID);

             con.Open();

             SqlDataAdapter daGetSalesTotalData = new SqlDataAdapter(cmd);
             dsTempSalesTotal = new DataSet();
             daGetSalesTotalData.Fill(dsTempSalesTotal);
             con.Close();
             return dsTempSalesTotal;

         }
         /*
           * Creted by:-Sameer Shinde
           * Date:- 10 Oct 2015
           * Purpose:-Get Sale number and display on SaleTransaction text box
           */ 
         public DataSet GetSaleNo()
         {
             DataSet dsSaleNo = new DataSet();

             con = conn.GetConnection();
             SqlCommand cmd = new SqlCommand("SetSaleTransactionNumber_USP", con);
             cmd.CommandType = CommandType.StoredProcedure;
             con.Open();

             SqlDataAdapter daSetSaleNo = new SqlDataAdapter(cmd);
             dsSaleNo = new DataSet();
             daSetSaleNo.Fill(dsSaleNo);
             con.Close();
             return dsSaleNo;

         }
    }
}
