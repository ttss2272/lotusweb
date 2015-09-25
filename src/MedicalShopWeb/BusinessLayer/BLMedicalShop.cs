using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLMedicalShop
    {
        DLMedicalShop objMedicalShop = new DLMedicalShop();

        public DataSet GetShopType()
        {
            DataSet dsShopType = objMedicalShop.GetShopType();
            return dsShopType;
        }

        public string SaveMedicalShop(int MedicalShopID, string OwnerName, string ContactNo, int CityID, string Area, string ShopName, int ShopTypeID, decimal OpeningBalance, int UpdatedByUserID, int IsActive,string Address)
        {
            string Result = objMedicalShop.SaveMedicalShop(MedicalShopID, OwnerName, ContactNo, CityID, Area, ShopName, ShopTypeID, OpeningBalance, UpdatedByUserID, IsActive,Address);
            return Result;

        }

        
        /*
         * get All Data of Medicalshop for Bind gridview and Form
         */
        public DataSet GetMedicalShop(int MedicalShopID)
        {
            DataSet dsMedicalShop = objMedicalShop.GetMedicalShop(MedicalShopID);
            return dsMedicalShop;

        }


        /*
         * get  Medicalshop for Bind Dropdown and Form
         */

        public DataSet BindMedicalShop(int MedicalShopID)
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShop(MedicalShopID);
            return dsMedicalShop;
        }

        /*
         * get All Medicalshop for Bind Dropdown on ShopType
         */
        public DataSet BindMedicalShopOnShopType(int ShopTypeID)
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShopOnShopType(ShopTypeID);
            return dsMedicalShop;
        }

        /*
        * get All Data of Medicalshop for Bind gridview
        */
        public DataSet GetMedicalShopOnShopType(int MedicalShopID,int ShopTypeID)
        {
            DataSet dsMedicalShop = objMedicalShop.GetMedicalShopOnShopType(MedicalShopID, ShopTypeID);
            return dsMedicalShop;
        }
    }
}
