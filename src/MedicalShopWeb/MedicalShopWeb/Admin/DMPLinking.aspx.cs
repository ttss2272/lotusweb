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
    public partial class DMPLinking : System.Web.UI.Page
    {
        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- Declare Variables
         */
        #region----------------------------------Declare Variables-----------------------------
        BLDoctorDetails objDoctor = new BLDoctorDetails();
        BLMedicalShop objMedicalShop = new BLMedicalShop();
        BLMedicalStock objMedicalStock = new BLMedicalStock();
        BLDMPLinking objDMPLinking = new BLDMPLinking();

        int DMPID, DoctorID, MedicalShopID, ProductID, PriceTypeID, UpdatedByUserID, IsActive;
        decimal Price;
        #endregion

        /*
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- Page_Load
         */
        #region--------------------------Page_Load-------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindDoctor();
                    BindMedicalShop();
                   
                    if (Request.QueryString["DMPID"] != null)
                    {
                        hdnDMPID.Value = Request.QueryString["DMPID"];
                        SetValues();
                    }
                    else
                    {
                        hdnDMPID.Value = "0";
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
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- ddlDoctor_SelectedIndexChanged
         */
        #region--------------------------ddlDoctor_SelectedIndexChanged--------------------------
        protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
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
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- ddlMedical_SelectedIndexChanged
         */
           #region-----------------------------ddlMedical_SelectedIndexChanged--------------------
           protected void ddlMedical_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindMedicalProducts();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
           #endregion

        /*
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :-btnSave_click
         */
           #region-----------------------------btnSave_Click-------------------------------
           protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetParameters();
                SaveDMPLinking();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
            finally
            {
                ClearFields();
                Response.AppendHeader("Refresh", "2;url=DMPLinking.aspx");
            }
        }
           #endregion

        /*
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :-btnClose_Click
         */
           #region-------------------------------btnClose_Click----------------------
           protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFields();
                Response.Redirect("../Defult.aspx", false);
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
         * Created Date:-26 Sept 2015
         * Purpose :- BindDoctor() to Dropdown
         */
           #region------------------------BindDoctor()---------------------------------------
           private void BindDoctor()
           {
               DataSet dsDoctor = objDoctor.GetDoctor();
               ddlDoctor.Items.Clear();
               if (dsDoctor.Tables.Count != 0)
               {
                   if (dsDoctor.Tables[0].Rows.Count != 0)
                   {
                       ddlDoctor.DataTextField = "DoctorName";
                       ddlDoctor.DataValueField = "DoctorID";
                       ddlDoctor.DataSource = dsDoctor;
                       ddlDoctor.DataBind();
                   }
                   else
                   {
                       ddlDoctor.DataSource = null;
                       ddlDoctor.DataBind();
                   }
                   ddlDoctor.Items.Insert(0,new ListItem("Select Doctor","-1"));
                   

               }
           }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :-BindMedicalShop() to Dropodown
         */
           #region------------------------BindMedicalShop()---------------------------------------
           private void BindMedicalShop()
           {
               DataSet dsMedicalShop = objMedicalShop.BindMedicalShop(0);
               ddlMedical.Items.Clear();

               if (dsMedicalShop.Tables.Count != 0)
               {
                   if (dsMedicalShop.Tables[0].Rows.Count != 0)
                   {
                       ddlMedical.DataTextField = "ShopName";
                       ddlMedical.DataValueField = "MedicalShopID";
                       ddlMedical.DataSource = dsMedicalShop;
                       ddlMedical.DataBind();
                   }
                   else
                   {
                       ddlMedical.DataSource = null;
                       ddlMedical.DataBind();
                   }
                   ddlMedical.Items.Insert(0, new ListItem("Select MedicalShop", "-1"));
                   ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
               }
           }
           #endregion


        /*
         * Created By:-  PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- Bind Medical products Only
         */
           #region------------------------BindMedicalProducts()---------------------------------------
           private void BindMedicalProducts()
           {
               DataSet dsMedicalProduct = objMedicalStock.BindMedicalProduct(Convert.ToInt32(ddlMedical.SelectedValue));
               ddlProduct.Items.Clear();
               if (dsMedicalProduct.Tables.Count != 0)
               {
                   if (dsMedicalProduct.Tables[0].Rows.Count != 0)
                   {
                       ddlProduct.DataTextField = "ProductName";
                       ddlProduct.DataValueField = "ProductID";
                       ddlProduct.DataSource = dsMedicalProduct;
                       ddlProduct.DataBind();
                   }
                   else
                   {
                       ddlProduct.DataSource = null;
                       ddlProduct.DataBind();
                   }
                   ddlProduct.Items.Insert(0, new ListItem("Select Product", "-1"));
               }
           }
           #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :- BindGridview()
         */
           #region-----------------------------BindGridView()------------------------------------
           private void BindGridView()
           {
               DataSet dsBindGridView = objDMPLinking.GetAllDMPDetail(Convert.ToInt32(ddlDoctor.SelectedValue));

               if (dsBindGridView.Tables.Count != 0)
               {
                   if (dsBindGridView.Tables[0].Rows.Count != 0)
                   {
                       grvDMPLinking.DataSource = dsBindGridView;
                       grvDMPLinking.DataBind();
                   }
                   else
                   {
                       grvDMPLinking.DataSource = null;
                       grvDMPLinking.DataBind();
                   }
               }
           }
        #endregion

        /*
         * Created By:-PriTesh D. Sortee
         * Created Date:-26 Sept 2015
         * Purpose :-SetParameters()
         */
           #region----------------------------SetParameters()----------------------------------------
           private void SetParameters()
           {
               DMPID = Convert.ToInt32( hdnDMPID.Value);
               DoctorID = Convert.ToInt32(ddlDoctor.SelectedValue);
               MedicalShopID = Convert.ToInt32(ddlDoctor.SelectedValue);
               ProductID = Convert.ToInt32(ddlProduct.SelectedValue);
               PriceTypeID = Convert.ToInt32(rdbPriceType.SelectedValue);
               Price = Convert.ToDecimal(txtPrice.Text);

               UpdatedByUserID = 1;
           }
        #endregion


        /*
         * Created By:-PriTesh D. Sortee
         * Created Date:- 26 Sept 2015
         * Purpose :- ClearFields()
         */

           #region---------------------------------ClearFields()---------------------------------
           private void ClearFields()
           {
               BindDoctor();
               BindMedicalShop();

               hdnDMPID.Value = "";
               rdbPriceType.SelectedItem.Selected = false;
               txtPrice.Text = "";
           }
        #endregion

        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:- 26 Sept 2015
         * Purpose :- SaveDmplinking code 
         */
        #region--------------------------------SaveDMPLInking()-----------------------------
           private void SaveDMPLinking()
           {
               string Result = objDMPLinking.SaveDMPLinking(DMPID, DoctorID, MedicalShopID, ProductID, PriceTypeID, Price, UpdatedByUserID, IsActive);
               if (Result == "DMPLinking Created Sucessfully...!!!" || Result == "DMPLinking Updated Sucessfully...!!!")
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
         * Created By:- PriTesh D. Sortee
         * Created Date:- 26 Sept 2015
         * Purpose :- Set Value to Fields for Edit
         */
        #region--------------------------------SetValues()-------------------------
           private void SetValues()
           {
               DataSet dsDMPData = objDMPLinking.BindDMPDetail(Convert.ToInt32(DMPID));

               if (dsDMPData.Tables.Count != 0)
               {
                   if (dsDMPData.Tables[0].Rows.Count != 0)
                   {
                       ddlDoctor.SelectedValue = dsDMPData.Tables[0].Rows[0]["DoctorID"].ToString();
                       ddlMedical.SelectedValue = dsDMPData.Tables[0].Rows[0]["MedicalShopID"].ToString();
                       BindMedicalProducts();
                       ddlProduct.SelectedValue = dsDMPData.Tables[0].Rows[0]["ProductID"].ToString();
                       rdbPriceType.SelectedValue = dsDMPData.Tables[0].Rows[0]["PriceTypeID"].ToString();
                       txtPrice.Text = dsDMPData.Tables[0].Rows[0]["Price"].ToString();
                       btnSave.Text = "Update";
                       
                   }
                   else
                   { 
                   }
               }
           }
        #endregion

        
        /*
         * Created By:- PriTesh D. Sortee
         * Created Date:- 26 Sept 2015
         * Purpose :- ddlProduct_SelectedIndexChanged
         */

           #region-------------------------------ddlProduct_SelectedIndexChanged---------------------------
           protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
           {
               try
               {
                   if (ddlDoctor.SelectedValue != "-1")
                   {
                       GetDMPPrice();
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
         * Created By:- PriTesh D. Sortee
         * Created Date:- 26 Sept 2015
         * Purpose :- GetDMPPrice() on DoctorID,MedicalID,ProductID
         */
           #region-----------------------------------GetDMPPrice()------------------------------
           private void GetDMPPrice()
           {
               DataSet dsDmpPrice = objDMPLinking.GetDmpPrice(Convert.ToInt32(ddlDoctor.SelectedValue), Convert.ToInt32(ddlMedical.SelectedValue), Convert.ToInt32(ddlProduct.SelectedValue));
               if (dsDmpPrice.Tables.Count != 0)
               {
                   if (dsDmpPrice.Tables[0].Rows.Count != 0)
                   {
                       rdbPriceType.SelectedValue = dsDmpPrice.Tables[0].Rows[0]["PriceTypeID"].ToString();
                       txtPrice.Text = dsDmpPrice.Tables[0].Rows[0]["Price"].ToString();
                       hdnDMPID.Value = dsDmpPrice.Tables[0].Rows[0]["DMPID"].ToString();
                   }
                   else
                   { 
                   }
               }
           }
           #endregion

           /*
         * Created By:- PriTesh D. Sortee
         * Created Date :- 09 OCT 2015
         * Purpose :- Clear button click
         */
           #region-----------------------------------lnkbtnClear_Clear()-----------------------------
           protected void lnkbtnClear_Click(object sender, EventArgs e)
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
    }
}