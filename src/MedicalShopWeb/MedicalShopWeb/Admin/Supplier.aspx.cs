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
        #region--------------SetVariables-------------
        string CompanyName, SupplierName, ContactNo, Area, Address, ModeOfTransport,CIF,FOB;
        int SupID, IsActive, CityID, UpdatedByUserID;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindCountry();
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
            DataSet dsCity = objCity.BindCity(Convert.ToInt32(ddlCity.SelectedValue));
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
                ddlCity.Items.Insert(0,new ListItem("Select State","-1"));
                ddlCity.Items.Insert(0,new ListItem("Select City","-1"));

            }
        }
        #endregion

        protected void btnSave_Click(object sender, EventArgs e)
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

        private void SaveSuppliers()
        {
            //string Result = obj_Doctor.SaveDoctor(SupID,SupplierName,CompanyName,ContactNo,CityID,Area,Address,ModeOfTransport,CIF,FOB, IsActive, UpdatedByUserID);
            //if (Result == "Doctor Details Saved Successfully...!!!")
            //{
            //    lblMessage.ForeColor = System.Drawing.Color.Green;
            //    lblMessage.Text = Result;
            //}

            //else
            //{
            //    lblMessage.ForeColor = System.Drawing.Color.Red;
            //    lblMessage.Text = Result;
            //}
        }
        #region------------------SetParameters-----------------
        private void SetParameters()
        {
            CompanyName = txtcompanyName.Text;
            SupplierName = txtSupplierName.Text;
            ContactNo = txtContactNo.Text;
            CityID = Convert.ToInt32(ddlCity.SelectedValue.ToString());
            Area = txtArea.Text;
            Address = txtAddress.Text;
            ModeOfTransport = ddModeOfTransport.SelectedValue.ToString();
            if (rbtnCIF.Checked == true)
            {
                CIF = "CIF";
            }
            if (rbtnFOB.Checked == true)
            {
                FOB = "FOB";
            }
        #endregion
        }
        #region-----------ClearFields-----
        private void ClearFields()
        {
            txtcompanyName.Text = "";
            txtSupplierName.Text = "";
            txtContactNo.Text = "";
            ddlCountry.Text = "";
            ddlState.Text = "";
            ddlCity.Text = "";
            txtArea.Text = "";
            txtAddress.Text = "";

        }
        #endregion
    }
}