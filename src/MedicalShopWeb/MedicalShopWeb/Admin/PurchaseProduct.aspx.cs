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
    public partial class PurchaseProduct : System.Web.UI.Page
    {
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 Sept 2015
         * Purpose :-  Declare Variables
         */
        #region-----------------------------------Declare Variable Globally-------------------------
        BLWarehouse objWarehouse = new BLWarehouse();
        BLProductType objProductType = new BLProductType();
        BLProducts objProducts = new BLProducts();
        BLSupplier objSupplier = new BLSupplier();

        int PurchaseProductID,WarehouseID,SupplierID,ProductTypID,ProductID,IsActive;
            string PurchaseDate,ReceiptNo,ModeOfPayment,BatchNo,ExpiryDate;
            decimal PurchasePrice, SellingPrice, PurchaseQuantity;
        #endregion
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 Sept 2015
         * Purpose :-  Page_load
         */
        #region---------------------------------Page_Load------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindWarehouse();
                    BindSupplier();
                    BindProductType();
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
         * Created Date:- 28 Sept 2015
         * Purpose :-  btnAdd_Click
         */
        #region--------------------------------btnAdd_Click------------------------------------------
        protected void btnAdd_Click(object sender, EventArgs e)
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 Sept 2015
         * Purpose :-  btnSave_Click
         */
        #region---------------------------------------btnSave_Click------------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 Sept 2015
         * Purpose :-  btnCancel_Click
         */
        #region-----------------------------------btnCancel_Click-----------------------------
        protected void BtnCancel_Click(object sender, EventArgs e)
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 Sept 2015
         * Purpose :-  Bindwarehouse()
         */
        #region-------------------------------BindWarehouse()---------------------------------------
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
         * Created Date:- 28 sept 2015
         * purpose :- BindProductType()
         */
        #region-----------------------------------------BindProductType()---------------------------------
        private void BindProductType()
        {
            DataSet dsProductType = objProductType.GetProductType(0, 1);
            ddlProductType.Items.Clear();
            if (dsProductType.Tables.Count > 0)
            {
                if (dsProductType.Tables[0].Rows.Count > 0)
                {
                    ddlProductType.DataTextField = "Product Type";
                    ddlProductType.DataValueField = "ProductTypeID";
                    ddlProductType.DataSource = dsProductType;
                    ddlProductType.DataBind();
                }
                else
                {
                    ddlProductType.DataSource = null;
                    ddlProductType.DataBind();
                }
                ddlProductType.Items.Insert(0, new ListItem("Select Product Type", "-1"));
                ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- ddlProductType_SelectedIndexChanged
         */
        #region---------------------------------ddlProductType_SelectedIndexChanged-----------------------
        protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
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
         * Created Date:- 28 sept 2015
         * purpose :- BindProduct()
         */
        #region------------------------------------------BindProduct()---------------------------------------
        private void BindProduct()
        {
            
            DataSet dsProduct=objProducts.BindProductOnProductType(Convert.ToInt32(ddlProductType.SelectedValue));
            ddlProduct.Items.Clear();
            if(dsProduct.Tables.Count!=0)
            {
                if(dsProduct.Tables[0].Rows.Count!=0)
                {
                    ddlProduct.DataTextField="ProductName";
                    ddlProduct.DataValueField="ProductID";
                    ddlProduct.DataSource=dsProduct;
                    ddlProduct.DataBind();
                }
                else
                {
                    ddlProduct.DataSource=null;
                    ddlProduct.DataBind();
                }
                ddlProduct.Items.Insert(0,new ListItem("Select Product","-1"));
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
                ddlSupplier.Items.Insert(0, new ListItem("Select Supplier", "-1"));
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- SetAddParameters()
         */
        #region------------------------------------------SetAddParameters()-----------------------------------
        private void SetAddParameters()
        {
            WarehouseID = Convert.ToInt32(ddlWarehouse.SelectedValue);
            PurchaseDate = txtPurchaseDate.Text;
            SupplierID = Convert.ToInt32(ddlSupplier.SelectedValue);
            ReceiptNo = txtReceiptNo.Text;
            ModeOfPayment = txtModeOfPayment.Text;
            

 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- SetSaveParameters()
         */
        #region------------------------------------------SetSaveParameters()-----------------------------------
        private void SetSaveParameters()
        {
        }
        #endregion

        #region----------------------------------------SetProductDetail()-------------------------------------
        private void SetProductDetail()
        {
            ProductID = Convert.ToInt32(ddlProduct.SelectedValue);
            PurchaseQuantity = Convert.ToDecimal(txtQuantity.Text);
            PurchasePrice = Convert.ToDecimal(txtPurchasePrice.Text);
            SellingPrice = Convert.ToDecimal(txtSellingPrice.Text);
            BatchNo = txtBatchNo.Text;
            ExpiryDate = txtExpiryDate.Text;
        }
        #endregion
    }
}