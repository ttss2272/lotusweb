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
        /*
          Created by Sameer   Date:-29/09/2015
          * Declare Variables
          */
        #region------------------SetVariables-----------------
        int SaleTransactionID, UpdatedByUserID;
        decimal PaidAmount, BalanceAmount;
        string PaymentDate, Coment, MedicalPaymentNo;
        BLMedicalPayment objMedicalPayment = new BLMedicalPayment();
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        #endregion

        /*
          Created by Sameer   Date:-29/09/2015
          * 
          */
        #region----------------------Page_Load-------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
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

        /*
         Created by Sameer   Date:-29/09/2015
         * Bind Sale Invoice Number to dropdownlist
         */
        #region----------BindSaleInvoiceNo-------------------
        private void BindSaleInvoiceNo()
        {
            DataSet dsSaleInvoiceNo =objMedicalPayment.BindSaleTransctionNo(Convert.ToInt32(ddlMedicalShop.SelectedValue));
            ddlSaleInvoiceNo.Items.Clear();
            if (dsSaleInvoiceNo.Tables.Count != 0)
            {
                if (dsSaleInvoiceNo.Tables[0].Rows.Count != 0)
                {
                    ddlSaleInvoiceNo.DataTextField = "SaleTransactionNo";
                    ddlSaleInvoiceNo.DataValueField = "SaleTransactionID";
                    ddlSaleInvoiceNo.DataSource = dsSaleInvoiceNo;
                    ddlSaleInvoiceNo.DataBind();
                }
                ddlSaleInvoiceNo.Items.Insert(0, new ListItem("Select Sale Invoice No", "-1"));
            }
        }
        #endregion
        /*
         Created by Sameer   Date:-29/09/2015
         * Bind Medical shop name to dropdownlist
         */
        #region----------------BindMedicalShopName----------------
        private void BindMedicalShopName()
        {
            DataSet dsMedicalName = objMedicalShop.BindMedicalShop(0);
            ddlMedicalShop.Items.Clear();
            if (dsMedicalName.Tables.Count > 0)
            {
                if (dsMedicalName.Tables[0].Rows.Count > 0)
                {
                   ddlMedicalShop.DataTextField = "ShopName";
                   ddlMedicalShop.DataValueField = "MedicalShopID";
                   ddlMedicalShop.DataSource = dsMedicalName;
                   ddlMedicalShop.DataBind();
                }
                ddlMedicalShop.Items.Insert(0, new ListItem("Select Medical Shop", "-1"));
                ddlSaleInvoiceNo.Items.Insert(0, new ListItem("Select Sale Invoice No", "-1"));
            }
        }
        #endregion
        /*
         Created by Sameer   Date:-29/09/2015
         * Bind Total Amount,Current Balance and Remening Balance to Text Box
         */
        #region------------------------ddlSaleInvoiceSelectedIndexChanged---------------------------------
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
        #endregion

        /*
        Created by Sameer   Date:-29/09/2015
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
        * Created By:- Sameer 
        * Purpose :- btnSave_Click
        */
        #region------------------------------------btnSave_Click------------------------------------------
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
            finally
            {
                Response.AppendHeader("Refresh", "2;url=SupplierPayment.aspx");
                
            }
        }
        #endregion

        /*
        * Created By:- Sameer 
        * Purpose :- 
        */
        #region-----------------------SaveMedicalTransction--------------
        private void SaveMedicalTransction()
        {
            string result = objMedicalPayment.SaveMedicalPayment(SaleTransactionID, PaidAmount, PaymentDate, UpdatedByUserID, MedicalPaymentNo, BalanceAmount,Coment);
            if (result == "Medical Payment Save Sucessfully...!!!")
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

        /*
        * Created By:- Sameer 
        */

        #region-------------SetParaMeters------------------
        private void SetParameters()
        {
            SaleTransactionID = Convert.ToInt32(ddlSaleInvoiceNo.SelectedValue.ToString());
            PaidAmount = Convert.ToDecimal(txtPaidAmo.Text);
            PaymentDate = txtPaymentDate.Text;
            UpdatedByUserID = 1;
            //string ReceivedBy = txtReceivedBy.Text;
            //Place = "Place";
            MedicalPaymentNo = txtInvoiceNo.Text;
            BalanceAmount = Convert.ToDecimal(txtRemBal.Text);
            Coment = txtComment.Text;
        }
        #endregion
        /*
         Created by Sameer   Date:-29/09/2015
         * Bind Get Reamaing balance
         */
        #region---------------------GetPaidAmtTextchange--------------------------
          protected void txtPaidAmo_TextChanged(object sender, EventArgs e)
        {
            if (txtPaidAmo.Text != null|| txtPaidAmo.Text!="")
            {
                try
                {
                    decimal CurrentBal = Convert.ToDecimal(txtCurrentBal.Text.ToString());
                    decimal paidAmo = Convert.ToDecimal(txtPaidAmo.Text.ToString());
                    decimal RemainningBalance = CurrentBal - paidAmo;
                    if (RemainningBalance < 0)
                    {
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

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:- 8 OCt 2015
         * Purpose :- Clear Fields()
         */
        #region---------------------------ClearFields()----------------------------------------
          private void ClearFields()
          {
              txtPaymentDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
              BindMedicalShopName();
              SetSupplierPaymentRecieptNo();
              txtTotalAmo.Text = "0.00";
              txtCurrentBal.Text = "0.00";
              txtPaidAmo.Text = "";
              txtRemBal.Text = "0.00";
              txtComment.Text = "";
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
              DataSet ds = objMedicalPayment.SetMedicalPaymentRecieptNo();
              txtInvoiceNo.Text = ds.Tables[0].Rows[0]["MedicalPaymentRecieptNo"].ToString();
          }
          #endregion

          /*
         * Created By :- PriTesh D. Sortee
         * Created Date :- 8 Oct 2015
         * Pupose :- LCear button click
         */
          #region-----------------------------lnkClear_Click--------------------------
          protected void lnkClear_Click(object sender, EventArgs e)
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
         * Pupose :- Close Button click
         */
          #region---------------------------lnkClose_Click--------------------------------
          protected void lnkclose_Click(object sender, EventArgs e)
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
         * Created Date :- 10 Oct 2015
         * Pupose :- ddlMedicalShop_SelectedIndexChanged
         */
          #region-------------------------ddlMedicalShop_SelectedIndexChanged-----------------------------
          protected void ddlMedicalShop_SelectedIndexChanged(object sender, EventArgs e)
          {
              try
              {
                  BindSaleInvoiceNo();
              }
              catch (Exception ex)
              {
                  lblMessage.ForeColor = System.Drawing.Color.Red;
                  lblMessage.Text = ex.Message.ToString();
              }
          }
          #endregion
    }
}