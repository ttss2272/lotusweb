using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLMedicalStock
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        /*Get Medical Product List*/
        public DataSet BindMedicalProduct(int MedicalShopID)
        {
            DataSet dsMedicalProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindMedicalProduct_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            
            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsMedicalProduct = new DataSet();
            daGetCountryData.Fill(dsMedicalProduct);
            con.Close();
            return dsMedicalProduct;
        }

        /*Get Perticular product Stock Details*/
        public DataSet GetMedicalProduct(int MedicalShopID, int ProductID)
        {
            DataSet dsMedicalProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetMedicalProduct_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);

            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsMedicalProduct = new DataSet();
            daGetCountryData.Fill(dsMedicalProduct);
            con.Close();
            return dsMedicalProduct;
        }

        /*Get Medical Stores Availble product Stock GridView*/
        public DataSet BindMedicalProductStock(int MedicalShopID)
        {
            DataSet dsMedicalProductStock = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindMedicalProductStock_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);

            con.Open();

            SqlDataAdapter daGetMedicalProductStockData = new SqlDataAdapter(cmd);
            dsMedicalProductStock = new DataSet();
            daGetMedicalProductStockData.Fill(dsMedicalProductStock);
            con.Close();
            return dsMedicalProductStock;
 
        }

        /*
        * Created By: Pritesh D. Sortee
        * Created Date: 25 Sept 2015
        * Purpose: Update medical shop stock
        * 
        */
        #region-------------------------savemedecalstock()-------------------------
        public string SaveMedicalStock(int MedicalStockID, string DateOfStock, decimal CurrentStock, int MedicalShopID, int ProductID,int UpdatedByUserID)
        {
            con = conn.GetConnection();

            con.Open();

            SqlCommand cmd = new SqlCommand("SaveMedicalStock_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MedicalStockID", MedicalStockID);
            cmd.Parameters.AddWithValue("@DateOfStock", DateOfStock);
            cmd.Parameters.AddWithValue("@CurrentStock", CurrentStock);
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            //conn.Open();
            string Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;



        }

        #endregion
    }
}
