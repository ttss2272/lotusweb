using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MedicalShopWeb.Admin;
using System.Data;
using BusinessLayer;
namespace MedicalShopWeb
{
   
    public partial class Products : System.Web.UI.Page
    {
        BLProductType objProductType = new BLProductType();
        BLProducts objProducts = new BLProducts();
        #region-----------------------SetVaribles---------------
        int ProductID, IsActive, UpdatedByUserID, ProductTypeID;
        string ProductName, code, batch, PurchasePrice, SalePrice;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProductType();
                    if (Request.QueryString["ProductID"] != null)
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
        #region--------------BindProductType----------------------
        private void BindProductType()
        {
            DataSet dsProductType = objProductType.GetProductType(0, 1);

            if (dsProductType.Tables.Count > 0)
            {
                if (dsProductType.Tables[0].Rows.Count > 0)
                {
                    ddproductType.DataTextField = "Product Type";
                    ddproductType.DataValueField = "ProductTypeID";
                    ddproductType.DataSource = dsProductType;
                    ddproductType.DataBind();
                }
                else
                {

                    ddproductType.DataSource = null;
                    ddproductType.DataBind();

                }
                ddproductType.Items.Insert(0, new ListItem("Select ProductType", "-1"));
            }
        }
        #endregion
        #region------------------SaveClickCode------------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveProducts();
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=Products.aspx");
            }
        }
        #endregion
        #region----------------SaveProducts------------------
        private void SaveProducts()
        {
            string Result = objProducts.SaveProducts(ProductID,ProductTypeID, ProductName, batch, code, PurchasePrice, SalePrice, IsActive, UpdatedByUserID);
            if (Result == "Product Details Saved Successfully...!!!")
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
        #region--------------SetParameter------------
        private void SetParameters()
        {
            if (Request.QueryString["ProductID"] != null)
            {
                ProductID = Convert.ToInt32(Request.QueryString["ProductID"]);
            }
            else
            {
                ProductID = 0;
            }
            ProductTypeID = Convert.ToInt32(ddproductType.SelectedValue.ToString());
            ProductName = txtProductName.Text;
            code = txtCode.Text;
            //batch = txtbatch.Text;
            PurchasePrice = txtPurchasePrice.Text;
            SalePrice = txtSalePrice.Text;
            IsActive = 1;
            UpdatedByUserID = 1;
        }
        #endregion
        #region-------------ClearFields------------------
        private void ClearFields()
        {
            txtProductName.Text = "";
            txtCode.Text = "";
            //txtbatch.Text = "";
            txtPurchasePrice.Text = "";
            txtSalePrice.Text="";
        }
        #endregion

        #region------------------------------SetValues()---------------------------------------
        private void setValues()
        {
            DataSet dsProductValues = objProducts.GetProductDetail(Convert.ToInt32(Request.QueryString["ProductID"]),0);
            if (dsProductValues.Tables.Count != 0)
            {
                if (dsProductValues.Tables[0].Rows.Count != 0)
                {
                    lblPageHeading.Text = "Edit :-" + dsProductValues.Tables[0].Rows[0]["ProductName"].ToString();
                    ddproductType.SelectedValue = dsProductValues.Tables[0].Rows[0]["ProductTypeID"].ToString();
                    txtProductName.Text = dsProductValues.Tables[0].Rows[0]["ProductName"].ToString();
                    txtCode.Text = dsProductValues.Tables[0].Rows[0]["ProductCode"].ToString();
                    txtPurchasePrice.Text = dsProductValues.Tables[0].Rows[0]["PurchasePrice"].ToString();
                    txtSalePrice.Text = dsProductValues.Tables[0].Rows[0]["SallingPrice"].ToString();                                                                         
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Information Not Available";

                }
            }
        }
        #endregion
    }
}