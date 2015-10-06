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
             public string SaveSaleProduct(int SaleTransactionID, string SaleTransactionNo, int WarehouseID, int MedicalID, string SellingDate, int UpdatedByUserID,decimal DiscountAmt,decimal BalAmt)
            {
                string result = objSaleTransaction.SaveSaleTransation(SaleTransactionID, SaleTransactionNo, WarehouseID, MedicalID, SellingDate, UpdatedByUserID, DiscountAmt, BalAmt);
               return result;
             }
             public string SaveSaleTransactionDetails(int SaleTransactionDetailID, int SaleTansactionID, int ProductID, decimal Quntity, decimal SellingPrice, int IsActive)
             {
                 string result = objSaleTransaction.SaveSaleTransactionDetails(SaleTransactionDetailID, SaleTansactionID, ProductID, Quntity, SellingPrice, IsActive);
                 return result;
             }
             public int AddMedicalStock(string DateOfStock, double CurrentStock, int MedicalShopID, int ProductID)
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
    }
}
