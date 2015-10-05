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
