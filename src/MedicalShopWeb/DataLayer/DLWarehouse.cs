using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLWarehouse
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public string SaveWarehosue(int WarehouseID,string WarehouseName,string Location,int UpdatedByUserID,int IsActive)
        {
            string Result = null;
            con = conn.GetConnection();

            SqlCommand cmd = new SqlCommand("SaveWarehouse_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@WarehouseName", WarehouseName);
            cmd.Parameters.AddWithValue("@Location", Location);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();

            return Result;
            
        }

        public DataSet GetWarehouse(int WarehouseID,int IsActive)
        {
            DataSet dsWarehouse = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetWarehouse_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();

            SqlDataAdapter daGetWarehouseData = new SqlDataAdapter(cmd);
            dsWarehouse = new DataSet();
            daGetWarehouseData.Fill(dsWarehouse);
            con.Close();
            return dsWarehouse;
            
 
        }

        public DataSet BindWarehouse(int WarehouseID, int IsActive)
        {
            DataSet dsWarehouse = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindWarehouse_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();

            SqlDataAdapter daGetWarehouseData = new SqlDataAdapter(cmd);
            dsWarehouse = new DataSet();
            daGetWarehouseData.Fill(dsWarehouse);
            con.Close();
            return dsWarehouse;
        }
    }
}
