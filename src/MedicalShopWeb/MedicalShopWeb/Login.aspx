<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedicalShopWeb.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lotus</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Style/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Style/js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="../Style/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" class="form">
    <div class="modal-dialog">
    <div class="modal-body">
        <div class="row" align="center">
            <div class="col-md-12">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row" >
            <div class="panel" align="center" >
                <div class="panel-header">
                    <%--<img src="Images/login.jpg" height="200" width="300" alt="Login" />--%>
                    <h1><strong>Lotus Login</strong></h1>
                 </div>

                <div class="panel-body">
                <div class="row">
                    
                    <div class="col-sm-12">
                    <div class="row form-group">
                    <div class="col-xs-12">
                    <div class="col-xs-5">
                        <asp:Label ID="LoginName" runat="server" Text="Login Name" class="control-label"></asp:Label></div>
                        <div class="col-xs-7"><asp:TextBox ID="txtLoginName" runat="server" class="form-control col-xs-10" placeholder="User Name" required></asp:TextBox></div>
                        </div>
                        </div>

                        <div class="row form-group">
                    <div class="col-xs-12">
                    <div class="col-xs-5">
                        <asp:Label ID="lblPassword" runat="server" Text="Password" class="control-label"></asp:Label>
                      </div>
                        <div class="col-xs-7">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" required></asp:TextBox></div>
                        </div>
                        </div>

                        <div class="row form-group">
        <div class="col-md-12">
            <asp:Button ID="btnLogin" runat="server" Text="Login" class=" btn btn-success btn-lg" 
                ValidationGroup="SaveCity" onclick="btnSave_Click"/>
                <asp:Button ID="btnClose" runat="server" Text="Close" 
                class=" btn btn-danger btn-lg"/>

        </div>
     </div>
                        </div>
                        
                        </div>
                
                </div>
            </div>
        </div>
        </div>
    </div>
    </form>
    <script src="~/Style/js/bootstrap.js" type="text/javascript"></script>
    <script src="~/Style/js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="~/Style/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="~/Style/js/jquery-2.1.4.js" type="text/javascript"></script>
    <script src="~/Style/js/npm.js" type="text/javascript"></script>
</body>
</html>
