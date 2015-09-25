using System;
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
    }
}
