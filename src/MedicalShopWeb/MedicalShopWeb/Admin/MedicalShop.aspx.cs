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
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Declare Variables 
         */
        #region-----------------------------------variables---------------------------
        int MedicalShopID, UpdatedByUserID, IsActive, CityID, ShopTypeID,Edit=0,Delete=0;
        string ShopName, OwnerName, ContactNo, Area, Address;
        decimal OpeningBalance;
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        BLCity objCity = new BLCity();
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Page_Load
         */

        #region-------------------------------Page_Load------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindShopType();
                    BindCountry();
                    if (Request.QueryString["MedicalShopID"] != null)
                    {
                        if (Request.QueryString["iss"] == "1")
                        {
                            btnSave.Text = "Delete";
                            UnEditable();
                        }
                        AssignValues();
 
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
         * Created Date:- 22 Sept 2015
         * Purpose :-  Bind ShopType to Dropdown
         */
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  BtnSave_Click
         */

        #region---------------------------------------btnSave_Click------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveMedicalShop();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=MedicalShop.aspx");
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Bind Countr to Dropdown
         */
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


        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Bind State
         */

        #region---------------------------------BindState()--------------------------------------
        private void BindState()
        {
            DataSet dsState = objState.BindState(Convert.ToInt32(ddlCountry.SelectedValue));
            ddlState.Items.Clear();
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Bind City
         */

        #region--------------------------------------BindCity()-----------------------------
        private void BindCity()
        {
            DataSet dsCity = objCity.BindCity(Convert.ToInt32(ddlState.SelectedValue));
            ddlCity.Items.Clear();
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Country Selected Index Changed
         */
        #region------------------------ddlCountry_SelectedIndexChanged---------------------------
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindState();
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
         * Created Date:- 22 Sept 2015
         * Purpose :-  State Selected Index Changed
         */
        #region--------------------------ddlState_SelectedIndexChanged----------------------
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindCity();
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
         * Created Date:- 22 Sept 2015
         * Purpose :-  Clear All Fields
         */
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

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Save Medical Shop
         */
        #region----------------------------SaveMedicalShop()---------------------------
        private void SaveMedicalShop()
        {
            string Result = objMedicalShop.SaveMedicalShop(MedicalShopID, OwnerName, ContactNo, CityID, Area, ShopName, ShopTypeID, OpeningBalance, UpdatedByUserID, IsActive,Address);
            lblMessage.Text = Result;
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Set Parameters
         */
        #region-------------------------------SetParameters()------------------------------
        private void SetParameters()
        {
            if (Request.QueryString["MedicalShopID"] != null)
            { MedicalShopID = Convert.ToInt32(Request.QueryString["MedicalShopID"]); }
            else
            { MedicalShopID = 0; }
           
            OwnerName = txtOwnerName.Text;
            ContactNo = txtContactNo.Text;
            CityID = Convert.ToInt32(ddlCity.SelectedValue);
            Area = txtArea.Text;
            ShopName = txtShopName.Text;
            ShopTypeID = Convert.ToInt32(ddlShopType.SelectedValue);
            OpeningBalance = Convert.ToDecimal(txtOopenningBalance.Text);
            UpdatedByUserID = 1;
            IsActive = 1;
            Address = txtAddress.Text;
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Set Value to form Controls
         */

        #region-------------------------------AssignValues()--------------------------------
        private void AssignValues()
        {
            DataSet dsMedicalShop = objMedicalShop.GetMedicalShop(Convert.ToInt32(Request.QueryString["MedicalShopID"]));
            if (dsMedicalShop.Tables.Count != 0)
            {
                if (dsMedicalShop.Tables[0].Rows.Count != 0)
                {
                    lblPageHeading.Text = "Edit :-" + dsMedicalShop.Tables[0].Rows[0]["ShopName"].ToString();
                    txtShopName.Text = dsMedicalShop.Tables[0].Rows[0]["ShopName"].ToString();
                    ddlShopType.SelectedValue = dsMedicalShop.Tables[0].Rows[0]["ShopTypeID"].ToString();
                    txtOwnerName.Text = dsMedicalShop.Tables[0].Rows[0]["OwnerName"].ToString();
                    txtContactNo.Text = dsMedicalShop.Tables[0].Rows[0]["ContactNo"].ToString();
                    ddlCountry.SelectedValue = dsMedicalShop.Tables[0].Rows[0]["CountryID"].ToString();
                    BindState();
                    ddlState.SelectedValue = dsMedicalShop.Tables[0].Rows[0]["StateID"].ToString();
                    BindCity();
                    ddlCity.SelectedValue = dsMedicalShop.Tables[0].Rows[0]["CityID"].ToString();
                    txtArea.Text = dsMedicalShop.Tables[0].Rows[0]["Area"].ToString();
                    txtAddress.Text = dsMedicalShop.Tables[0].Rows[0]["Address"].ToString();
                    txtOopenningBalance.Text = dsMedicalShop.Tables[0].Rows[0]["OpeningBalance"].ToString();
                    txtOopenningBalance.ReadOnly = true;

                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Data Not Available";
                }
            }
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  clear button click
         */

        #region--------------------------------btnClear_Click--------------------------------

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
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  Close button click
         */
        #region--------------------------------btnClose_Click-------------------------------
        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region------------------------------uneditable()----------------------------------
        private void UnEditable()
        {
            txtShopName.ReadOnly = true;
            txtOwnerName.ReadOnly = true;
            txtAddress.ReadOnly = true;
            txtArea.ReadOnly = true;
            txtContactNo.ReadOnly = true;
            txtOopenningBalance.ReadOnly = true;
            ddlShopType.Enabled = false;
            ddlCity.Enabled = false;
            ddlCountry.Enabled = false;
            ddlState.Enabled = false;
        }
        #endregion

    }
}
