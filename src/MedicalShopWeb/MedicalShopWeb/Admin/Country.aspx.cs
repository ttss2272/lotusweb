using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BusinessLayer;

namespace MedicalShopWeb.Admin
{
    public partial class Country : System.Web.UI.Page
    {
        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Declare Varivable
         */
        #region---------------------------Variables------------------------
        int CountryID,UpdatedByUserID;
        int IsActive;
        string CountryName;
        BLCountry objCountry = new BLCountry();
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Page load event
         */
        #region-----------------------------PageLoad--------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
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
         * Created Date:- 16 Sept 2015
         * Purpose :- Save 
         */
        #region--------------------------btnSave_Click----------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveCountry();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
                //Response.Write("<script type=\"text/javascript\">alert("+ex.Message.ToString()+");</script>");
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=Country.aspx");
            }
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Set parameters
         */
        #region----------------------------SetParameters----------------------------
        private void SetParameters()
        {
            CountryID = 0;
            CountryName = txtCountryName.Text;
            UpdatedByUserID = 1;
            IsActive = 1;
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Clear fields
         */
        #region-------------------------------Clear Field----------------------
        private void ClearFields()
        {
            txtCountryName.Text = "";
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Save country Code
         */
        #region---------------------------SaveCountry()--------------------------
        private void SaveCountry()
        {
            string Result = objCountry.SaveCountry(CountryID, CountryName, UpdatedByUserID, IsActive);
            if (Result == "Country Saved Successfully...!!!")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = Result;
            }

            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = Result;
            }
                        
            BindGridView();
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Bind Gridview function
         */
        #region---------------------BindGridView---------------------------------
        private void BindGridView()
        {
            DataSet dsCountry = objCountry.GetCountry(0, 1);

            if (dsCountry.Tables[0].Rows.Count != 0)
            {
                grvCountry.DataSource = dsCountry;
                grvCountry.DataBind();

            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Country Not Available";

                grvCountry.DataSource = null;
                grvCountry.DataBind();
            }
 
        }
        #endregion

        /*
         * Created By :- PriTesh D. Sortee
         * Created Date:- 16 Sept 2015
         * Purpose :- Page Index Changing
         */
        #region------------------------------grvCountry_PageIndexChanging------------------------
        protected void grvCountry_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvCountry.PageIndex = e.NewPageIndex;
                BindGridView();
                grvCountry.Focus();
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