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
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Declare Variables
         */
        #region---------------------------------Declare variables-------------------------------
        int WarehouseID=0, UpdatedByUserID, IsActive;
        string WarehouseName, Location;
        BLWarehouse objWarehouse = new BLWarehouse();
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Page _Load
         */
        #region----------------------------------------PageLoad-------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindGridview();
                    if (Request.QueryString["WarehouseID"] != null)
                    {
                        if (Request.QueryString["iss"] == "1")
                        {
                            btnSave.Text = "Delete";
                        }
                        setValues();
                    }
                }

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }

        }
        #endregion

        #region------------------------------SetValues()---------------------------------------
        private void setValues()
        {
            DataSet dsWarehouseValues = objWarehouse.GetWarehouseDetail(Convert.ToInt32(Request.QueryString["WarehouseID"]));
            if (dsWarehouseValues.Tables.Count != 0)
            {
                if (dsWarehouseValues.Tables[0].Rows.Count != 0)
                {
                    lblPageHeading.Text = "Edit :-" + dsWarehouseValues.Tables[0].Rows[0]["WarehouseName"].ToString();
                    txtWarehouseName.Text = dsWarehouseValues.Tables[0].Rows[0]["WarehouseName"].ToString();
                    txtLocation.Text = dsWarehouseValues.Tables[0].Rows[0]["WarehouseLocation"].ToString();
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Information Not Available";

                }
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  button Save
         */
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Set Parametrs
         */
        #region----------------------------SetParameters()------------------------------------
        private void SetParameters()
        {
            if (Request.QueryString["WarehouseID"] != null)
            {
                WarehouseID = Convert.ToInt32(Request.QueryString["WarehouseID"]);
            }
            else
            {
                WarehouseID = 0;
            }
            
            WarehouseName = txtWarehouseName.Text;
            Location = txtLocation.Text;
            UpdatedByUserID = 1;
            IsActive = 1;
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Clear Fields
         */
        #region-------------------------ClearFiealds----------------------------------------
        private void ClearFields()
        {
            txtWarehouseName.Text = "";
            txtLocation.Text = "";
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindGridview
         */
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Save ()
         */
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