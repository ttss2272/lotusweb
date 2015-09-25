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
    public partial class ViewUser : System.Web.UI.Page
    {
        #region--------------------------------Declare Variables-------------------------------
        int UserID = 0;
        BLNewUser objUser = new BLNewUser();
        #endregion

        #region-----------------------Page_Load-------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindUser();
                    Bindgridview();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region--------------------------------btnSearch_Click---------------------------
        protected void btnSearch_Click(object sender, EventArgs e)
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

        #region---------------------------------btnClose_Click-----------------------
        protected void btnClose_Click(object sender, EventArgs e)
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

        #region-----------------------------BindUser()-------------------------------------
        private void BindUser()
        {
            DataSet dsUser = objUser.BindUser(UserID);
            ddlUserName.Items.Clear();
            if (dsUser.Tables.Count != 0)
            {
                if (dsUser.Tables[0].Rows.Count != 0)
                {
                    ddlUserName.DataTextField = "UserName";
                    ddlUserName.DataValueField = "UserID";

                    ddlUserName.DataSource = dsUser;
                    ddlUserName.DataBind();

                }
                else
                {
                    ddlUserName.DataSource = null;
                    ddlUserName.DataBind();
                }
                ddlUserName.Items.Insert(0, new ListItem("Select All", "0"));
            }
        }
        #endregion

        #region-------------------------------------BindGridView()-------------------------
            private void Bindgridview()
            {
                DataSet dsUser = objUser.GetUser(Convert.ToInt32( ddlUserName.SelectedValue));
                
                if (dsUser.Tables.Count != 0)
                {
                    if (dsUser.Tables[0].Rows.Count != 0)
                    {
                        grvUser.DataSource = dsUser;
                        grvUser.DataBind();
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text="dataNot Available";
                    }
                }
            }
        #endregion
    }
}