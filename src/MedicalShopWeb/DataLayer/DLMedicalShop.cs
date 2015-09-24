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
            SqlCommand cmd = new SqlCommand("SaveMedicalShop_USP", con);
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

        /*
         * get All Data of Medicalshop for Bind Form
         */
        public DataSet GetMedicalShop(int MedicalShopID)
        {
            DataSet dsMedicalShop = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetMedicalShop_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            con.Open();

            SqlDataAdapter daGetMedicalShopData = new SqlDataAdapter(cmd);
            dsMedicalShop = new DataSet();
            daGetMedicalShopData.Fill(dsMedicalShop);
            con.Close();
            return dsMedicalShop;
 
        }

        /*
         * get All Medicalshop for Bind Dropdown 
         */

        public DataSet BindMedicalShop(int MedicalShopID)
        {
            DataSet dsMedicalShop = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindMedicalShop_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            con.Open();

            SqlDataAdapter daGetMedicalShopData = new SqlDataAdapter(cmd);
            dsMedicalShop = new DataSet();
            daGetMedicalShopData.Fill(dsMedicalShop);
            con.Close();
            return dsMedicalShop;

        }

        /*
         * get All Medicalshop for Bind Dropdown on ShopType
         */
        public DataSet BindMedicalShopOnShopType(int ShopTypeID)
        {
            DataSet dsMedicalShop = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("BindMedicalShopOnShopType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ShopTypeID", ShopTypeID);
            con.Open();

            SqlDataAdapter daGetMedicalShopData = new SqlDataAdapter(cmd);
            dsMedicalShop = new DataSet();
            daGetMedicalShopData.Fill(dsMedicalShop);
            con.Close();
            return dsMedicalShop;
 
        }

        /*
        * get All Data of Medicalshop for Bind gridview
        */
        public DataSet GetMedicalShopOnShopType(int MedicalShopID,int ShopTypeID)
        {
            DataSet dsMedicalShop = new DataSet();

            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetMedicalShopOnShopType_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ShopTypeID", ShopTypeID);
            cmd.Parameters.AddWithValue("@MedicalShopID", MedicalShopID);
            con.Open();

            SqlDataAdapter daGetMedicalShopData = new SqlDataAdapter(cmd);
            dsMedicalShop = new DataSet();
            daGetMedicalShopData.Fill(dsMedicalShop);
            con.Close();
            return dsMedicalShop;

        }
    }
}
