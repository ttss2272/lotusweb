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
    public partial class State : System.Web.UI.Page
    {
        /*
        * Created By :- PriTesh D. Sortee
        * Created Date:- 22 Sept 2015
        * Purpose :- Variable declaration
        */
        #region-------------------------Declare variables globally-------------------------------
        int StateID, CountryID,UpdatedByUserID,IsActive;
        string StateName;
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        #endregion
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Page Load
         */
        #region-------------------------------Page_Load--------------------------
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
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Save Button Click
         */
        #region------------------------------btnSave_Click------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveState();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=State.aspx");
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Set Parameters
         */
        #region---------------------------SetParametrs()----------------------------------
        private void SetParameters()
        {
            CountryID = Convert.ToInt32(ddlCountry.SelectedValue.ToString());
            StateID = 0;
            StateName = txtStateName.Text;
            IsActive = 1;
            UpdatedByUserID = 1;
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Clear All Fields
         */

        #region------------------------------ClearFields()----------------------------------
        private void ClearFields()
        {
            ddlCountry.SelectedValue = "-1";
            txtStateName.Text = "";
        }

        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Bind Drop down Country
         */

        #region--------------------------------BindCountry()----------------------------
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
            }
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Save State
         */

        #region---------------------------------SaveState()--------------------------
        private void SaveState()
        {
            string Result = null;
            Result=objState.SaveState(StateID,StateName,CountryID,UpdatedByUserID,IsActive);

            lblMessage.Text = Result.ToString();
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Bind Grid View
         */

        #region-----------------------------------BindGridView-------------------------------
        private void BindGridView()
        {
            DataSet dsState = objState.GetState(0, 1);

            if (dsState.Tables[0].Rows.Count != 0)
            {
                grvState.DataSource = dsState;
                grvState.DataBind();

            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "State Not Available";

                grvState.DataSource = null;
                grvState.DataBind();
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 22 Sept 2015
         * Purpose :- Page Index Changing
         */
        #region------------------------------grvCountry_PageIndexChanging------------------------
        protected void grvState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvState.PageIndex = e.NewPageIndex;
                BindGridView();
                grvState.Focus();
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