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

        public string SaveMedicalShop(int MedicalShopID, string OwnerName, string ContactNo, int CityID, string Area, string ShopName, int ShopTypeID, decimal OpeningBalance, int UpdatedByUserID, int IsActive)
        {
            string Result = objMedicalShop.SaveMedicalShop(MedicalShopID, OwnerName, ContactNo, CityID, Area, ShopName, ShopTypeID, OpeningBalance, UpdatedByUserID, IsActive);
            return Result;

        }
    }
}
