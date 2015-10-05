<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MedicalShopWeb.Admin.ChangePassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
<asp:ToolkitScriptManager ID="ToolkitScriptManagerPurchaseProduct" runat="server"></asp:ToolkitScriptManager>
<div class="form">
<div class="row" align="center">
 <div class="col-md-12">
     <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
 </div>
</div>
<div class="form-group">

<div class="panel panel-default" >
 
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="Change Password" class="control-label label label-primary"></asp:Label></h3>
        </div>
        </div>
    <div class="panel-body">
    <div class="col-md-4"></div>
     <div class="col-md-4">  
    <!--Start First Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblActualName" runat="server" Text="Actual Name" class="control-label">
            <asp:RegularExpressionValidator ID="RegCountry" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtActualName" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveCountry"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtActualName" runat="server" class="form-control" placeholder="Actual Name" required></asp:TextBox></div>
     </div> 
     <!--End Of First Row-->

      <!--Start Second Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblRequired2" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblLoginName" runat="server" Text="Login Name" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtLoginName" runat="server" class="form-control" placeholder="Login Name" required></asp:TextBox></div>
     </div> 
     <!--End Of Second Row-->

      <!--Start Third Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblReqPassword" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblPassword" runat="server" Text="Password" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox></div>
     </div> 
     <!--End Of Third Row-->


      <!--Start Third Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblReqConfPass" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Re-Type Password" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox></div>
     </div> 
     <!--End Of Fourth Row-->


     <!--Start Second Row-->
     <div class="row form-group" align="center">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" />
                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg"  />

        </div>
     </div>
     <!--End of Second Row-->
    
     </div>
        
     <div class="col-md-4"></div> 
     
</div>
   <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>

</div>
</div>
</div>

</asp:Content>
