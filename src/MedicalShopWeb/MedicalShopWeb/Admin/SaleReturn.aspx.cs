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
    public partial class SaleReturn : System.Web.UI.Page
    {
        #region-------------------------------Declare Variable Globally-----------------------
        BLSaleReturn objSaleReturn = new BLSaleReturn();
        BLWarehouse objWarehouse = new BLWarehouse();
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLMedicalStock objMedicalStock = new BLMedicalStock();
        static int temp = 1;
        int ProductID, MaxSalesReturnID, SalesReturnID;
        string ReturnInvoiceNo, ReturnDate, Comment, Reason;
        int MedicalShopID, TotQty;
        int UpdatedByUserID, WarehouseID;
        double Quantity, Rate, Stock;

        #endregion

        #region-----------------------------Page_Load-----------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindWarehouse();
                    BindMedicalShop1();
                    //ReturnInvoiceNo();                                      
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region-----------------------------------btnAdd_Click-------------------------------
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
        

        #region-----------------------------------btnSave_Click-------------------------------
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

        #region--------------------------------btnCancel_Click--------------------------------
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
        #region----------------------------------BindMedicalShop()----------------------------
        private void BindMedicalShop1()
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
        #region-----------------------------BindWarehouse()-----------------------------------
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

        #region--------------------------------------Setparameter()------------------------------
        public void Setparameter()
        {
            ReturnInvoiceNo = txtRetrunrInvoiceNo.Text;
            MedicalShopID = Convert.ToInt32(ddlMedical.SelectedValue);
            ReturnDate = txtSaleReturnDate.Text;
            UpdatedByUserID = 1;
            WarehouseID = Convert.ToInt32(ddlWarehouse.SelectedValue);
            Comment = txtComment.Text;
            ProductID = Convert.ToInt32(ddlProduct.SelectedValue);
            Reason = txtReason.Text;
            if (txtQuantity.Text != "")
                Quantity = Convert.ToDouble(txtQuantity.Text);
            if (txtRate.Text != "")
                Rate = Convert.ToDouble(txtRate.Text);

        }
        #endregion

        #region-----------------------ClearFields()-------------------
        private void clearFields()
        {
            ddlWarehouse.Text = "Select";
            ddlMedical.Text = "Select";
            ddlProduct.Text = "Select";
            txtQuantity.Text = "";
            txtReason.Text = "";
            txtRate.Text = "";
            txtComment.Text = "";
            txtCurrentStock.Text = "";
        }
        #endregion

        #region-----------------------Medical_SelectedIndexChanged-------------------------
        protected void ddlMedical_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindMedicalProducts();
               // BindGridView();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region--------------------------------BindMedicalProducts()-----------------------
        private void BindMedicalProducts()
        {
            DataSet dsMedicalProduct = objMedicalStock.BindMedicalProduct(Convert.ToInt32(ddlMedical.SelectedValue));
            ddlProduct.Items.Clear();
            if (dsMedicalProduct.Tables.Count != 0)
            {
                if (dsMedicalProduct.Tables[0].Rows.Count != 0)
                {
                    ddlProduct.DataTextField = "ProductName";
                    ddlProduct.DataValueField = "ProductID";
                    ddlProduct.DataSource = dsMedicalProduct;
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
    }
}