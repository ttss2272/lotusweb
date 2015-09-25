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
    public partial class WarehouseStock : System.Web.UI.Page
    {
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  Declare Variables
         */
        #region----------------------------------Declare Variable----------------------------------
        BLWarehouse objWarehouse= new BLWarehouse();
        BLWarehouseStock objWarehouseStock = new BLWarehouseStock();
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  Page_Load
         */

        #region---------------------------------Page_Load--------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                { 
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
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  Bindwarehouse
         */
        #region-------------------------------BindWarehouse---------------------------------------
        private void BindWarehouse()
        {
            DataSet dsWarehosue = objWarehouse.BindWarehouse(0, 1);

            if (dsWarehosue.Tables.Count != 0)
            {
                if (dsWarehosue.Tables[0].Rows.Count != 0)
                {
                    ddlWarehouse.DataTextField = "Warehouse Name";
                    ddlWarehouse.DataValueField = "WarehouseID";
                    ddlWarehouse.DataSource = dsWarehosue;
                    ddlWarehouse.DataBind();
                }
                else
                {
                    ddlWarehouse.DataSource = null;
                    ddlWarehouse.DataBind();
                }
                ddlWarehouse.Items.Insert(0, new ListItem("Select Warehouse", "-1"));
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  ddlWarehouse_SelectedIndexChanged
         */
        #region------------------------ddlWarehosue_SelectedIndexChanged---------------------------------
        protected void ddlWarehouse_SelectedIndexChanged(object sender, EventArgs e)
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  BindWarehosueStock GridView
         */

        #region------------------------------BindWarehouseStock GridView()------------------------------
        private void BindGridView()
        {
            DataSet dsWaehouseStock = objWarehouseStock.GetWarehouseProductStock(Convert.ToInt32(ddlWarehouse.SelectedValue));

            if (dsWaehouseStock.Tables.Count != 0)
            {
                if (dsWaehouseStock.Tables[0].Rows.Count != 0)
                {
                    grvWarehouseStock.DataSource = dsWaehouseStock;
                    grvWarehouseStock.DataBind();
                }
                else
                {
                    grvWarehouseStock.DataSource = null;
                    grvWarehouseStock.DataBind();
                }
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  GetProduct stock for perticular product of Warehouse
         */
        #region--------------------------GetProductStock()--------------------------------------------
        private void GetProductStock()
        {
            DataSet dsWaehouseStock = objWarehouseStock.GetProductStock(Convert.ToInt32(ddlWarehouse.SelectedValue),Convert.ToInt32(ddlProduct.SelectedValue));

            if (dsWaehouseStock.Tables.Count != 0)
            {
                if (dsWaehouseStock.Tables[0].Rows.Count != 0)
                {
                    txtStock.Text = dsWaehouseStock.Tables[0].Rows[0]["Stock"].ToString();
                }
                else
                {
 
                }
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 24 Sept 2015
         * Purpose :-  ddlProductSelected Index Changed
         */
        #region-------------------------ddlProduct_SelectedIndexChanged-------------------------------------
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetProductStock();
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