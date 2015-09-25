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
    public partial class Login : System.Web.UI.Page
    {
        BLLogin objLogin = new BLLogin();

        #region--------------------------------Page_Load------------------------
        protected void Page_Load(object sender, EventArgs e)
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

        #region-------------------------------btnLogin------------------------------------
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsSessionInfo = objLogin.UserLogin(txtLoginName.Text.ToString(), txtPassword.Text.ToString());

                if (dsSessionInfo.Tables.Count != 0)
                {
                    if (dsSessionInfo.Tables[0].Rows.Count != 0)
                    {
                        if ((dsSessionInfo.Tables[0].Rows[0][0].ToString() != "User Is Deleted") && (dsSessionInfo.Tables[0].Rows[0][0].ToString() != "Invalid Password") && (dsSessionInfo.Tables[0].Rows[0][0].ToString() != "Invalid Login Name"))
                        {
                            Session["WarehouseID"] = dsSessionInfo.Tables[0].Rows[0]["WarehouseID"].ToString();
                            Session["LoginName"] = dsSessionInfo.Tables[0].Rows[0]["LoginName"].ToString();
                            HttpContext.Current.ApplicationInstance.CompleteRequest();
                            Response.Redirect("Defult.aspx", false);
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = dsSessionInfo.Tables[0].Rows[0][0].ToString();
 
                        }
 
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
    }
}