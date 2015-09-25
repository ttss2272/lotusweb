using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;
using AjaxControlToolkit;

namespace MedicalShopWeb.Admin
{
    public partial class City : System.Web.UI.Page
    {
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Declare Variables
         */
        #region--------------------------Delcare variables-------------------
        int CityID, StateID, CountryID, UpdatedByUserID, IsActive;
            string CityName;
            BLCountry objCountry = new BLCountry();
            BLState objState = new BLState();
            BLCity objCity = new BLCity();
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Page_Load
         */
            #region---------------------------------------------Page_Load----------------------
            protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindCountry();
                    BindGridView();
 
                }
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message.ToString();
            }


        }
            #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- btnSave_Click
         */
            #region----------------------------------btnSave_Click-----------------------
            protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveCity();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=City.aspx");
            }
        }
            #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- SetParameters
         */
        #region----------------------------Setparameters()-----------------------
            private void SetParameters()
            {
                CountryID = Convert.ToInt32(ddlCountry.SelectedValue);
                StateID = Convert.ToInt32(ddlState.SelectedValue);
                CityID = 0;
                CityName = txtCityName.Text;
                UpdatedByUserID = 1;
                IsActive = 1;
            }
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- SaveCity()
         */
        #region----------------------------------SaveCity()-------------------------
            private void SaveCity()
            {
                string Result = objCity.SaveCity(CityID, CityName, StateID, UpdatedByUserID, IsActive);
                lblMessage.Text = Result;

            }
        
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- ClearFields
         */
        #region------------------------------------ClearFields----------------------------------
            private void ClearFields()
            {
                ddlCountry.SelectedValue = "-1";
                ddlState.SelectedValue = "-1";
                txtCityName.Text = "";
            }
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :-  BindCountry
         */
        #region---------------------------------BindCountry----------------------------------
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
                }
            }
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- BindState
         */
        #region---------------------------------BindState--------------------------------------
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
                }
            }
        #endregion


            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- BindGridView()
         */
                     

        #region------------------------------------BindgridView-------------------------------
            private void BindGridView()
            {
                DataSet dsCity = objCity.GetCity(0, 1);

                if (dsCity.Tables[0].Rows.Count != 0)
                {
                    grvCity.DataSource = dsCity;
                    grvCity.DataBind();

                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "State Not Available";

                    grvCity.DataSource = null;
                    grvCity.DataBind();
                }
 
            }
        #endregion

            /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Page Index Changing
         */
            #region------------------------------grvCountry_PageIndexChanging------------------------
            protected void grvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                try
                {
                    grvCity.PageIndex = e.NewPageIndex;
                    BindGridView();
                    grvCity.Focus();
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
         * Purpose :- ddlcountry_SelectedIndexchanged
         */
            #region--------------------------ddlCountry_SelectedIndexChanged------------------
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
    }
}