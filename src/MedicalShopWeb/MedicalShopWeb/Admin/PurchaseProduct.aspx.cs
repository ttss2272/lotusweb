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
        BLPurchaseProduct objPurchaseProduct = new BLPurchaseProduct();

        
        int PurchaseProductID, WarehouseID, SupplierID, ProductTypID, ProductID, IsActive, NewPPID = 0, UpdatedByUserID,rst;
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
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction2();", true);
                    if (ViewState["PPID"] == null)
                    {
                        btnSave.CssClass = "btn btn-success btn-lg disabled";
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
                
                if (ViewState["PPID"] == null)
                {
                    AddDisable();
                    SetAddParameters();
                    ViewState["PPID"] = objPurchaseProduct.SavePurchaseProduct(PurchaseProductID, WarehouseID, PurchaseDate, SupplierID, ReceiptNo, ModeOfPayment, UpdatedByUserID, IsActive);
                }
                if (ViewState["PPID"] != null)
                {
                    btnSave.CssClass = "btn btn-success btn-lg";
                        SetProductDetail();
                    SaveTempPurchaseProduct();
                   
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error to Save Purchase Product.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                GetTotal();
                BindGridView();
                AddClear();

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
                SavePurchaseDetail();


            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
 
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
         * purpose :- SetAddParameters() for Save PurchaseTransaction on click on add button
         */
        #region------------------------------------------SetAddParameters()-----------------------------------
        private void SetAddParameters()
        {
            PurchaseProductID = 0;
            WarehouseID = Convert.ToInt32(ddlWarehouse.SelectedValue);
            PurchaseDate = txtPurchaseDate.Text;
            SupplierID = Convert.ToInt32(ddlSupplier.SelectedValue);
            ReceiptNo = txtReceiptNo.Text;
            ModeOfPayment = txtModeOfPayment.Text;
            UpdatedByUserID = 1;
            IsActive = 1;
            

 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- SavePurchaseDetail()
         */
        #region------------------------------------------SetSaveParameters()-----------------------------------
        private void SavePurchaseDetail()
        {
            string Result = objPurchaseProduct.SavePurchaseProductDetail(Convert.ToInt32(ViewState["PPID"]));
            if (Result == "Purchase Transaction Saved Sucessfully...!!!")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = Result;
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = Result;
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 28 sept 2015
         * purpose :- SetProducDetail to enter data in temp table
         */
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

        

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 sept 2015
         * Purpose :- disable fields when edit
         */
        #region--------------------------------------adddisable()-----------------------------------
        private void AddDisable()
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
            //ddlWarehouse.Enabled = false;

            //ddlWarehouse.CssClass = "disabled";
            //ddlWarehouse.CssClass = "readonly";
            //txtPurchaseDate.ReadOnly = true;
            ddlWarehouse.Enabled = false;
            ddlSupplier.Enabled = false;
            txtSupName.Text = ddlSupplier.SelectedItem.Text;
            txtSupName.ReadOnly = true;
            txtWareName.Text = ddlWarehouse.SelectedItem.Text;
            txtWareName.ReadOnly = true;
            txtPurchaseDate.ReadOnly = true;
            txtReceiptNo.ReadOnly = true;
            txtModeOfPayment.ReadOnly = true;
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction();", true); 
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 sept 2015
         * Purpose :- ddlProductSelectedIndexChanged
         */

        #region-------------------------------ddlProductSelectedIndexChanged-----------------------
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindProductPrice();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 Sept 2015
         * Purpose :- Bind product Price
         */
        #region-----------------------------------BindProductPrice()--------------------------------
        private void BindProductPrice()
        {
            DataSet dsProductPrice = objProducts.GetProductPrice(Convert.ToInt32(ddlProduct.SelectedValue));

            if (dsProductPrice.Tables.Count != 0)
            {
                if (dsProductPrice.Tables[0].Rows.Count != 0)
                {
                    txtPurchasePrice.Text = dsProductPrice.Tables[0].Rows[0]["PurchasePrice"].ToString();
                    txtSellingPrice.Text = dsProductPrice.Tables[0].Rows[0]["SallingPrice"].ToString();
                }
                else
                {
                    txtSellingPrice.Text = "0";
                    txtPurchasePrice.Text = "0";
                }
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 Sept 2015
         * Purpose :- Save Temp purchase Product()
         */
        #region-------------------------SaveTempPurchaseProduct()---------------------------
        private void SaveTempPurchaseProduct()
        {
            string Result = objPurchaseProduct.SaveTempPurchaseDetail(Convert.ToInt32(ViewState["PPID"]), ProductID, PurchaseQuantity, PurchasePrice, SellingPrice, BatchNo, ExpiryDate);
            if (Result == "1")
            {
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error to Save Purchase Product Details.";
 
            }
 
        }
        #endregion       

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 Sept 2015
         * Purpose :- BindGridView for Purchase Product
         */
        #region--------------------------------------BindGridView()-------------------------------
        private void BindGridView()
        {
            DataSet dsGetProduct = objPurchaseProduct.GetTempPurchaseDetail(Convert.ToInt32(ViewState["PPID"]));

            if (dsGetProduct.Tables.Count != 0)
            {
                if (dsGetProduct.Tables[0].Rows.Count != 0)
                {
                    grvPurhaseProduct.DataSource = dsGetProduct;
                    grvPurhaseProduct.DataBind();
                }
                else
                { 
                    grvPurhaseProduct.DataSource = null;
                    grvPurhaseProduct.DataBind();
                }
            }
            
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 Sept 2015
         * Purpose :- Clear fiels on click on add
         */
        #region---------------------------------AddClear()-----------------------------------
        private void AddClear()
        {
            txtBatchNo.Text = "";
            ddlProductType.SelectedValue = "-1";
            ddlProduct.SelectedValue = "-1";
            txtPurchasePrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtExpiryDate.Text = "";
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 06 OCT 2015
         * Purpose :- Get Total Price Of Product
         */
        #region-------------------------------------GetTotal()-------------------------------
        private void GetTotal()
        {
            DataSet dsTempPurchaseTotal = objPurchaseProduct.GetTotal(Convert.ToInt32(ViewState["PPID"]));
            if (dsTempPurchaseTotal.Tables.Count != 0)
            {
                if (dsTempPurchaseTotal.Tables[0].Rows.Count != 0)
                {
                    txtTotal.Text=dsTempPurchaseTotal.Tables[0].Rows[0]["Total"].ToString();
                }
                else
                {
                    txtTotal.Text = "0";
                }
            }
        }

        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date 29 Sept 2015
         * Purpose :- Clear fiels on click on Save
         */
        #region-------------------------------------ClearFields()---------------------------
        private void ClearFields()
        {
            txtPurchaseDate.ReadOnly = false;
            txtPurchaseDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtReceiptNo.ReadOnly = false;
            txtReceiptNo.Text = "";
            txtModeOfPayment.ReadOnly = false;
            txtModeOfPayment.Text = "";
            ViewState["PPID"] = null;

            ddlWarehouse.Enabled = true;
            ddlWarehouse.SelectedValue = "-1";
            ddlSupplier.Enabled = true;
            ddlSupplier.SelectedValue = "-1";
            txtSupName.Text = "";
            txtSupName.ReadOnly = false;
            txtWareName.Text = "";
            txtWareName.ReadOnly = false;

            txtTotal.Text = "0.00";
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction2();", true); 
            AddClear();
            grvPurhaseProduct.DataSource = null;
            grvPurhaseProduct.DataBind();
        }
        #endregion
    }
    }
