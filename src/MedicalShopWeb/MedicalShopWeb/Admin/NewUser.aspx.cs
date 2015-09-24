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
    public partial class NewUser : System.Web.UI.Page
    {
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  Declare variables
         */
        #region---------------------------Declare Variables-------------------------------
        int UserID, CityID, UserTypeID, WarehouseID,UpdatedByUserID,IsActive;
        string UserName, EmailID, ContactNo, Area, Address, LoginName, Password;
        BLCity objCity = new BLCity();
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        BLWarehouse objWarehouse = new BLWarehouse();
        BLNewUser objUser = new BLNewUser();
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  PageLoad
         */
        #region----------------------------------Page_Load-------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindUserType();
                    BindCountry();
                    BindWarehouse();
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  Country Selected IndexChanged
         */
        #region---------------------------------ddlCountry_Selected Index Changed-----------------------
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  State Selected Index Changed
         */
        #region--------------------------ddlState_SelectedIndexChanged--------------------------------
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  BtnSave_Click
         */
        #region----------------------------------btnSave_Click---------------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveUser();

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
         * Created Date:- 23 Sept 2015
         * Purpose :-  LoginName
         */
        #region--------------------txtLoginName_TextChanged---------------------------------
        protected void txtLoginName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string Result = objUser.CheckLoginName(txtLoginName.Text);
                if (Result == "User Login Name is Available")
                {
                    lblAvailable.ForeColor = System.Drawing.Color.Green;
                    lblAvailable.Text = Result;
                    SetFocus(txtPassword);
                    
                }
                else
                {
                    lblAvailable.ForeColor = System.Drawing.Color.Red;
                    lblAvailable.Text = Result;
                    txtLoginName.Text = "";
                    SetFocus(txtLoginName);

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
         * Created Date:- 23 Sept 2015
         * Purpose :-  SetParametrs()
         */
        #region------------------------------SetParameters()-------------------------------
        private void SetParameters()
        {
            UserID = 0;
            UserName = txtUserName.Text;
            UserTypeID = Convert.ToInt32(ddlUserType.SelectedValue);
            EmailID = txtEmail.Text;
            ContactNo = txtContactNo.Text;
            CityID = Convert.ToInt32(ddlCity.SelectedValue);
            Area = txtArea.Text;
            Address = txtAddress.Text;
            WarehouseID = Convert.ToInt32(ddlWarehouse.SelectedValue);
            LoginName = txtLoginName.Text;
            Password = txtPassword.Text;
            UpdatedByUserID = 1;
            IsActive = 1;
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindCountry()
         */
        #region------------------------------BindCountry()-------------------------------
        private void BindCountry()
        {
            DataSet dsCountry = objCountry.GetCountry(0, 1);
            if (dsCountry.Tables.Count != 0)
            {
                if (dsCountry.Tables[0].Rows.Count != 0)
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindState()
         */
        #region-------------------------------BindState()------------------------------------
        private void BindState()
        {
            DataSet dsState = objState.BindState(Convert.ToInt32(ddlCountry.SelectedValue));
            ddlState.Items.Clear();
            if (dsState.Tables.Count != 0)
            {
                if (dsState.Tables[0].Rows.Count != 0)
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindCity()
         */
        #region--------------------------------BindCity()-------------------------------------
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindWarehouse()
         */
        #region-------------------------------Bindwarehouse()----------------------------------
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  BindUserType()
         */
        #region---------------------------------BindUserType()---------------------------------
        private void BindUserType()
        {
            DataSet dsUserType = objUser.BindUserType();

            if (dsUserType.Tables.Count != 0)
            {
                if (dsUserType.Tables[0].Rows.Count != 0)
                {
                    ddlUserType.DataTextField = "UserTypeName";
                    ddlUserType.DataValueField = "UserTypeID";
                    ddlUserType.DataSource = dsUserType;
                    ddlUserType.DataBind();
                }
                else
                {
                    ddlUserType.DataSource = null;
                    ddlUserType.DataBind();
                }
                ddlUserType.Items.Insert(0, new ListItem("Select User Type", "-1"));
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 23 Sept 2015
         * Purpose :-  SaveUser()
         */
        #region-----------------------------------SaveUser()------------------------------------
        private void SaveUser()
        {
            string Result = objUser.SaveUser(UserID, UserName, UserTypeID, EmailID, ContactNo, CityID, Area, Address, WarehouseID, LoginName, Password, UpdatedByUserID, IsActive);
            if (Result == "User Created Sucessfully...!!!" || Result == "User Update Sucessfully...!!!")
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
         * Created Date:- 23 Sept 2015
         * Purpose :-  Clear Fields()
         */
        #region-----------------------------------ClearFields()----------------------------------
        private void ClearFields()
        {
            txtUserName.Text = "";
            ddlUserType.SelectedValue = "-1";
            txtEmail.Text = "";
            txtContactNo.Text = "";
            ddlCountry.SelectedValue = "-1";
            ddlState.SelectedValue = "-1";
            ddlCity.SelectedValue = "-1";
            txtArea.Text = "";
            txtAddress.Text = "";
            ddlWarehouse.SelectedValue = "-1";
            txtLoginName.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        #endregion
    }
}