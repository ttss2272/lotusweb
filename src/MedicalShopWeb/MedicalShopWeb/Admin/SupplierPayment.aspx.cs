using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Data;

namespace MedicalShopWeb.Admin
{
    public partial class SupplierPayment : System.Web.UI.Page
    {
        BLSupplierPayment objSupllierPay = new BLSupplierPayment();
        BLSupplier objSupplierName = new BLSupplier();
        #region-----------------------DeclareVariables------------------
        int PurchaseTransactionID, UpdatedByUserID;
        double PaidAmount, BalanceAmount;
        string PaymentDate, Comment, SupplierPaymentNo;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                 BindSupplierName();
                 BindPurchaseInvoiceNo();
                }
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-Bind Purchase Invoice No to Dropdownlist
         */
        #region----------------------BindPurchaseInvoiceNo--------
        private void BindPurchaseInvoiceNo()
        {
            DataSet dsPurchaseInvoice = objSupllierPay.BindPurchaseInvoiceNo();
            if (dsPurchaseInvoice.Tables.Count > 0)
            {
                if (dsPurchaseInvoice.Tables[0].Rows.Count > 0)
                {
                    ddlSupplier.DataTextField = "SupplierReciptNo";
                    ddlSupplier.DataValueField = "PurchaseTransactionID";
                    ddlSupplier.DataSource = dsPurchaseInvoice;
                    ddlSupplier.DataBind();
                }
                ddlSupplier.Items.Insert(0, new ListItem("Select Purchase Invoice No", "-1"));
            }
        }
        #endregion
        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-Bind Supplier Name to Dropdownlist
         */
        #region-------------------BindSupplierName-------------------------
        private void BindSupplierName()
        {
            DataSet dsSupplierName = objSupplierName.BindSupplier(0);
            if (dsSupplierName.Tables.Count > 0)
            {
                if (dsSupplierName.Tables[0].Rows.Count > 0)
                {
                    ddlSupplier.DataTextField = "CompanyName";
                    ddlSupplier.DataValueField = "SupplierID";
                    ddlSupplier.DataSource = dsSupplierName;
                    ddlSupplier.DataBind();
                }
                ddlSupplier.Items.Insert(0, new ListItem("Select Supplier Name","-1"));
            }
        }
        #endregion

        protected void ddlPurchaseInvoiceNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindTotalAmount();
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        /*
        Created by Sameer   Date:-29/09/2015
        * Bind Total Amount to Text Box
        */
        #region--------------------BindTotalAmount------------------------------
        private void BindTotalAmount()
        {
            DataSet dsTotalAmt = objSupllierPay.GetTotalAmount(Convert.ToInt32(ddlPurchaseInvoiceNo.SelectedValue));
            if (dsTotalAmt.Tables.Count != 0)
            {
                if (dsTotalAmt.Tables[0].Rows.Count != 0)
                {
                    txtTotalAmo.Text = dsTotalAmt.Tables[0].Rows[0]["Total"].ToString();
                    txtCurrentBal.Text = dsTotalAmt.Tables[0].Rows[0]["BalanceAmount"].ToString();
                }
                else
                {
                    txtTotalAmo.Text = "0";
                }
            }
        }
        #endregion
        /* Created by Sameer Shinde
         * Date:-29/29/2015
         * Get Remaining balance on text change event */
        #region----------------------txtPaidAmountTextChange----------------------
        protected void txtPaidAmo_TextChanged(object sender, EventArgs e)
        {
            if (txtPaidAmo.Text != null)
            {
                float CurrentBalance=(float)Convert.ToDecimal(txtCurrentBal.Text.ToString());
                float PaidAmount = (float)Convert.ToDecimal(txtPaidAmo.Text.ToString());
                double remainningBalabce = CurrentBalance - PaidAmount;
                if (remainningBalabce < 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Paid Amount Must Be Same or less than Remaining Balance";
                    txtRemBal.Text = "";
                    txtPaidAmo.Text = "";
                }
                txtRemBal.Text = Convert.ToString(CurrentBalance - PaidAmount);
            }
        }
        #endregion
        #region-----------------SaveClick-------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveSupplierPayment();
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #region----------------------SaveSupplierPayment----------
        private void SaveSupplierPayment()
        {
            string result = objSupllierPay.SaveSupplierPayment(PurchaseTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, SupplierPaymentNo, BalanceAmount, Comment);
            if (result == "Supplier Payment Details Save Sucessfully")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = result;
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = result;
            }
        }
        #endregion
        #region-------------------SetParameters-----------------------
        private void SetParameters()
        {
            PurchaseTransactionID = Convert.ToInt32(ddlPurchaseInvoiceNo.SelectedValue.ToString());
            PaidAmount = Convert.ToDouble(txtPaidAmo.Text);
            PaymentDate = txtPaymentDate.Text;
            UpdatedByUserID = 1;
            //string ReceivedBy = txtReceivedBy.Text;
            //Place = "Place";
            SupplierPaymentNo = txtInvoiceNo.Text;
            BalanceAmount = Convert.ToDouble(txtRemBal.Text);
            Comment = txtComment.Text;
        }
        #endregion
        #endregion
    }
}