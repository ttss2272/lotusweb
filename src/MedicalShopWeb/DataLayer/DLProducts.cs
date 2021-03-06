﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
  public class DLProducts
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
        public string SaveProducts(int ProductID,int ProductTypeID, string ProductName, string batch, string code, string PurchasePrice, string SalePrice, int IsActive, int UpdatedByUserID)
        {
            string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveProducts_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.Parameters.AddWithValue("@ProductName", ProductName);
            cmd.Parameters.AddWithValue("@ProductCode", code);
            cmd.Parameters.AddWithValue("@SallingPrice", SalePrice);
            cmd.Parameters.AddWithValue("@ProductTypeID", ProductTypeID);
            cmd.Parameters.AddWithValue("@PurchasePrice", PurchasePrice);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result; 
        }

        public DataSet BindProduct(int ProductID)
        {
            DataSet dsProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindProduct_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();

            SqlDataAdapter daGetProductData = new SqlDataAdapter(cmd);
            dsProduct = new DataSet();
            daGetProductData.Fill(dsProduct);
            con.Close();
            return dsProduct;
        }        


        //public DataSet GetProductType()bbbb
        //{
        //    DataSet dsProductType = new DataSet();

        //    con = conn.GetConnection();
        //    SqlCommand cmd = new SqlCommand("ProductType_USP", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    con.Open();

        //    SqlDataAdapter daGetProductData = new SqlDataAdapter(cmd);
        //    dsProductType = new DataSet();
        //    daGetProductData.Fill(dsProductType);
        //    con.Close();
        //    return dsProductType;
        //}

        public DataSet BindProductOnProductType(int ProductTypeID)
        {
            DataSet dsProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindProductOnProductType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductTypeID", ProductTypeID);
            con.Open();

            SqlDataAdapter daGetProductData = new SqlDataAdapter(cmd);
            dsProduct = new DataSet();
            daGetProductData.Fill(dsProduct);
            con.Close();
            return dsProduct;
 
        }

        public DataSet GetProductOnProductType(int ProductID, int ProductTypeID)
        {
            DataSet dsProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetProductAllDetail_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductTypeID", ProductTypeID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();

            SqlDataAdapter daGetMedicalShopData = new SqlDataAdapter(cmd);
            dsProduct = new DataSet();
            daGetMedicalShopData.Fill(dsProduct);
            con.Close();
            return dsProduct;
        }

        public DataSet GetProductPrice(int ProductID)
        {
            DataSet dsProduct = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetProductPrice_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();

            SqlDataAdapter daGetProductPriceData = new SqlDataAdapter(cmd);
            dsProduct = new DataSet();
            daGetProductPriceData.Fill(dsProduct);
            con.Close();
            return dsProduct;
        }

  
        
    }
}
