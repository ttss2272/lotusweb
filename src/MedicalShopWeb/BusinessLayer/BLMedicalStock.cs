using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;
namespace BusinessLayer
{
    public class BLMedicalStock
    {
        DLMedicalStock objMedicalStock = new DLMedicalStock();

        public DataSet BindMedicalProduct(int MedicalMedicalShopID)
        {
            DataSet dsMedicalProduct = objMedicalStock.BindMedicalProduct(MedicalMedicalShopID);
            return dsMedicalProduct;
        }

        public DataSet GetMedicalProduct(int MedicalMedicalShopID, int ProductID)
        {
            DataSet dsMedicalProduct = objMedicalStock.GetMedicalProduct(MedicalMedicalShopID, ProductID);
            return dsMedicalProduct;
        }

        public string SaveMedicalStock(int MedicalStockID, string DateOfStock, decimal CurrentStock, int MedicalShopID, int ProductID,int UpdatedByUserID)
        {
            string Result = objMedicalStock.SaveMedicalStock(MedicalStockID, DateOfStock, CurrentStock, MedicalShopID, ProductID,UpdatedByUserID);
            return Result;
        }

         public DataSet BindMedicalProductStock(int MedicalShopID)
        {
            DataSet dsMedicalProductStock = objMedicalStock.BindMedicalProductStock(MedicalShopID);
            return dsMedicalProductStock;

            }
    }
}
