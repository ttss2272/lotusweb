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
    public partial class ViewDoctorDetails : System.Web.UI.Page
    {
        #region-----------------------DeclareVariables-------------------
        BLDoctorDetails objDoctorDetails = new BLDoctorDetails();
        #endregion
        #region----------------------------PageLoad------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindDoctorNames();
                   
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
                
            }

        }
          
        #region------------------------BindDoctorName----------------------------- 
        private void BindDoctorNames()
        {
            DataSet dsDoctorName = objDoctorDetails.GetDoctorName();
            ddlDoctorName.Items.Clear();
            if (dsDoctorName.Tables.Count > 0)
            {
                if (dsDoctorName.Tables[0].Rows.Count > 0)
                {
                    ddlDoctorName.DataTextField = "DoctorName";
                    ddlDoctorName.DataValueField = "DoctorID";
                    ddlDoctorName.DataSource = dsDoctorName;
                    ddlDoctorName.DataBind();
                }
                ddlDoctorName.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion
        
        #region------------------BindGridView----------------------------------
        private void BindGridView()
        {
            try
            {
                DataSet dsGridview = objDoctorDetails.GetAllData(Convert.ToInt32(ddlDoctorName.SelectedValue));

                if (dsGridview.Tables[0].Rows.Count != 0)
                {
                    grvDoctorDetails.DataSource = dsGridview.Tables[0];
                    grvDoctorDetails.DataBind();
                }
                else
                {
                    lblMessage.Text = "Records not available";
                    grvDoctorDetails.DataSource = null;
                    grvDoctorDetails.DataBind();
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion
        #endregion

        #region--------------------------------grvDoctorDetails_PageIndexChanging------------------------
        protected void grvDoctorDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
               grvDoctorDetails.PageIndex = e.NewPageIndex;
                BindGridView();
                grvDoctorDetails.Focus();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        
        }
        #endregion
        #region-------------------SearchClick-----------------------------
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                BindGridView();

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