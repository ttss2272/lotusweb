<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="ViewSupplier.aspx.cs" Inherits="MedicalShopWeb.Admin.ViewSupplier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManagerPurchaseProduct" runat="server">
    </asp:ToolkitScriptManager>
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
                        <h3>
                            <asp:Label ID="lblPageHeading" runat="server" Text="View Supplier" class="control-label
label label-info"></asp:Label></h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-4 col-md-offset-4">
                        <!--Start First Row-->
                        <div class="row form-group">
                            <div class="col-sm-4">
                                <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                <asp:Label ID="lblSupplier" runat="server" Text="Supplier" class="control-label"> </asp:Label></div>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!--End Of First Row-->
                        <!--Start Second Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" 
                                    class=" btn btn-primary" onclick="btnSearch_Click" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger" 
                                    onclick="btnClose_Click" />
                            </div>
                        </div>
                        <!--End Second Row-->
                    </div>
                    <!--Start Gridview-->
                    <div class="panel-body table table-responsive">
                    <div class="row">
        <asp:GridView ID="grvSupplier" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" ><%--onpageindexchanging="grvState_PageIndexChanging"--%>

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("CompanyName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact Person" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ContactPerson")%></ItemTemplate>
            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ContactNo")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Area")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="City Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("CityName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mode Of Transport" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ModeOfTransport")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Price Type" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("PriceType")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/Supplier.aspx?SupplierID={0}&iss=0", DataBinder.Eval(Container.DataItem,"SupplierID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkDelete" runat="server" Text="Delete" NavigateUrl='<%#String.Format("../Admin/Supplier.aspx?SupplierID={0}&iss=0", DataBinder.Eval(Container.DataItem,"SupplierID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>
             </asp:TemplateField>
         </Columns>
        </asp:GridView>
     </div>
                        </div>
                    
                    <!--End GridView-->
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory
Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
