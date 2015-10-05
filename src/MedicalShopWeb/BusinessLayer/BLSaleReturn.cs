using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLSaleReturn
    {
        DLSaleReturn objSaleReturn = new DLSaleReturn();

        public string SaveReturnSalesRecord(int ProductID, double Quantity, int SalesReturnID, string Reason, double Rate)
        {
            string result = objSaleReturn.SaveReturnSalesRecord(ProductID, Quantity, SalesReturnID, Reason, Rate);
            return result;
        }

        public string saveReturnSales(int SalesReturnID, string ReturnInvoiceNo, int MedicalShopID, string ReturnDate, int UpdatedByUserID, int WarehouseID, string Comment)
        {
            string result = objSaleReturn.saveReturnSales(SalesReturnID, ReturnInvoiceNo, MedicalShopID, ReturnDate, UpdatedByUserID, WarehouseID, Comment);
            return result;
        }       
    }
}
