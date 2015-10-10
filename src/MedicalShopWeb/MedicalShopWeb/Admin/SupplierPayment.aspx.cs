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
        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:- Declare variables 
         */
        
        #region-----------------------DeclareVariables------------------
        BLSupplierPayment objSupllierPay = new BLSupplierPayment();
        BLSupplier objSupplierName = new BLSupplier();
        int PurchaseTransactionID, UpdatedByUserID;
        decimal PaidAmount, BalanceAmount;
        string PaymentDate, Comment, SupplierPaymentNo;
        #endregion

        /*Created by:-PriTesh Sortee
         * Date:- 08 Oct 2015
         * Purpose:- Page Load event
         */
        #region--------------------------------------Page_Load------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    ClearFields();
                 
                }
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion
        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-Bind Purchase Invoice No to Dropdownlist
         */
        #region----------------------BindPurchaseInvoiceNo--------
        private void BindPurchaseInvoiceNo()
        {
            DataSet dsPurchaseInvoice = objSupllierPay.BindPurchaseInvoiceNo(Convert.ToInt32(ddlSupplier.SelectedValue));
            ddlPurchaseInvoiceNo.Items.Clear();
            txtTotalAmo.Text = "0.00";
            txtCurrentBal.Text = "0.00";
            txtPaidAmo.Text = "0.00";
            txtRemBal.Text = "0.00";
            if (dsPurchaseInvoice.Tables.Count !=0 )
            {
                if (dsPurchaseInvoice.Tables[0].Rows.Count != 0)
                {
                    ddlPurchaseInvoiceNo.DataTextField = "SupplierReciptNo";
                    ddlPurchaseInvoiceNo.DataValueField = "PurchaseTransactionID";
                    ddlPurchaseInvoiceNo.DataSource = dsPurchaseInvoice;
                    ddlPurchaseInvoiceNo.DataBind();
                }
                ddlPurchaseInvoiceNo.Items.Insert(0, new ListItem("Select Invoice No", "-1"));
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
                ddlPurchaseInvoiceNo.Items.Insert(0, new ListItem("Select Invoice No", "-1"));
                
            }
        }
        #endregion

        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-Bind Total cost of invoice And Balance Amount
         */
        #region-----------------------------ddlPurchaseInvoiceNo_SelectedIndexChanged---------------------------------
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
        #endregion

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
            if (txtPaidAmo.Text != null||  txtPaidAmo.Text!="")
            {
                decimal CurrentBalance=Convert.ToDecimal(txtCurrentBal.Text.ToString());
                decimal PaidAmount = Convert.ToDecimal(txtPaidAmo.Text.ToString());
                decimal remainningBalabce = CurrentBalance - PaidAmount;
                if (remainningBalabce < 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Paid Amount Must Be Same or less than Remaining Balance";
                    txtRemBal.Text = "";
                    txtPaidAmo.Text = "";
                    txtPaidAmo.Focus();
                }
                txtRemBal.Text = Convert.ToString(CurrentBalance - PaidAmount);
            }
        }
        #endregion

        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-btnSave_Click
         */
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
            finally
            {
                Response.AppendHeader("Refresh", "2;url=SupplierPayment.aspx");
            }
        }

        #endregion

        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:-Save Supplier Payment
         */
        #region----------------------SaveSupplierPayment----------
        private void SaveSupplierPayment()
        {
            string result = objSupllierPay.SaveSupplierPayment(PurchaseTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, SupplierPaymentNo, BalanceAmount, Comment);
            if (result == "Supplier Payment Save Sucessfully...!!!")
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

        /*Created by Sameer Shinde
         * Date:-29/09/2015
         * Purpose:- Set Parameters
         */
        #region-------------------SetParameters-----------------------
        private void SetParameters()
        {
            PurchaseTransactionID = Convert.ToInt32(ddlPurchaseInvoiceNo.SelectedValue.ToString());
            PaidAmount = Convert.ToDecimal(txtPaidAmo.Text);
            PaymentDate = txtPaymentDate.Text;
            UpdatedByUserID = 1;
            //string ReceivedBy = txtReceivedBy.Text;
            //Place = "Place";
            SupplierPaymentNo = txtInvoiceNo.Text;
            if (SupplierPaymentNo == "")
            {
                SupplierPaymentNo = "no1";
            }
            BalanceAmount = Convert.ToDecimal(txtRemBal.Text);
            Comment = txtComment.Text;
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- Bind Supplier Invoice No
         */
        #region--------------------------ddlSupplier_SelectedIndexChanged------------------------------------
        protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindPurchaseInvoiceNo();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- Clear Button click
         */
        #region-------------------------------------btnClear_Click-----------------------------------
        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFields();
                
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- Clear all fields
         */
        #region------------------------------Clear()----------------------------------------
        private void ClearFields()
        {
            txtPaymentDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtPaidAmo.Text = "0.00";
            txtComment.Text = "";
            txtTotalAmo.Text = "0.00";
            txtCurrentBal.Text = "0.00";
            txtRemBal.Text = "0.00";
            BindSupplierName();
            SetSupplierPaymentRecieptNo();
            ddlSupplier.SelectedValue = "-1";
            ddlPurchaseInvoiceNo.Text = "-1";
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- Close button click
         */
        #region---------------------------------lnkClose_Click------------------------------------------------------
        protected void lnkClose_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../Defult.aspx", false);
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- Set SupplierReciept No
         */
        #region------------------------------------SetSupplierRecieptNo()------------------------------
         public void SetSupplierPaymentRecieptNo()
        {
            DataSet ds = objSupllierPay.SetSupplierPaymentRecieptNo();
            txtInvoiceNo.Text = ds.Tables[0].Rows[0]["SupplierPaymentRecieptNo"].ToString();
        }
       #endregion
    }
}