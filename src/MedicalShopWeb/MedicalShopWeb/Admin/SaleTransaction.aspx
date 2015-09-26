<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="SaleTransaction.aspx.cs" Inherits="MedicalShopWeb.Admin.SaleTransaction" %>
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

<div class="panel panel-default">
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
        <asp:Label ID="lblPageHeading" runat="server" Text="Sale Transaction" class="control-label label label-primary"></asp:Label></div></div>
    <div class="panel-body">

    </div>
    <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>
</div>
</div>
</div>
</asp:Content>
