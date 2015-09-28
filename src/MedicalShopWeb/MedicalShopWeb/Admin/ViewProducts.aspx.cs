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
    public partial class ViewProducts : System.Web.UI.Page
    {

        #region-------------------------------Declare Variables-------------------------
        int ProductID;
        BLProducts objProducts = new BLProducts();
       // BLProductType objProductType = new BLProductType();
        #endregion

        #region-----------------------------Page_Load---------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindProductType();
                    BindProducts();
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();

            }
        }
        #endregion

        #region-------------------------------BindProducts()-----------------------
        private void BindProducts()
        {
            DataSet dsProduct = objProducts.BindProduct(0);

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
                ddlProduct.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion


        #region-------------------------------BindGridView()--------------------------------
        private void BindGridView()
        {
            DataSet dsProduct = objProducts.GetProductOnProductType(Convert.ToInt32(ddlProduct.SelectedValue), Convert.ToInt32(ddlProductType.SelectedValue));

            if (dsProduct.Tables.Count != 0)
            {
                if (dsProduct.Tables[0].Rows.Count != 0)
                {
                    grvProducts.DataSource = dsProduct;
                    grvProducts.DataBind();
                }
                else
                {
                    grvProducts.DataSource = null;
                    grvProducts.DataBind();

                }
            }
        }
        #endregion

        #region----------------------------------BindProductType()-------------------------------
        private void BindProductType()
        {
           DataSet dsProductType = objProducts.GetProductType();
            ddlProductType.Items.Clear();
            if (dsProductType.Tables.Count > 0)
            {
                if (dsProductType.Tables[0].Rows.Count > 0)
                {
                    ddlProductType.DataTextField = "ProductTypeName";
                    ddlProductType.DataValueField = "ProductTypeID";
                    ddlProductType.DataSource = dsProductType;
                    ddlProductType.DataBind();
                }
                ddlProductType.Items.Insert(0, new ListItem("Select All", "0"));
            }
            }
        #endregion

         #region---------------------------Bind Product on Producttype--------------------------------
        private void BindProduct()
        {
            DataSet dsProduct = objProducts.BindProductOnProductType(Convert.ToInt32(ddlProductType.SelectedValue));
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
                ddlProduct.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

        }
    }
