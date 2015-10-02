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
            public string SaveSaleProduct(int SaleTransctionNo, string date, string warehouse, string medical, string Product, string CurrentStock, decimal SalePrice, decimal Quantity, int UpdatedByUSerID, int IsActive)
            {
            string result = objSaleTransaction.SaveSaleTransation(SaleTransctionNo,date,warehouse,medical,Product,CurrentStock,SalePrice,Quantity,UpdatedByUSerID,IsActive);
            return result;
             }

            public string SaveTempSaleDetail(int SaleProductID, int ProductID, decimal Quantity, decimal SalePrice)
            {
                string result = objSaleTransaction.SaveTempSaleDetail(SaleProductID, ProductID, Quantity, SalePrice);
                return result;
            }

            public DataSet GetTempSaleDetail(int SaleProductID)
            {
                DataSet dsSaleProductDetails = objSaleTransaction.GetTempSaleDetail(SaleProductID);
                return dsSaleProductDetails;
            }
    }
}
