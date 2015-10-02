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
    public partial class SaleTransaction : System.Web.UI.Page
    {
        #region--------------------------Declare Variable--------------------
        BLSaleTransaction objSaleTransaction = new BLSaleTransaction();
        BLWarehouse objWarehouse = new BLWarehouse();
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLProducts objProducts = new BLProducts();
        BLWarehouseStock objWarehouseStock = new BLWarehouseStock();
        BLPurchaseProduct objPurchaseProduct = new BLPurchaseProduct();
        #endregion

        #region-------------------------------------Page_Load-----------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindWarehouse();
                    BindMedicalShop();
                    BindProduct();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region---------------------------------btnAdd_Click1---------------------------------
        protected void btnAdd_Click1(object sender, EventArgs e)
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

        #region---------------------------------btnAdd_Click---------------------------------
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

        #region---------------------------------btnSave_Click---------------------------------
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

        #region---------------------------------btnCancel_Click---------------------------------
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
        * Purpose :-  BindMedicalShop() 
        */
        #region-------------------------------BindMedicalShop()-----------------------
        private void BindMedicalShop()
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShop(0);

            if (dsMedicalShop.Tables.Count != 0)
            {
                if (dsMedicalShop.Tables[0].Rows.Count != 0)
                {
                    ddlMedical.DataTextField = "ShopName";
                    ddlMedical.DataValueField = "MedicalShopID";
                    ddlMedical.DataSource = dsMedicalShop;
                    ddlMedical.DataBind();
                }
                else
                {
                    ddlMedical.DataSource = null;
                    ddlMedical.DataBind();
                }
                ddlMedical.Items.Insert(0, new ListItem("Select Medical", "-1"));
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
         * Created Date:- 28 Sept 2015
         * Purpose :-  GetProduct stock for perticular product of Warehouse
         */
        #region--------------------------GetProductStock()--------------------------------------------
        private void GetProductStock()
        {
            DataSet dsWaehouseStock = objWarehouseStock.GetProductStock(Convert.ToInt32(ddlWarehouse.SelectedValue), Convert.ToInt32(ddlProduct.SelectedValue));
            DataSet dsSellingPrice = objProducts.GetProductPrice(Convert.ToInt32(ddlProduct.SelectedValue));
            if (dsWaehouseStock.Tables.Count != 0)
            {
                if (dsWaehouseStock.Tables[0].Rows.Count != 0)
                {
                    txtCurrentStock.Text = dsWaehouseStock.Tables[0].Rows[0]["Stock"].ToString();
                    txtSalePrice.Text = dsSellingPrice.Tables[0].Rows[0]["SellingPrice"].ToString();
                    txtTotal.Text = "";
                }
                else
                {
                    txtCurrentStock.Text = "0";
                }
            }
        }
        #endregion
        /*
         * Created By:- Sameer Shinde
         * Created Date:-02/10/2015
         * Purpose:-Bind Product to dropdoown
         */
        #region--------------------------BindProduct()---------------------------------------------
        private void BindProduct()
        {
            DataSet dsProduct =objProducts.BindProduct(0);
            ddlProduct.Items.Clear();
            if (dsProduct.Tables.Count != 0)
            {
                if (dsProduct.Tables[0].Rows.Count != 0)
                {
                    ddlProduct.DataTextField = "ProductName";
                    ddlProduct.DataValueField = "ProductID";
                    ddlProduct.DataSource = dsProduct;
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
         * Created By:- Sameer Shinde
         * Created Date:-02/10/2015
         * Purpose:-Get Product Stock 
         */
        #region----------------------------------ProductSelectedIndexChange-------------------
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetProductStock();
        }
        #endregion

    }
}