using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace DataLayer
{

    public class DLSupplierPayment
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();    
        /* For Bind Purchase Invoice No to DropDown */
        public DataSet BindPurchaseInvoiceNo()
        {
            throw new NotImplementedException();
        }
        /* For Get Total amt,currant balance and bind to text box */
        public DataSet GetTotalAmt(int PurchaseInvoiceNo)
        {
            DataSet dsTotalAmt = new DataSet();
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetTotal_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseInvoiceNo);
            con.Open();
            SqlDataAdapter daGetTotalAmt = new SqlDataAdapter(cmd);
            dsTotalAmt = new DataSet();
            daGetTotalAmt.Fill(dsTotalAmt);
            con.Close();
            return dsTotalAmt;

        }

        public string SaveSupplierPayment(int PurchaseTransactionID, double PaidAmount, string PaymentDate, int UpdatedByUserID, string SupplierPaymentNo, double BalanceAmount, string Comment)
        {
             string result = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("SaveSupplierPayment_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);
            cmd.Parameters.AddWithValue("@PaidAmount", PaidAmount);
            cmd.Parameters.AddWithValue("@AmountPaidDate", PaymentDate);
            cmd.Parameters.AddWithValue("@UpdatedByUserID", UpdatedByUserID);
            cmd.Parameters.AddWithValue("@PaymentReceiptNo", SupplierPaymentNo);
            cmd.Parameters.AddWithValue("@BalaneAmount", BalanceAmount);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;
        }
    }
}
