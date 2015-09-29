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

        public DataSet BindSaleTransctionNo()
        {
            DataSet dsMedicalShop = objMedicalPayment.BindSaleTransctionNo();
            return dsMedicalShop;
        }

        public DataSet GetTotalAmount(int SaleInvoiceNo)
        {
            DataSet dsTotalAmt = objMedicalPayment.GetTotalAmount(SaleInvoiceNo);
            return dsTotalAmt;
        }

        public string SaveMedicalPayment(int SaleTransactionID, double PaidAmount, string PaymentDate, int UpdatedByUserID, string MedicalPaymentNo, double BalanceAmount)
        {
            string result = objMedicalPayment.SaveMedicalPayment(SaleTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, MedicalPaymentNo, BalanceAmount);
            return result;
        }
    }
}
