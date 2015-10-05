<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewMedicalShop.aspx.cs" Inherits="MedicalShopWeb.Admin.ViewMedicalShop" %>
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
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="Medical Shop" class="control-label"></asp:Label></h3>
    </div>
    </div>
   

        <div class="panel-body">
            <div class="col-md-4"></div>
     <div class="col-md-4">  
     <asp:UpdatePanel ID="ddlUpdatePanel" runat="server">
     <ContentTemplate>
     <!--Start Of First Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    
            <asp:Label ID="lblShopType" runat="server" Text="Shop Type" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlShopType" runat="server"  class="form-control" 
                AutoPostBack="True" onselectedindexchanged="ddlShopType_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
     </div>
     <!--End Of First Row-->
    <!--Start Second Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    
            <asp:Label ID="lblMedicalShop" runat="server" Text="Medical Name" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlMedicalShop" runat="server"  class="form-control">
            </asp:DropDownList>
        </div>
     </div> 
     <!--End Of Second Row-->
     </ContentTemplate>
     </asp:UpdatePanel>
     <!--Start Third Row-->
     <div class="row form-group">
        <div class="col-md-12">
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                class=" btn btn-primary btn-lg" onclick="btnSearch_Click" />
            <asp:Button ID="btnClose" runat="server" Text="Close"  class=" btn btn-danger btn-lg" 
                onclick="btnClose_Click"  />

        </div>
     </div>
     <!--End of Third Row-->
     
     </div>
        
     <div class="col-md-4"></div> 
        </div>
     <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>
  
   <!--Start Grid View-->
   <asp:UpdatePanel runat ="server" ID="GridUpdate"><ContentTemplate>
   <div class="panel-body table table-responsive">
     <div class="row">
        <asp:GridView ID="grvMedicalShop" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" onpageindexchanging="grvMedicalShop_PageIndexChanging">

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Shop Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:HyperLink ID="HyperLinkShopName" runat="server" Text='<%#Eval("ShopName")%>' NavigateUrl='<%#String.Format("../Admin/MedicalShop.aspx?MedicalShopID={0}&iss=0", DataBinder.Eval(Container.DataItem,"MedicalShopID") )%>'>
                              </asp:HyperLink></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Owner Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("OwnerName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ContactNo")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Shop Type" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ShopTypeName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Area")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("CityName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkDelete" runat="server" Text="Delete"  NavigateUrl='<%#String.Format("../Admin/MedicalShop.aspx?MedicalShopID={0}&iss=1", DataBinder.Eval(Container.DataItem,"MedicalShopID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>
             </asp:TemplateField>
         </Columns>
        </asp:GridView>
     </div>
    </div>
    </ContentTemplate></asp:UpdatePanel>
     <!--End Grid View-->
      </div>
  </div>
</div>

     
</asp:Content>
