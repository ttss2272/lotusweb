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


        public DataSet BindPurchaseInvoiceNo()
        {
            DataSet dsPurchaceInvoiceNo = objSupplierPay.BindPurchaseInvoiceNo();
            return dsPurchaceInvoiceNo;
        }

        public DataSet GetTotalAmount(int PurchaseInvoiceNo)
        {
            DataSet dsPurchaseInvoiceNo = objSupplierPay.GetTotalAmt(PurchaseInvoiceNo);
            return dsPurchaseInvoiceNo;
        }

        public string SaveSupplierPayment(int PurchaseTransactionID, double PaidAmount, string PaymentDate, int UpdatedByUserID, string SupplierPaymentNo, double BalanceAmount, string Comment)
        {
            string result = objSupplierPay.SaveSupplierPayment(PurchaseTransactionID,PaidAmount,PaymentDate,UpdatedByUserID,SupplierPaymentNo,BalanceAmount,Comment);
            return result;
        }
    }
}
