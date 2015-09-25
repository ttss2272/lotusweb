using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLDoctorPayment
    {
        DLDoctorPayment objDoctorPayment = new DLDoctorPayment();
        public DataSet GetDoctorPay()
        {
            DataSet dsDoctorPay = objDoctorPayment.GetDoctorPay();
            return dsDoctorPay;
        }

        public string SaveDoctorsPayment(int DoctorPaymentID, int DoctorsID, string PaidAmountDate, double PaymentAmount, string Comment, int UpdatedByUserID, int IsActive, string RecieptNo)
        {
            string Result = null;
            Result = objDoctorPayment.SaveDoctorsPayment( DoctorPaymentID,  DoctorsID,  PaidAmountDate,  PaymentAmount,  Comment,  UpdatedByUserID,  IsActive,  RecieptNo);
            return Result;
        }
    }
}
