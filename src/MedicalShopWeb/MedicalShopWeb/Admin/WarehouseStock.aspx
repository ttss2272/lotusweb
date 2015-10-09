<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="WarehouseStock.aspx.cs" Inherits="MedicalShopWeb.Admin.WarehouseStock" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Warehouse Stock" class="control-label label label-info"></asp:Label></h3>
                    </div>
                </div>
                <asp:UpdatePanel ID="ddlUpdatePanel" runat="server">
                            <ContentTemplate>
                <div class="panel-body">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        
                                <!--Start First Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlWarehouse" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlWarehouse_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of First Row-->
                                <!--Start Second Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblProduct" runat="server" Text="Product" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of Second Row-->
                                <!--Start Third Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblStock" runat="server" Text="Stock" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtStock" runat="server" class="form-control" placeholder="Stock"
                                            ReadOnly></asp:TextBox>
                                    </div>
                                </div>
                                <!--End Of Third Row-->
                                <!--Start Fourth Row-->
                                <div class="row form-group" align="center">
                                    <div class="col-md-12">
                                        
                                        <asp:LinkButton ID="lnkbtnClear" runat="server" class=" btn btn-primary btn-lg" OnClick="btnCheck_Click">Clear</asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnClose" runat="server" class=" btn btn-danger btn-lg" OnClick="btnClose_Click">Close</asp:LinkButton>
                                    </div>
                                </div>
                                <!--End of Fourth Row-->
                                <!--Start OF Fifth Row-->
                                <div class="row">
                    <asp:GridView ID="grvWarehouseStock" runat="server" AutoGenerateColumns="false" class="table"
                        HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                        HeaderStyle-BorderColor="#4596f1" AllowPaging="true" OnPageIndexChanging="grvWarehouseStock_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#Eval("ProductName")%></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stock" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#Eval("Stock")%></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                                <!--End OF Fifth Row-->
                            
                    </div>
                </div>
                
                

                </ContentTemplate>
                        </asp:UpdatePanel>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
