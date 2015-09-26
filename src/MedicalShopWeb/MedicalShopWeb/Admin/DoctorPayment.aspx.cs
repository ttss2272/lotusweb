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
    public partial class DoctorPayment : System.Web.UI.Page
    {
        BLDoctorPayment objDoctorPayment = new BLDoctorPayment();
        #region--------------SetVariables-------------
        int DoctorPaymentID = 0;
        int rst;
        int DoctorsID, UpdatedByUserID, DoctorID,IsActive;
        string PaidAmountDate, Comment, RecieptNo;
        double PaymentAmount;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    BindDoctor();
                    SetDoctorReciptNo();
                    
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();

            }
        }

        private void SetDoctorReciptNo()
        {
 	         DataTable dt = objDoctorPayment.SetDoctorReciptNo();
              txtReceiptNo.Text=  dt.Rows[0][0].ToString();
        }

        #region--------------------------------BindDoctor()---------------------------
        private void BindDoctor()
        {
            DataSet dsDoctorPay = objDoctorPayment.GetDoctorPay();

            if (dsDoctorPay.Tables.Count > 0)
            {
                if (dsDoctorPay.Tables[0].Rows.Count > 0)
                {
                    ddlDrName.DataTextField = "DoctorName";
                    ddlDrName.DataValueField = "DoctorID";
                    ddlDrName.DataSource = dsDoctorPay;
                    ddlDrName.DataBind();
                }
                ddlDrName.Items.Insert(0, new ListItem("Select DoctorName", "-1"));
            }
        }

         #endregion

        #region-------------------------------------------------Setparameters()-------------------------------------------------------------
        public void Setparameters()
        {
            try
            {
                DoctorPaymentID = 0;
                DoctorsID = Convert.ToInt32(ddlDrName.SelectedValue);
                PaidAmountDate = txtPaymentDate.Text;
                PaymentAmount = Convert.ToDouble(txtPaymentAmo.Text);
                Comment = txtComment.Text;
                IsActive = 1;
                UpdatedByUserID = 1;
                RecieptNo = txtReceiptNo.Text;
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region-----------------------------------------SaveDoctorsPayment()---------------------------------------------
        public void SaveDoctorsPayment()
        {
                try
                {                               
                    Setparameters();
                    string Result = objDoctorPayment.SaveDoctorsPayment(DoctorPaymentID, DoctorsID, PaidAmountDate, PaymentAmount, Comment, UpdatedByUserID, IsActive, RecieptNo);
                     if (Result == "Doctor Details Saved Successfully...!!!")
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = Result;                        
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = Result;
                    }
                     //  BindGridView();
                }
            
            catch (Exception ex)
            {
                lblMessage.Text=ex.Message.ToString();
            }
        }
        #endregion

        #region--------------------------------btnClose_Click-------------------------------
        protected void btnClose_Click(object sender, EventArgs e)
        {
             try
            {
               
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

          #region-------------------btnSave_Click------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
             try
            {
                Setparameters();
                 SaveDoctorsPayment();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
                
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=DoctorDetails.aspx");
            }

        }
         #endregion

         #region-------------------------------Clear Field----------------------
        private void ClearFields()
        {
            txtPaymentAmo.Text = "";
            txtComment.Text = "";
            ddlDrName.SelectedValue ="";
            txtPaymentDate.Text = "";
            txtReceiptNo.Text="";
        }
        #endregion
        }

       
    }

