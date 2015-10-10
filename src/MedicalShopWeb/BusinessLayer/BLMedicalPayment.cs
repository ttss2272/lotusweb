using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
namespace BusinessLayer
{
    public class BLMedicalPayment
    {
        DLMedicalPayment objMedicalPayment = new DLMedicalPayment();

        public DataSet BindSaleTransctionNo(int MedicalShopID)
        {
            DataSet dsMedicalShop = objMedicalPayment.BindSaleTransctionNo(MedicalShopID);
            return dsMedicalShop;
        }

        public DataSet GetTotalAmount(int SaleInvoiceNo)
        {
            DataSet dsTotalAmt = objMedicalPayment.GetTotalAmount(SaleInvoiceNo);
            return dsTotalAmt;
        }

        public string SaveMedicalPayment(int SaleTransactionID, decimal PaidAmount, string PaymentDate, int UpdatedByUserID, string MedicalPaymentNo, decimal BalanceAmount,string coment)
        {
            string result = objMedicalPayment.SaveMedicalPayment(SaleTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, MedicalPaymentNo, BalanceAmount,coment);
            return result;
        }

        public DataSet SetMedicalPaymentRecieptNo()
        {
            DataSet ds = objMedicalPayment.SetMedicalPaymentRecieptNo();
            return ds;
        }
    }
}
