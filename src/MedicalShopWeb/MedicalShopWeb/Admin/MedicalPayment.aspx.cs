using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLayer;

namespace MedicalShopWeb.Admin
{
    public partial class MedicalPayment : System.Web.UI.Page
    {
        BLMedicalPayment objMedicalPayment = new BLMedicalPayment();
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        #region------------------SetVariables-----------------
        int SaleTransactionID, UpdatedByUserID;
        double PaidAmount, BalanceAmount;
        string PaymentDate, Place, MedicalPaymentNo;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindMedicalShopName();
                    BindSaleInvoiceNo();
                }
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        /*
         Creates by Sameer   Date:-29/09/2015
         * Bind Sale Invoice Number to dropdownlist
         */
        #region----------BindSaleInvoiceNo-------------------
        private void BindSaleInvoiceNo()
        {
            DataSet dsSaleInvoiceNo =objMedicalPayment.BindSaleTransctionNo();

            if (dsSaleInvoiceNo.Tables.Count > 0)
            {
                if (dsSaleInvoiceNo.Tables[0].Rows.Count > 0)
                {
                    ddlSaleInvoiceNo.DataTextField = "SaleTransactionNo";
                    ddlSaleInvoiceNo.DataValueField = "SaleTransactionID";
                    ddlSaleInvoiceNo.DataSource = dsSaleInvoiceNo;
                    ddlSaleInvoiceNo.DataBind();
                }
                ddlMedicalShop.Items.Insert(0, new ListItem("Select Sale Transction Invoice No", "-1"));
            }
        }
        #endregion
        /*
         Creates by Sameer   Date:-29/09/2015
         * Bind Medical shop name to dropdownlist
         */
        #region----------------BindMedicalShopName----------------
        private void BindMedicalShopName()
        {
            DataSet dsMedicalName = objMedicalShop.BindMedicalShop(0);

            if (dsMedicalName.Tables.Count > 0)
            {
                if (dsMedicalName.Tables[0].Rows.Count > 0)
                {
                   ddlMedicalShop.DataTextField = "ShopName";
                   ddlMedicalShop.DataValueField = "MedicalShopID";
                   ddlMedicalShop.DataSource = dsMedicalName;
                   ddlMedicalShop.DataBind();
                }
                ddlMedicalShop.Items.Insert(0, new ListItem("Select Medical Shop Name", "-1"));
            }
        }
        #endregion
        /*
         Creates by Sameer   Date:-29/09/2015
         * Bind Total Amount,Current Balance and Remening Balance to Text Box
         */
        protected void ddlSaleInvoiceNo_SelectedIndexChanged(object sender, EventArgs e)
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
        Creates by Sameer   Date:-29/09/2015
        * Bind Total Amount to Text Box
        */
        #region---------------------BindTotalAmount----------------------
        private void BindTotalAmount()
        {
            DataSet dsBalanceReturn =objMedicalPayment.GetTotalAmount(Convert.ToInt32(ddlSaleInvoiceNo.SelectedValue));

            if (dsBalanceReturn.Tables.Count != 0)
            {
                if (dsBalanceReturn.Tables[0].Rows.Count != 0)
                {
                  txtTotalAmo.Text = dsBalanceReturn.Tables[0].Rows[0]["Total"].ToString();
                  txtCurrentBal.Text = dsBalanceReturn.Tables[0].Rows[0]["BalanceAmount"].ToString();
                }
                else
                {
                    txtTotalAmo.Text = "0";
                }
            }
        }
        #endregion
        /*
         Creates by Sameer   Date:-29/09/2015
         * Bind Get Reamaing balance
         */
        #region---------------------GetRemBalanceTextchange--------------------------
        protected void txtRemBal_TextChanged(object sender, EventArgs e)
        {
            if (txtPaidAmo.Text != null)
            {
                try
                {
                    float CurrentBal = (float)Convert.ToDecimal(txtCurrentBal.Text.ToString());
                    float paidAmo = (float)Convert.ToDecimal(txtPaidAmo.Text.ToString());
                    double RemainningBalance = CurrentBal - paidAmo;
                    if (RemainningBalance < 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Paid Amount Must Be Same or less than Remaining Balance";
                        txtRemBal.Text = "";
                        txtPaidAmo.Text = "";
                    }
                    else
                    {
                        txtRemBal.Text = Convert.ToString(CurrentBal - paidAmo);
                    }
                }
                catch (Exception ex)
                {

                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = ex.Message.ToString();
                }
            }
        }
        #endregion

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveMedicalTransction();
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #region-----------------------SaveMedicalTransction--------------
        private void SaveMedicalTransction()
        {
            string result = objMedicalPayment.SaveMedicalPayment(SaleTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, MedicalPaymentNo, BalanceAmount);
        }
        #endregion
        #region-------------SetParaMeters------------------
        private void SetParameters()
        {
            SaleTransactionID = Convert.ToInt32(ddlSaleInvoiceNo.SelectedValue.ToString());
            PaidAmount = Convert.ToDouble(txtPaidAmo.Text);
            PaymentDate = txtPaymentDate.Text;
            UpdatedByUserID = 1;
            //string ReceivedBy = txtReceivedBy.Text;
            //Place = "Place";
            MedicalPaymentNo = txtInvoiceNo.Text;
            BalanceAmount = Convert.ToDouble(txtRemBal.Text);
        }
        #endregion
    }
}