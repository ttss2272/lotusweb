<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Country.aspx.cs" Inherits="MedicalShopWeb.Country" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style/css/bootstrap-theme.css" />
    <link href="Style/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="Style/js/bootstrap.js" type="text/javascript"></script>
    <script src="Style/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
    <div class="row">
     <div class="col-md-4">
     </div>
     <div class="col-md-4">
        <div class="col-md-4">
            <asp:Label ID="lblCountryName" runat="server" Text="Country Name"></asp:Label>
        </div>
        <div class="col-md-8">
            <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
        </div>
     </div>
     <div class="col-md-4">
     </div>
     </div>
     <div class="row"></div>
     <div class="row">
     <div class="col-md-4">
     </div>
     <div class="col-md-4" align="center">
         <asp:Button ID="BtnSave" runat="server" Text="Save"/>
     </div>
     <div class="col-md-4">
     </div>
     </div>

    </div>
    </form>
</body>
</html>
