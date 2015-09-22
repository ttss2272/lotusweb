using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLMedicalShop
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public DataSet GetShopType()
        {
            DataSet dsShopType = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetsShopType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataAdapter daGetCountryData = new SqlDataAdapter(cmd);
            dsShopType = new DataSet();
            daGetCountryData.Fill(dsShopType);
            con.Close();
            return dsShopType;
 
        }

        public string SaveMedicalShop(int MedicalShopID, string OwnerName, string ContactNo, int CityID, string Area, string ShopName, int ShopTypeID, decimal OpeningBalance, int UpdatedByUserID, int IsActive)
        {
            string Result =null;

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveCounty_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            cmd.Parameters.AddWithValue("@OwnerName", OwnerName);
            cmd.Parameters.AddWithValue("@ContactNo", ContactNo);
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.Parameters.AddWithValue("@Area", Area);
            cmd.Parameters.AddWithValue("@ShopName", ShopName);
            cmd.Parameters.AddWithValue("@ShopTypeID", ShopTypeID);
            cmd.Parameters.AddWithValue("@OpeningBalance", OpeningBalance);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);

            con.Open();
            Result = cmd.ExecuteScalar().ToString();
            con.Close();
            return Result;
            
        }
    }
}
