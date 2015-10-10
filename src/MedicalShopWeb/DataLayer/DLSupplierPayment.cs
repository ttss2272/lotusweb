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
        public DataSet BindPurchaseInvoiceNo(int SupplierID)
        {
            DataSet dsInvoiceNo = new DataSet();
            con = conn.GetConnection();

            SqlCommand cmd = new SqlCommand("GetSupplierInvoiceNo_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SupplierID", SupplierID);
            con.Open();
            SqlDataAdapter daPurchaseInvoiceData = new SqlDataAdapter(cmd);
            dsInvoiceNo = new DataSet();
            daPurchaseInvoiceData.Fill(dsInvoiceNo);
            con.Close();
            return dsInvoiceNo;
        }
        /* For Get Total amt,currant balance and bind to text box */
        public DataSet GetTotalAmt(int PurchaseTransactionID)
        {
            DataSet dsTotalAmt = new DataSet();
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("GetInvoiceBalance_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PurchaseTransactionID", PurchaseTransactionID);
            con.Open();
            SqlDataAdapter daGetTotalAmt = new SqlDataAdapter(cmd);
            dsTotalAmt = new DataSet();
            daGetTotalAmt.Fill(dsTotalAmt);
            con.Close();
            return dsTotalAmt;

        }

        public string SaveSupplierPayment(int PurchaseTransactionID, decimal PaidAmount, string PaymentDate, int UpdatedByUserID, string SupplierPaymentNo, decimal BalanceAmount, string Comment)
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
            cmd.Parameters.AddWithValue("@BalanceAmount", BalanceAmount);
            cmd.Parameters.AddWithValue("@Comment", Comment);
            
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;
        }

        public DataSet SetSupplierPaymentRecieptNo()
        {
            con = conn.GetConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand("SetSupplierPaymentRecieptNo_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sqlDa.Fill(ds);
            con.Close();
            return ds;
        }
    }
}
