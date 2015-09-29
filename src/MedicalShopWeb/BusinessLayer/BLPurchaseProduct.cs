using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;
namespace BusinessLayer
{
    public class BLPurchaseProduct
    {
        DLPurchaseProduct objPurchaseProduct = new DLPurchaseProduct();

        public string SavePurchaseProduct(int PurchaseProductID, int WarehouseID, string PurchaseDate, int SupplierID, string ReceiptNo, string ModeOfPayment, int UpdatedByUserID, int IsActive)
        {
            string Result = objPurchaseProduct.SavePurchaseProduct(PurchaseProductID, WarehouseID, PurchaseDate, SupplierID, ReceiptNo, ModeOfPayment, UpdatedByUserID, IsActive);
            return Result;
        }

        public string SaveTempPurchaseDetail(int PurchaseProductID, int ProductID, decimal PurchaseQuantity, decimal PurchasePrice, decimal SellingPrice, string BatchNo, string ExpiryDate)
        {
            string Result = objPurchaseProduct.SaveTempPurchaseDetail(PurchaseProductID, ProductID, PurchaseQuantity, PurchasePrice, SellingPrice, BatchNo, ExpiryDate);
            return Result;
        }

        public DataSet GetTempPurchaseDetail(int PurchaseProductID)
        {
            DataSet dsTempPurchaseDetail = objPurchaseProduct.GetTempPurchaseDetail(PurchaseProductID);
            return dsTempPurchaseDetail;
        }
    }
}
