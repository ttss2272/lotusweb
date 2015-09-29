using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
   public class DLMedicalPayment
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();
       public DataSet BindSaleTransctionNo()
       {
           throw new NotImplementedException();
       }

       public DataSet GetTotalAmount(int SaleInvoiceNo)
       {
           DataSet dsTotalAmt = new DataSet();
           con = conn.GetConnection();
           SqlCommand cmd = new SqlCommand("GetTotal_USP", con);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@SaleTransactionID", SaleInvoiceNo);

           con.Open();

           SqlDataAdapter daGetTotalAmt = new SqlDataAdapter(cmd);
           dsTotalAmt = new DataSet();
           daGetTotalAmt.Fill(dsTotalAmt);
           con.Close();
           return dsTotalAmt;
       }

       public string SaveMedicalPayment(int SaleTransactionID, double PaidAmount, string PaymentDate, int UpdatedByUserID, string MedicalPaymentNo, double BalanceAmount,string coment)
       {
           string result = null;
           con = conn.GetConnection();
           SqlCommand cmd = new SqlCommand("SaveMedicalShopPayment_USP", con);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@SaleTransactionID", SaleTransactionID);
           cmd.Parameters.AddWithValue("@PaidAmount", PaidAmount);
           cmd.Parameters.AddWithValue("@AmountPaidDate", PaymentDate);
           cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
           cmd.Parameters.AddWithValue("@MedicalPaymentNo", MedicalPaymentNo);
           cmd.Parameters.AddWithValue("@BalanceAmount", BalanceAmount);
           cmd.Parameters.AddWithValue("@Comment", coment);
           con.Open();
           result = cmd.ExecuteScalar().ToString();
           con.Close();
           return result; 
       }
    }
}
