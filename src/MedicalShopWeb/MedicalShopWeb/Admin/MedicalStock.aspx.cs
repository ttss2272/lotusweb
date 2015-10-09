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
    public partial class MedicalStock : System.Web.UI.Page
    {
        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :- Declare Vriables
         */
        #region----------------------DeclareVariables-------------------------
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLMedicalStock objMedicalStock = new BLMedicalStock();
        int MedicalStockID, MedicalShopID, ProductID, UpdatedByUserID;
        string DateOfStock;
        decimal CurrentStock;
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region------------------------------Page_Load--------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ClearFields();
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
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region-----------------------Medical_SelectedIndexChanged----------------------------
        protected void ddlMedical_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindMedicalProducts();
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
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region------------------------------Product_SelectedIndexChanged-------------------
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetMedicalProduct();
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
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region----------------------------------btnSave_Click--------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveMedicalStock();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=MedicalStock.aspx");
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region-----------------------------btnClear_Click----------------------------------
        protected void btnClear_Click(object sender, EventArgs e)
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
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */
        
        #region-------------------------------btnClose_Click---------------------------
        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFields();
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
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region---------------------------SaveMedicalStock()-------------------
        private void SaveMedicalStock()
        {
            string Result = objMedicalStock.SaveMedicalStock(MedicalShopID, DateOfStock, CurrentStock, MedicalShopID, ProductID, UpdatedByUserID);
            if (Result == "Medical Stock Inserted SucessFully...!!!" || Result == "Medical Stock Update SucessFully...!!!")
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
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region-----------------------------------BindMedicalShop()---------------------
        private void BindMedicalShop()
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShop(0);
            ddlMedical.Items.Clear();
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
                ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :- bind medical purchased product only
         */

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

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region--------------------------------GetMedicalProduct()------------------------
        private void GetMedicalProduct()
        {
            DataSet dsMedicalProduct = objMedicalStock.GetMedicalProduct(Convert.ToInt32(ddlMedical.SelectedValue), Convert.ToInt32(ddlProduct.SelectedValue));

            if (dsMedicalProduct.Tables.Count != 0)
            {
                if (dsMedicalProduct.Tables[0].Rows.Count != 0)
                {
                    txtPrevStock.Text = dsMedicalProduct.Tables[0].Rows[0]["Stock"].ToString();
                    txtLastDate.Text = dsMedicalProduct.Tables[0].Rows[0]["Stock"].ToString();
                }
                else
                { 

                }
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :- BindGridVIew()
         */

        #region---------------------------BindGridView()------------------------------
        private void BindGridView()
        {
            DataSet dsMedicalProductDetail = objMedicalStock.BindMedicalProductStock(Convert.ToInt32(ddlMedical.SelectedValue));

            if (dsMedicalProductDetail.Tables.Count != 0)
            {
                if (dsMedicalProductDetail.Tables[0].Rows.Count != 0)
                {
                    grvMedicalStock.DataSource = dsMedicalProductDetail;
                    grvMedicalStock.DataBind();
                }
                else
                {
                    grvMedicalStock.DataSource = null;
                    grvMedicalStock.DataBind(); 
                }
            }
            
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-
         */

        #region------------------------------SetParameters()------------------------------------
        private void SetParameters()
        {
            MedicalShopID = Convert.ToInt32(ddlMedical.SelectedValue);
            ProductID = Convert.ToInt32(ddlProduct.SelectedValue);
            DateOfStock = txtDate.Text;
            CurrentStock = Convert.ToDecimal( txtCurrentStock.Text);
            UpdatedByUserID = 1;
            MedicalStockID = 0;
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :- Clear All fields
         */

        #region------------------------------ClearFields()------------------------------------
        private void ClearFields()
        {
            BindMedicalShop();
            txtCurrentStock.Text = "";
            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtLastDate.Text = "";
            txtPrevStock.Text = "";
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 25 Sept 2015
         * Purpose   :-  Grid view Page indexchanging
         */
        #region------------------------------grvCountry_PageIndexChanging------------------------
        protected void grvMedicalStock_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvMedicalStock.PageIndex = e.NewPageIndex;
                BindGridView();
                grvMedicalStock.Focus();
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