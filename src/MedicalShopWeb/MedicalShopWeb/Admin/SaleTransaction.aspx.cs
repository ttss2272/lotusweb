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
        int WarehouseID,MedicalID, UpdatedByUSerID, IsActive, ProductID;
        string date, Product, CurrentStock, comment, SaleTransctionNo;
        decimal SalePrice, Quantity,PaidAmt,DiscountAmt,BalAmt,Total, FinalDiscountAmt;
        #endregion

        #region-------------------------------------Page_Load-----------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    txtDiscount.Text = "0";
                    txtAmountPaid.Text = "0";
                    BindWarehouse();
                    BindMedicalShop();
                    BindProduct();
                    GetSaleNumber();
                   // ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction2();", true);
                    if (ViewState["SPID"] == null)
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
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 10 Oct 2015
         * Purpose :-  Bind Sale Number to text box
         */
        #region----------------BindSaleNumberToTextBox-------------------
        private void GetSaleNumber()
        {
            DataSet dsSetSalenumber = objSaleTransaction.GetSaleNo();
            txtSaleTransactionNo.Text = dsSetSalenumber.Tables[0].Rows[0][0].ToString();
        }
        #endregion
        #endregion
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 02 Oct 2015
         * Purpose :-  btnAdd_Click
         */
        #region---------------------------------btnAdd_Click1---------------------------------
        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                int SaleTransactionID = 0;
                if (ViewState["SPID"] == null)
                {
                    AddDisable();
                    SetAddParameters();
                    ViewState["SPID"] = objSaleTransaction.SaveSaleProduct(SaleTransactionID, SaleTransctionNo, WarehouseID, MedicalID, date, UpdatedByUSerID);
                }
                if (ViewState["SPID"] != null)
                {
                    btnSave.CssClass = "btn btn-success btn-lg";
                    SetProductDetail();
                    SaveTempSaleProduct();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 02 Oct 2015
         * Purpose :-  Save Temporarly Sale Product
         */
        
        #region-------------------------------SaveTempSaleProduct------------------------------
        private void SaveTempSaleProduct()
        {
            try
            {
                string Result = objSaleTransaction.SaveTempSaleDetail(Convert.ToInt32(ViewState["SPID"]), ProductID, Quantity, SalePrice,DiscountAmt);
                if (Result == "1")
                {

                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error to Save Sale Product Details.";

                }
                Total = Total + (Quantity * SalePrice);
                 txtTotal.Text = Total.ToString();
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
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 09 Oct 2015
         * Purpose :-  Get Temp Total
         */
        #region---------------------------------GetTotal-----------------------------------
        private void GetTotal()
        {
            DataSet dsGetTotal = objSaleTransaction.GetTotal(Convert.ToInt32(ViewState["SPID"]));
            if (dsGetTotal.Tables.Count != 0)
            {
                if (dsGetTotal.Tables[0].Rows.Count != 0)
                {
                    txtTotal.Text = dsGetTotal.Tables[0].Rows[0]["Total"].ToString();
                }
                else
                {
                    txtTotal.Text = "0";
                }
            }
        }
        #endregion
    
        #region----------------------------------BindGridView-------------------------------------
        private void BindGridView()
        {
            DataSet dsGetProduct =objSaleTransaction.GetTempSaleDetail(Convert.ToInt32(ViewState["SPID"]));

            if (dsGetProduct.Tables.Count != 0)
            {
                if (dsGetProduct.Tables[0].Rows.Count != 0)
                {
                   grvSaleProduct.DataSource = dsGetProduct;
                   grvSaleProduct.DataBind();
                }
                else
                {
                    grvSaleProduct.DataSource = null;
                    grvSaleProduct.DataBind();
                }
            }
        }
        #endregion
        #endregion
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 02 Oct 2015
         * Purpose :-  Set Product Details
         */
        
        #region------------------------------SetProductDetail()--------------------------------------
        private void SetProductDetail()
        {
            ProductID = Convert.ToInt32(ddlProduct.SelectedValue);
            Quantity =Convert.ToDecimal(txtQuantity.Text);
            SalePrice = Convert.ToDecimal(txtSalePrice.Text);
            DiscountAmt = 0;
            
        }
        #endregion
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 02 Oct 2015
         * Purpose :-  Add Parameter
         */
         #region-------------------------SetAddParaMeters------------------------
        private void SetAddParameters()
        {

            SaleTransctionNo = txtSaleTransactionNo.Text;
            date = txtSaleDate.Text;
            WarehouseID =Convert.ToInt32(ddlWarehouse.SelectedValue);
            MedicalID =Convert.ToInt32(ddlMedical.SelectedValue);
            Product = ddlProduct.SelectedValue;
            CurrentStock = txtCurrentStock.Text;
            SalePrice =Convert.ToDecimal(txtSalePrice.Text);
            Quantity =Convert.ToDecimal(txtQuantity.Text);
            DiscountAmt = 0;
            BalAmt = 0;
            UpdatedByUSerID = 1;
            IsActive = 1;
        }
        #endregion
        /*
         * Created By :- Sameer Shinde
         * Created Date:- 02 Oct 2015
         * Purpose :-  Add Disable
         */
        #region----------------------------------AddDisable----------------------------
        private void AddDisable()
        {
            ddlWarehouse.Enabled = false;
            ddlMedical.Enabled = false;
            //txtSaleDate.Enabled = false;
            
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction();", true); 
        }
        #endregion
        #endregion

             

        #region---------------------------------btnCancel_Click---------------------------------
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFields();
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
                    txtSalePrice.Text = dsSellingPrice.Tables[0].Rows[0]["SallingPrice"].ToString();
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

       
        #region---------------------------------AddClear()-----------------------------------
        private void AddClear()
        {
           //ddlWarehouse.SelectedValue= "-1";
           //ddlMedical.SelectedValue = "-1";
           ddlProduct.SelectedValue = "-1";
           txtCurrentStock.Text = "";
           txtSalePrice.Text = "";
           txtQuantity.Text = "";
           
        }
        #endregion
        /*
         * Created By:- Sameer Shinde
         * Created Date:-09/10/2015
         * Purpose:-Calculate Discount
         */
        #region-----------------------DiscountTextchange---------------------------------
        protected void txtDiscount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                Total =Convert.ToDecimal(txtTotal.Text);
                if (txtDiscount.Text != "")
                {
                    DiscountAmt = (Decimal)Convert.ToDecimal(txtDiscount.Text);

                }
                else
                {
                    DiscountAmt = 0;
                    txtDiscount.Text = "0";
                }
                if (DiscountAmt <= 40)
                {
                    FinalDiscountAmt = (Total * (DiscountAmt / 100));
                    decimal temp = Math.Round(FinalDiscountAmt, 2);
                    txtFinalTotal.Text = Convert.ToString(Total - temp);
                    BalanceAmount();
                }
                else
                {
                    lblMessage.Text= "Discount Not More Than 40%";
                    txtDiscount.Text = "0";
                }
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #region-------------------------------BalanceAmount-----------------------------------
        private void BalanceAmount()
        {
            decimal fin, disc, tot, amtpd, bal;
            if (txtFinalTotal.Text == "")
            { fin = 0; }
            else
            { fin = Convert.ToDecimal(txtFinalTotal.Text); }
            if (txtDiscount.Text == "")
            { disc = 0; }
            else
            { disc = Convert.ToDecimal(txtDiscount.Text); }
            if (txtAmountPaid.Text == "")
            { amtpd = 0; }
            else
            { amtpd = Convert.ToDecimal(txtAmountPaid.Text); }
            if (txtTotal.Text != "")
            { tot = Convert.ToDecimal(txtTotal.Text); }

          txtBalanceAmount.Text = Convert.ToString(fin - amtpd);
        }
        #endregion

        #region-----------------------------AmountPaidTextChange-----------------------
        protected void txtAmountPaid_TextChanged(object sender, EventArgs e)
        {
            try
            {
                decimal amountPaid =Convert.ToDecimal(txtAmountPaid.Text);
                decimal finalTotal = Convert.ToDecimal(txtFinalTotal.Text);
                 if (txtFinalTotal.Text != "")
                {
                    if (amountPaid > finalTotal)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text ="Paid Amount Must Be Less Than Or Equal To Final Total";
                    }
                    else
                    {
                        txtBalanceAmount.Text = Convert.ToString(Convert.ToDecimal(txtFinalTotal.Text) - Convert.ToDecimal(txtAmountPaid.Text));
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

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            try
            {
                string result = null;
                date = txtSaleDate.Text;
                #region-----------AssignValue----------------------------
                Total = Convert.ToDecimal(txtTotal.Text);
                DiscountAmt = (Decimal)Convert.ToDecimal(txtDiscount.Text);
                FinalDiscountAmt = (Total * (DiscountAmt / 100));
                decimal TempDis = Math.Round(FinalDiscountAmt, 2);
                decimal BalanceAmount =Convert.ToDecimal(txtBalanceAmount.Text);
                #endregion
                string Comment = txtComment.Text;
                SaleTransctionNo=txtSaleTransactionNo.Text;
                 //SetSaveParameters();
                // SetProductDetail();

                if (ViewState["SPID"] != null)
                {
                    DataSet dsGetDataForSaveSaleTranDetail = objSaleTransaction.GetDataForSaleTransDetail(Convert.ToInt32(ViewState["SPID"]));
                    int count = dsGetDataForSaveSaleTranDetail.Tables[0].Rows.Count;
                    for (int i = 0; i <= dsGetDataForSaveSaleTranDetail.Tables[0].Rows.Count - 1; i++)
                    {

                        ProductID = Convert.ToInt32(dsGetDataForSaveSaleTranDetail.Tables[0].Rows[i]["ProductID"]);
                        Quantity = Convert.ToDecimal(dsGetDataForSaveSaleTranDetail.Tables[0].Rows[i]["Quantity"]);
                        //SalePrice = Convert.ToDecimal(dsGetDataForSaveSaleTranDetail.Tables[0].Rows[i]["SalePrice"]);
                        result = objSaleTransaction.SaveSaleTransactionDetails(Convert.ToInt32(ViewState["SPID"]), FinalDiscountAmt, BalanceAmount,Comment);
                        int addMedicalStockResult = objSaleTransaction.AddMedicalStock(date, Quantity, MedicalID, ProductID);
                        if ((result == "Sales Transaction Sucessfully....!!!") && (addMedicalStockResult == 2))
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = result;
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = result;
                        }


                    }

                }
            }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = ex.Message.ToString();
                }
            finally
            {
                ClearFields();
               // Response.AppendHeader("Refresh", "2;url=Admin/SaleTransaction.aspx");

            }

        }
        #region---------------------------------ClearFields-----------------------
        private void ClearFields()
        {
           
            ddlWarehouse.SelectedValue = "-1";
            ddlMedical.SelectedValue = "-1";
            ddlWarehouse.Enabled = true;
            ddlMedical.Enabled = true;
            txtCurrentStock.Text = "";
            txtSalePrice.Text = "";
            txtQuantity.Text = "";
            ViewState["PPID"] = null;
            txtComment.Text = "";
            txtTotal.Text = "";
            txtDiscount.Text = "";
            txtFinalTotal.Text = "";
            txtAmountPaid.Text = "";
            txtBalanceAmount.Text = "";
        
            AddClear();
           grvSaleProduct.DataSource = null;
           grvSaleProduct.DataBind();
        }
        #endregion

        #endregion

    }
}