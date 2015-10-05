<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="MedicalShopWeb.Admin.ViewProducts" %>
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
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="View Products" class="control-label"></asp:Label></h3>
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
    
            <asp:Label ID="lblProductType" runat="server" Text="Product Type" class="control-label">
            </asp:Label>
            
            </div>
             <div class="col-sm-8">
            <asp:DropDownList ID="ddlProductType" runat="server"  class="form-control" 
                AutoPostBack="True" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
     </div>
     <!--End Of First Row-->
    <!--Start Second Row-->
     <div class="row form-group">
        <div class="col-sm-4">
         <asp:Label ID="lblProduct" runat="server" Text="Product Name" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlProduct" runat="server"  class="form-control">
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
                class=" btn btn-primary btn-lg" onclick="btnSearch_Click"/>
            <asp:Button ID="btnClose" runat="server" Text="Close"  class=" btn btn-danger btn-lg" 
                onclick="btnClose_Click"/>

        </div>
         </div>
     <!--End of Third Row-->
     
     </div>
        
     <div class="col-md-4"></div> 
        </div>
     <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Mandatory Fields" ></asp:Label>
   </div>
    <!--Start Grid View-->
   <asp:UpdatePanel runat ="server" ID="GridUpdate"><ContentTemplate>
   <div class="panel-body">
     <div class="row">
        <asp:GridView ID="grvProducts" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" onPageIndexChanging="grvProducts_PageIndexChanging">

         <Columns>
          <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">
         <ItemTemplate><%#Eval("ProductName")%>
                <%--<asp:HyperLink ID="HyperLinkProductName" runat="server" Text='<%#Eval("ProductName")%>' NavigateUrl='<%#String.Format("../Admin/Products.aspx?ProductID={0}&iss=0", DataBinder.Eval(Container.DataItem,"ProductID") )%>'>
                              </asp:HyperLink>--%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Code" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ProductCode")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Purchase Price" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("PurchasePrice")%></ItemTemplate>
            </asp:TemplateField>                     
            <asp:TemplateField HeaderText="Sale Price" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("SallingPrice")%></ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/Products.aspx?ProductID={0}&iss=0", DataBinder.Eval(Container.DataItem,"ProductID") )%>'>
                              </asp:HyperLink>
                                                  </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkDelete" runat="server" Text="Delete"  NavigateUrl='<%#String.Format("../Admin/Product.aspx?ProductID={0}&iss=1", DataBinder.Eval(Container.DataItem,"ProductID") )%>'>
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