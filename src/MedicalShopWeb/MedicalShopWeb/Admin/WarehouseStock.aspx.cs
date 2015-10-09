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
                    BindWarehouse();
                    
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
            ddlWarehouse.Items.Clear();
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
                ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
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
                BindProduct();
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 9 Oct 2015
         * Purpose :- bind product to dropdown
         */
        #region-----------------------------------------GetWarehouseProduct()-----------------------------
        private void BindProduct()
        {
            DataSet dsWarehosueproduct = objWarehouseStock.GetWarehouseProduct(Convert.ToInt32(ddlWarehouse.SelectedValue));
            ddlProduct.Items.Clear();
            if (dsWarehosueproduct.Tables.Count != 0)
            {
                if (dsWarehosueproduct.Tables[0].Rows.Count != 0)
                {
                    ddlProduct.DataTextField = "ProductName";
                    ddlProduct.DataValueField = "ProductID";
                    ddlProduct.DataSource = dsWarehosueproduct;
                    ddlProduct.DataBind();
                }
                else
                {
                    ddlProduct.DataSource = null;
                    ddlProduct.DataBind();
                }

                ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
            }
        }
        #endregion


        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 25 Sept 2015
         * Purpose :- Page Index Changing
         */
        #region------------------------------grvWarehouseStock_PageIndexChanging------------------------
        protected void grvWarehouseStock_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvWarehouseStock.PageIndex = e.NewPageIndex;
                BindGridView();
                grvWarehouseStock.Focus();
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
         * Created Date:- 09 Oct 2015
         * Purpose :- check perticular product  Stock
         */
        #region--------------------------------btnCheck_Click---------------------------
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFields();
                grvWarehouseStock.DataSource = null;
                grvWarehouseStock.DataBind();
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
         * Created Date:- 09 Oct 2015
         * Purpose :- Click on Close Button
         */
        #region------------------------------btnClose_Click-----------------------------------------------
        protected void btnClose_Click(object sender, EventArgs e)
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
         * Created Date:- 09 Oct 2015
         * Purpose :- Click on Close Button
         */
        #region------------------------------ClearFields----------------------------------------
        private void ClearFields()
        {
            BindWarehouse();
            txtStock.Text = "";
 
        }
        #endregion
    }
}