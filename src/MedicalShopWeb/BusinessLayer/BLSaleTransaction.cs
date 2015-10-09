using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLSaleTransaction
    {
        DLSaleTransaction objSaleTransaction = new DLSaleTransaction();
             public string SaveSaleProduct(int SaleTransactionID, string SaleTransactionNo, int WarehouseID, int MedicalID, string SellingDate, int UpdatedByUserID)
            {
                string result = objSaleTransaction.SaveSaleTransation(SaleTransactionID, SaleTransactionNo, WarehouseID, MedicalID, SellingDate, UpdatedByUserID);
               return result;
             }
             public string SaveSaleTransactionDetails(int SaleTansactionID)
             {
                 string result = objSaleTransaction.SaveSaleTransactionDetails(SaleTansactionID);
                 return result;
             }
             public int AddMedicalStock(string DateOfStock, decimal CurrentStock, int MedicalShopID, int ProductID)
             {
                 int result = objSaleTransaction.AddMedicalStock(DateOfStock,CurrentStock,MedicalShopID,ProductID);
                 return result;
             }
            public string SaveTempSaleDetail(int SaleTransactionID, int ProductID, decimal Quantity, decimal SalePrice,decimal DiscountAmt)
            {
                string result = objSaleTransaction.SaveTempSaleDetail(SaleTransactionID, ProductID, Quantity, SalePrice, DiscountAmt);
                return result;
            }

            public DataSet GetTempSaleDetail(int SaleProductID)
            {
                DataSet dsSaleProductDetails = objSaleTransaction.GetTempSaleDetail(SaleProductID);
                return dsSaleProductDetails;
            }
            public DataSet GetDataForSaleTransDetail(int SaleTransactionID)
            {
                DataSet dsProductDetails = objSaleTransaction.GetDataForSaleTransDetail(SaleTransactionID);
                return dsProductDetails;
            }
            public DataSet GetTotal(int SaleTransactionID)
            {
                DataSet dsGetTempTotal = objSaleTransaction.GetTotal(SaleTransactionID);
                return dsGetTempTotal;
            }
            
    }
}
