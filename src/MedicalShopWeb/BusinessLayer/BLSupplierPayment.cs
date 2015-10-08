using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;
namespace BusinessLayer
{
    public class BLSupplierPayment
    {
        DLSupplierPayment objSupplierPay = new DLSupplierPayment();


        public DataSet BindPurchaseInvoiceNo(int SupplierID)
        {
            
            DataSet dsInvoiceNo = objSupplierPay.BindPurchaseInvoiceNo(SupplierID);
            return dsInvoiceNo;
        }

        public DataSet GetTotalAmount(int PurchaseTransactionID)
        {
            DataSet dsPurchaseInvoiceNo = objSupplierPay.GetTotalAmt(PurchaseTransactionID);
            return dsPurchaseInvoiceNo;
        }

        public string SaveSupplierPayment(int PurchaseTransactionID, double PaidAmount, string PaymentDate, int UpdatedByUserID, string SupplierPaymentNo, double BalanceAmount, string Comment)
        {
            string result = objSupplierPay.SaveSupplierPayment(PurchaseTransactionID,PaidAmount,PaymentDate,UpdatedByUserID,SupplierPaymentNo,BalanceAmount,Comment);
            return result;
        }

         public DataSet SetSupplierPaymentRecieptNo()
        {
            DataSet ds = objSupplierPay.SetSupplierPaymentRecieptNo();
            return ds;
        }
    }
}
