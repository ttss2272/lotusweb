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
    public partial class ViewMedicalShop : System.Web.UI.Page
    {
        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  Declare Variales
        */
        #region-------------------------------Declare Variables-------------------------
        int MedicalShopID;

        BLMedicalShop objMedicalShop = new BLMedicalShop();
        #endregion

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  Page_Load
        */
        #region-----------------------------Page_Load---------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindShopType();
                    BindMedicalShop1();
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

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  BindMedicalShop() NOt used In this Form
        */
        #region-------------------------------BindMedicalShop()-----------------------
        private void BindMedicalShop1()
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShop(0);

            if (dsMedicalShop.Tables.Count != 0)
            {
                if (dsMedicalShop.Tables[0].Rows.Count != 0)
                {
                    ddlMedicalShop.DataTextField = "ShopName";
                    ddlMedicalShop.DataValueField = "MedicalShopID";
                    ddlMedicalShop.DataSource = dsMedicalShop;
                    ddlMedicalShop.DataBind();
                }
                else
                {
                    ddlMedicalShop.DataSource = null;
                    ddlMedicalShop.DataBind();
                }
                ddlMedicalShop.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  Bind GridView
        */
        #region-------------------------------BindGridView()--------------------------------
        private void BindGridView()
        {
            DataSet dsMedicalShop = objMedicalShop.GetMedicalShopOnShopType(Convert.ToInt32(ddlMedicalShop.SelectedValue), Convert.ToInt32(ddlShopType.SelectedValue));

            if (dsMedicalShop.Tables.Count != 0)
            {
                if (dsMedicalShop.Tables[0].Rows.Count != 0)
                {
                    grvMedicalShop.DataSource = dsMedicalShop;
                    grvMedicalShop.DataBind();
                }
                else
                {
                    grvMedicalShop.DataSource = null;
                    grvMedicalShop.DataBind();
                    
                }
            }
        }
        #endregion

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  Bind SHopType()
        */
        #region----------------------------------BindShopType()-------------------------------
        private void BindShopType()
        {
            DataSet dsShopType = objMedicalShop.GetShopType();
            ddlShopType.Items.Clear();
            if (dsShopType.Tables.Count > 0)
            {
                if (dsShopType.Tables[0].Rows.Count > 0)
                {
                    ddlShopType.DataTextField = "ShopTypeName";
                    ddlShopType.DataValueField = "ShopTypeID";
                    ddlShopType.DataSource = dsShopType;
                    ddlShopType.DataBind();
                }
                ddlShopType.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  ShopType_SelectedIndexChanged
        */
        #region-------------------------ddlShopType_SelectedIndexchanged------------------------------
        protected void ddlShopType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindMedicalShop();
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
        * Purpose :-  Bind Medical Shop on Shoptype for dropdown
        */
        #region---------------------------Bind Medical shop on Shoptype--------------------------------
        private void BindMedicalShop()
        {
            DataSet dsMedicalShop = objMedicalShop.BindMedicalShopOnShopType(Convert.ToInt32(ddlShopType.SelectedValue));
            ddlMedicalShop.Items.Clear();
            if (dsMedicalShop.Tables.Count != 0)
            {
                if (dsMedicalShop.Tables[0].Rows.Count != 0)
                {
                    ddlMedicalShop.DataTextField = "ShopName";
                    ddlMedicalShop.DataValueField = "MedicalShopID";
                    ddlMedicalShop.DataSource = dsMedicalShop;
                    ddlMedicalShop.DataBind();
                }
                else
                {
                    ddlMedicalShop.DataSource = null;
                    ddlMedicalShop.DataBind();
                }
                ddlMedicalShop.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 24 Sept 2015
        * Purpose :-  PageIndexChangeing
        */
        #region--------------------------------grvMedicalShop_PageIndexChangeing--------------------------

        protected void grvMedicalShop_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvMedicalShop.PageIndex = e.NewPageIndex;
                BindGridView();
                grvMedicalShop.Focus();
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
        * Purpose :-  btnSearch_Click
        */
        #region---------------------------btnSearch_Click---------------------------------------
        protected void btnSearch_Click(object sender, EventArgs e)
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
        * Purpose :-  BtnClose_Click
        */
        #region--------------------------------btnClose_Click-----------------------------------
        protected void btnClose_Click(object sender, EventArgs e)
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
    }
}