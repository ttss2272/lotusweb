<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Warehouse.aspx.cs" Inherits="MedicalShopWeb.Admin.Warehouse" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<div class="form">
<div class="row" align="center">
 <div class="col-md-12">
     <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
 </div>
</div>
<div class="form-group">

<div class="panel panel-default" align="center">
 
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
      <h3>  <asp:Label ID="lblPageHeading" runat="server" Text="Warehouse" class="control-label label label-info"></asp:Label></h3>
      </div>
      </div>
    <div class="panel-body">
    <div class="col-md-4"></div>
 <div class="col-md-4">  
    <!--Start First Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblWarehouseName" runat="server" Text="Warehouse Name" class="control-label">
            <asp:RegularExpressionValidator ID="RegWarehouse" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtWarehouseName" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveWarehouse"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtWarehouseName" runat="server" class="form-control" placeholder="Warehouse Name" required></asp:TextBox></div>
     </div> 
     <!--End Of First Row-->

     <!--Start Second Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblLocation" runat="server" Text="Location" class="control-label">
            <asp:RegularExpressionValidator ID="RegLocation" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtLocation" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveWarehouse"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtLocation" runat="server" class="form-control" placeholder="Location" required></asp:TextBox></div>
     </div>
     <!--End Second Row-->

     <!--Start Third Row-->
     <div class="row form-group">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" 
                 ValidationGroup="SaveWarehouse" onclick="btnSave_Click"/>

                  <asp:Button ID="btnClear" runat="server" Text="Clear" class=" btn btn-primary btn-lg" />
                 <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg" />

        </div>
     </div>
     <!--End of Third Row-->
    
     <!--Start Grid View-->
   
      <asp:UpdatePanel runat ="server" ID="GridUpdate">
      <ContentTemplate>
   <div class="panel-body">
     <div class="row">
        <asp:GridView ID="grvWarehouse" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" ><%--onpageindexchanging="grvWarehouse_PageIndexChanging"--%>

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Warehouse Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Warehouse Name")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Location" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Location")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("Warehouse.aspx?WarehouseID={0}&iss=0", DataBinder.Eval(Container.DataItem,"WarehouseID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>
             </asp:TemplateField>
         </Columns>
        </asp:GridView>
     </div>
     </div>
      </ContentTemplate>
      </asp:UpdatePanel>
     <!--End Grid View-->
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
