using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLWarehouseStock
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public DataSet GetWarehouseProductStock(int WarehouseID)
        {
            DataSet dsWaehouseStock = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetWarehouseProductStock_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            
            con.Open();

            SqlDataAdapter daGetWarehouseStockData = new SqlDataAdapter(cmd);
            dsWaehouseStock = new DataSet();
            daGetWarehouseStockData.Fill(dsWaehouseStock);
            con.Close();
            return dsWaehouseStock;
        }

        public DataSet GetProductStock(int WarehouseID, int ProductID)
        {
            DataSet dsWaehouseStock = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetProductStock_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            con.Open();

            SqlDataAdapter daGetWarehouseStockData = new SqlDataAdapter(cmd);
            dsWaehouseStock = new DataSet();
            daGetWarehouseStockData.Fill(dsWaehouseStock);
            con.Close();
            return dsWaehouseStock;
        }

        public DataSet GetWarehouseProduct(int WarehouseID)
        {
            DataSet dsWaehouseStock = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetWarehouseProduct_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@WarehouseID", WarehouseID);

            con.Open();

            SqlDataAdapter daGetWarehouseStockData = new SqlDataAdapter(cmd);
            dsWaehouseStock = new DataSet();
            daGetWarehouseStockData.Fill(dsWaehouseStock);
            con.Close();
            return dsWaehouseStock;
        }
    }
}
