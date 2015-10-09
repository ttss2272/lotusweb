using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLayer;
namespace MedicalShopWeb
{
    public partial class Supplier : System.Web.UI.Page
    {
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        BLCity objCity = new BLCity();
        BLSupplier objSupplier = new BLSupplier();

        /*
         * Updated By :- PriTesh D. Sortee
         * Purpose :- Add Opening Balance
         * Date :- 09 OCT 2015
         */
        #region--------------SetVariables-------------
        string CompanyName, SupplierName, ContactNo, Area, Address, ModeOfTransport,PriceType;
        int SupID, IsActive, CityID, UpdatedByUserID;
        decimal OpeningBalance; 
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ClearFields();

                    if (Request.QueryString["SupplierID"] != null)
                    {
                        setValues(Convert.ToInt32(Request.QueryString["SupplierID"]));
 
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
                
            }

        }

        #region---------------BindCountry----------
        private void BindCountry()
        {
            DataSet dsCountry = objCountry.GetCountry(0, 1);
            ddlCountry.Items.Clear();
            if (dsCountry.Tables.Count > 0)
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

        #region------------------BindState-----------------------
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
        #region--------------BindCity-----------------
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
                
                ddlCity.Items.Insert(0,new ListItem("Select City","-1"));

            }
        }
        #endregion
        /*
         * Updated By :- PriTesh D. Sortee
         * Purpose :- Add Opening Balance
         * Date :- 09 OCT 2015
         */
        #region----------------SaveSupplier------------------------
        private void SaveSuppliers()
        {
            string Result = objSupplier.SaveSupplier(SupID, SupplierName, CompanyName, ContactNo, CityID, Area, Address, ModeOfTransport, PriceType, IsActive, UpdatedByUserID,OpeningBalance);
            if ((Result == "Supplier Details Saved Successfully...!!!") || (Result == "Supplier Details Updated  Successfully...!!!"))
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
         * Updated By :- PriTesh D. Sortee
         * Purpose :- Add Opening Balance
         * Date :- 09 OCT 2015
         */
        #region------------------SetParameters-----------------
        private void SetParameters()
        {
           
            SupID = Convert.ToInt32( hdnSupplierID.Value);
            CompanyName = txtcompanyName.Text;
            SupplierName = txtSupplierName.Text;
            ContactNo = txtContactNo.Text;
            CityID = Convert.ToInt32(ddlCity.SelectedValue.ToString());
            Area = txtArea.Text;
            Address = txtAddress.Text;
            ModeOfTransport = ddModeOfTransport.SelectedValue.ToString();
            OpeningBalance = Convert.ToDecimal(txtOpeningBalance.Text);
            IsActive = 1;
            UpdatedByUserID = 1;
            if (rbtnCIF.Checked == true)
            {
                PriceType = "CIF";
            }
            else
            {
                PriceType = "FOB";
            }
        }   
        #endregion

        /*
         * Updated By :- PriTesh D. Sortee
         * Purpose :- Add Some more Fields
         * Date :- 09 OCT 2015
         */
        #region-----------ClearFields-----
        private void ClearFields()
        {
            BindCountry();
            txtcompanyName.Text = "";
            txtSupplierName.Text = "";
            txtContactNo.Text = "";
            txtArea.Text = "";
            
            txtAddress.Text = "";
            hdnSupplierID.Value = "0";
            hdnIsDelete.Value = "0";
            txtOpeningBalance.Text = "";
            txtOpeningBalance.ReadOnly = false;
        }
        #endregion

        #region----------------SaveClickCode------------------------------
        protected void btnSave_Click1(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveSuppliers();
            }
            catch (Exception ex)
            {

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=Supplier.aspx");
            }
        }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 28 Sept 2015
         * Purpose :- When Edit set values on form 
         */
        #region------------------------------SetValues()---------------------------------------
        private void setValues(int SupplierID)
        {
            DataSet dsSupplierValues = objSupplier.GetSupplierDetail(SupplierID);
            if (dsSupplierValues.Tables.Count != 0)
            {
                if (dsSupplierValues.Tables[0].Rows.Count != 0)
                {
                    hdnSupplierID.Value = dsSupplierValues.Tables[0].Rows[0]["SupplierID"].ToString();
                    hdnIsDelete.Value = Request.QueryString["iss"].ToString();
                    lblPageHeading.Text = "Edit " + dsSupplierValues.Tables[0].Rows[0]["CompanyName"].ToString();
                    txtcompanyName.Text = dsSupplierValues.Tables[0].Rows[0]["CompanyName"].ToString();
                    txtSupplierName.Text = dsSupplierValues.Tables[0].Rows[0]["ContactPerson"].ToString();
                    txtContactNo.Text = dsSupplierValues.Tables[0].Rows[0]["ContactNo"].ToString();
                    ddlCountry.SelectedValue = dsSupplierValues.Tables[0].Rows[0]["CountryID"].ToString();
                    BindState();
                    ddlState.SelectedValue = dsSupplierValues.Tables[0].Rows[0]["StateID"].ToString();
                    BindCity();
                    ddlCity.SelectedValue = dsSupplierValues.Tables[0].Rows[0]["CityID"].ToString();
                    txtArea.Text = dsSupplierValues.Tables[0].Rows[0]["Area"].ToString();
                    txtAddress.Text = dsSupplierValues.Tables[0].Rows[0]["Address"].ToString();
                    ddModeOfTransport.SelectedValue = dsSupplierValues.Tables[0].Rows[0]["ModeOfTransport"].ToString();
                    txtOpeningBalance.Text = dsSupplierValues.Tables[0].Rows[0]["OpeningBalance"].ToString();
                    txtOpeningBalance.ReadOnly = true;
                    if (dsSupplierValues.Tables[0].Rows[0]["PriceType"].ToString() == "FOB")
                    {
                        rbtnFOB.Checked = true;
                    }
                    else
                    {
                        rbtnCIF.Checked = true;
                    }

                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Information Not Available";

                }
            }
        }
        #endregion
        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 28 Sept 2015
         * Purpose :- Click on Clear Button
         */
        #region----------------------------------lnkbtnClear_Click---------------------------------
        protected void lnkbtnClear_Click(object sender, EventArgs e)
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

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 28 Sept 2015
         * Purpose :- Click on Close Button
         */
        #region------------------------------------------lnkbtnClose_Click---------------------------
        protected void lnkbtnClose_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../Default.aspx", false);
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