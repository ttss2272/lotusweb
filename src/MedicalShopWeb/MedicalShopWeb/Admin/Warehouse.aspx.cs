using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;

namespace MedicalShopWeb.Admin
{
    public partial class Warehouse : System.Web.UI.Page
    {
        #region---------------------------------Declare variables-------------------------------
        int WarehouseID=0, UpdatedByUserID, IsActive;
        string WarehouseName, Location;
        BLWarehouse objWarehouse = new BLWarehouse();
        #endregion

        #region----------------------------------------PageLoad-------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindGridview();
                }

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }

        }
        #endregion

        #region---------------------------btnSave_Click-------------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveWarehouse();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                BindGridview();
            }
        }
        #endregion

        #region----------------------------SetParameters()------------------------------------
        private void SetParameters()
        {
            WarehouseID = 0;
            WarehouseName = txtWarehouseName.Text;
            Location = txtLocation.Text;
            UpdatedByUserID = 1;
            IsActive = 1;
        }
        #endregion

        #region-------------------------ClearFiealds----------------------------------------
        private void ClearFields()
        {
            txtWarehouseName.Text = "";
            txtLocation.Text = "";
        }
        #endregion

        #region----------------------------BindGridView------------------------------------
        private void BindGridview()
        {
            DataSet dsWarehouse = objWarehouse.GetWarehouse(0,1);

            if (dsWarehouse.Tables.Count > 0)
            {
                if (dsWarehouse.Tables[0].Rows.Count > 0)
                {
                    grvWarehouse.DataSource=dsWarehouse;
                    grvWarehouse.DataBind();
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Warehouse is not Available";

                    grvWarehouse.DataSource = null;
                    grvWarehouse.DataBind();
                }
            }
 
        }
        #endregion

        #region-----------------------SaveWarehouse()---------------------------------
        private void SaveWarehouse()
        {
            string Result = objWarehouse.SaveWarehosue(WarehouseID, WarehouseName, Location, UpdatedByUserID, IsActive);
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = Result;
        }
        #endregion

    }
}