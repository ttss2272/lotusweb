using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MedicalShopWeb
{
    public partial class DoctorDetails : System.Web.UI.Page
    {
       

        #region---------------------------Variables------------------------
        int id,CityId,IsActive;
        string DrName,Specialization,DOB,Area,Address,Mobileno;
        double OpeningBalance;
        BLDoctorDetails obj_Doctor = new BLDoctorDetails();
        BLCountry objCountry = new BLCountry();
        BLState objState = new BLState();
        BLCity objcity = new BLCity();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindCountry();
                    
                    //BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }

        #region----------------------------BindCity-----------------------------------
        private void BindCity()
        {

            DataSet dsCity = objcity.BindCity(Convert.ToInt32(ddlState.SelectedValue));
            ddlCity.Items.Clear();
            //ddlCity.Items.Insert(0, new ListItem("Select City", "-1"));
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

        #region-------------------btnSave_Click------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int id = 0;
                string DrName = txtDoctorName.Text;
                string Specialization = txtspecialz.Text;
                string DOB = txtDOB.Text;
                int CityId = Convert.ToInt32(ddlCity.SelectedValue.ToString());
                string Area = txtArea.Text;
                String Address = txtAddress.Text;
                //string ProductList = lbProductList.Text;
                string Mobileno = txtmobno.Text;
                int IsActive = 1;
                double OpeningBalance = Convert.ToDouble(txtOpeningBalance.Text);
                SaveDoctor();

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


        #region-------------------------------Clear Field----------------------
        private void ClearFields()
        {
            txtDoctorName.Text = "";
            txtDOB.Text = "";
            txtspecialz.Text = "";
            txtmobno.Text="";
            txtAddress.Text = "";
            txtArea.Text = "";
            txtProductlist.Text = "";
            txtOpeningBalance.Text="";
        }
        #endregion

        #region---------------------------SaveCountry()--------------------------
        private void SaveDoctor()
        {
            string Result = obj_Doctor.SaveDoctor(DrName, Specialization, DOB, CityId, Area, Address, Mobileno,OpeningBalance,IsActive);
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

          //  BindGridView();

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
                lblMessage.Text = ex.Message.ToString();
            }
        }

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

        
      

        
    }
}