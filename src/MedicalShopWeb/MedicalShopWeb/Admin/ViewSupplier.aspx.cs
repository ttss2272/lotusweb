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
    public partial class ViewSupplier : System.Web.UI.Page
    {
        #region---------------------------Declare variables-----------------------------------
        BLSupplier objSupplier = new BLSupplier();
        #endregion

        #region------------------------------------Page_Load------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindSupplier();
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region------------------------------------btnSearch_Click------------------------------------
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

        #region--------------------------------btnClose_Click----------------------------
        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region-------------------------------------BindGridView()-------------------------
        private void BindGridView()
        {
            DataSet dsSupplier = objSupplier.GetSupplier(Convert.ToInt32(ddlSupplier.SelectedValue));

            if (dsSupplier.Tables.Count != 0)
            {
                if (dsSupplier.Tables[0].Rows.Count != 0)
                {
                    grvSupplier.DataSource = dsSupplier;
                    grvSupplier.DataBind();
                }
                else
                {
                    grvSupplier.DataSource = null;
                    grvSupplier.DataBind();
                }
            }
        }

        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- BindSupplier()
         */
        #region---------------------------------------BindSupplier()----------------------------------------
        private void BindSupplier()
        {
            DataSet dsSupplier = objSupplier.BindSupplier(0);
            ddlSupplier.Items.Clear();

            if (dsSupplier.Tables.Count != 0)
            {
                if (dsSupplier.Tables[0].Rows.Count != 0)
                {
                    ddlSupplier.DataTextField = "CompanyName";
                    ddlSupplier.DataValueField = "SupplierID";
                    ddlSupplier.DataSource = dsSupplier;
                    ddlSupplier.DataBind();
                }
                else
                {
                    ddlSupplier.DataSource = null;
                    ddlSupplier.DataBind();
                }
                ddlSupplier.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

    }
}