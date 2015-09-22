using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;

namespace MedicalShopWeb.Admin
{
    public partial class MedicalShop : System.Web.UI.Page
    {
        #region-----------------------------------variables---------------------------
        int ShopTypeID,UpdatedByUserID,IsActive,cityID;
        string ShopName, OwnerName, ContactNo, Area, Address;
        double OpeningBalance;
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        BLCity objCity = new BLCity();
        #endregion


        #region-------------------------------Page_Load------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindShopType();
                    BindCountry();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region--------------------------------BindShopType()---------------------------
        private void BindShopType()
        {
            DataSet dsShopType = objMedicalShop.GetShopType();

            if (dsShopType.Tables.Count > 0)
            {
                if (dsShopType.Tables[0].Rows.Count > 0)
                {
                    ddlShopType.DataTextField = "ShopTypeName";
                    ddlShopType.DataValueField = "ShopTypeID";
                    ddlShopType.DataSource = dsShopType;
                    ddlShopType.DataBind();
                }
                ddlShopType.Items.Insert(0, new ListItem("Select ShopType", "-1"));
            }
        }
        #endregion

        #region---------------------------------------btnSave_Click------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region------------------------------------BindCountry()--------------------------------
        private void BindCountry()
        {
            DataSet dsCountry = objCountry.GetCountry(0, 1);

                if (dsCountry.Tables.Count >0)
                {
                    if (dsCountry.Tables[0].Rows.Count > 0)
                    {
                        ddlCountry.DataTextField = "Country Name";
                        ddlCountry.DataValueField = "CountryID";
                        ddlCountry.DataSource = dsCountry;
                        ddlCountry.DataBind();
                    }
                    else
                    {
                        ddlCountry.DataSource = null;
                        ddlCountry.DataBind();

                    }
                    ddlCountry.Items.Insert(0, new ListItem("Select Country", "-1"));
                    ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                    ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
        }

        }
        #endregion


        #region---------------------------------BindState()--------------------------------------
        private void BindState()
        {
            DataSet dsState = objState.BindState(Convert.ToInt32(ddlCountry.SelectedValue));

            if (dsState.Tables.Count >0)
            {
                if (dsState.Tables[0].Rows.Count >0)
                {
                    ddlState.DataTextField = "State Name";
                    ddlState.DataValueField = "StateID";
                    ddlState.DataSource = dsState;
                    ddlState.DataBind();
                }
                else
                {
                    ddlState.DataSource = null;
                    ddlState.DataBind();

                }
                ddlState.Items.Insert(0, new ListItem("Select State", "-1"));
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
        }
        #endregion

        #region--------------------------------------BindCity()-----------------------------
        private void BindCity()
        {
            DataSet dsCity = objCity.BindCity(Convert.ToInt32(ddlState.SelectedValue));

            if (dsCity.Tables.Count != 0)
            {
                if (dsCity.Tables[0].Rows.Count != 0)
                {
                    ddlCity.DataTextField = "City Name";
                    ddlCity.DataValueField = "CityID";
                    ddlCity.DataSource = dsCity;
                    ddlCity.DataBind();
                }
                else
                {
                    ddlCity.DataSource = null;
                    ddlCity.DataBind();

                }
                ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
            }
 
        }
        #endregion

        #region------------------------ddlCountry_SelectedIndexChanged---------------------------
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindState();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region--------------------------ddlState_SelectedIndexChanged----------------------
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindCity();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region-----------------------------------ClearFields()-------------------------------
        private void ClearFields()
        {
            txtShopName.Text = "";
            txtOwnerName.Text = "";
            txtOopenningBalance.Text = "";
            txtContactNo.Text = "";
            txtArea.Text = "";
            txtAddress.Text = "";
            ddlShopType.SelectedValue = "-1";
            ddlCountry.SelectedValue = "-1";
            ddlState.SelectedValue = "-1";
            ddlCity.SelectedValue = "-1";
        }
        #endregion

        #region----------------------------SaveMedicalShop()---------------------------
        private void SaveMedicalShop()
        {
 
        }
        #endregion


    }
}
