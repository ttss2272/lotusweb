<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="SaleTransaction.aspx.cs" Inherits="MedicalShopWeb.Admin.SaleTransaction" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Sale Transaction" class="control-label label label-info"></asp:Label></h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <!--Start First Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblSaleTransactionNo" runat="server" Text="Sale No" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtSaleTransactionNo" runat="server" class="form-control" placeholder="Sale Transacion No"
                                            ReadOnly></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqSaleDate" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblSaleDate" runat="server" Text="Date" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtSaleDate" runat="server" class="form-control" placeholder="DD/MM/YYYY"
                                            required></asp:TextBox></div>
                                    <asp:CalendarExtender ID="CalendarExtenderSaleDate" runat="server" TargetControlID="txtSaleDate"
                                        Format="dd/MM/yyyy">
                                    </asp:CalendarExtender>
                                </div>
                            </div>
                            <!--End Second Column-->
                        </div>
                        <!--End First Row-->
                        <!--Start Second Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqWarehosue" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqWarehouse" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="ddlWarehouse" InitialValue="-1"
                                                SetFocusOnError="True" ToolTip="Please Select Warehouse" ValidationGroup="AddSaleTransaction"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlWarehouse" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqMedical" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblMedical" runat="server" Text="Medical" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqMedical" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="ddlMedical" InitialValue="-1"
                                                SetFocusOnError="True" ToolTip="Please Select Medical" ValidationGroup="AddSaleTransaction"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlMedical" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--End Second Column-->
                        </div>
                        <!--End Second Row-->
                        <!--Start Third Row-->
                        <asp:UpdatePanel ID="UpdatepanelProduct" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <!--Start First Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="lblReqProduct" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblProduct" runat="server" Text="Product" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqProduct" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlProduct" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select Product" ValidationGroup="AddSaleTransaction"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End First Column-->
                                    <!--Start Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock" class="control-label">
            
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtCurrentStock" runat="server" class="form-control" placeholder="Current Stock"
                                                    ReadOnly></asp:TextBox></div>
                                        </div>
                                    </div>
                                    <!--End Second Column-->
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!--End Third Row-->
                        <!--Start Fourth Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqSalePrice" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblSalePrice" runat="server" Text="Sale Price" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegSalePrice" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9]*$" ControlToValidate="txtSalePrice" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="AddSaleTransaction"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtSalePrice" runat="server" class="form-control" placeholder="Sale Price"
                                            required></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqQuantity" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegQuantity" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9]*$" ControlToValidate="txtQuantity" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="AddSaleTransaction"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtQuantity" runat="server" class="form-control" placeholder="Quantity"
                                            required></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End Second Column-->
                        </div>
                        <!--End Fourth Row-->
                        <!--Start Fifth Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-lg btn-primary"
                                    ValidationGroup="AddSaleTransaction" OnClick="btnAdd_Click1" />
                            </div>
                        </div>
                        <!--End Fifth Row-->
                    </div>
                    <!--Start Sixth Row-->
                    <!--Bind Gridview-->
                    <div class="row">
                        <div class="col-sm-1">
                        </div>
                        <div class="col-sm-10">
                            <asp:GridView ID="grvPurhaseProduct" runat="server" AutoGenerateColumns="false" class="table"
                                HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                                HeaderStyle-BorderColor="#4596f1" AllowPaging="true">
                                <%--onpageindexchanging="grvCountry_PageIndexChanging"--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("ProductName")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("Quantity")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sale Price" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("SalePrice")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/Country.aspx?CountryId={0}", DataBinder.Eval(Container.DataItem,"CountryID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>
             </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="col-sm-1">
                        </div>
                    </div>
                    <!--End Of GridView-->
                    <!--End Sixth Row-->
                    <!--Eighth Row-->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-sm-12">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqComment" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblComment" runat="server" Text="Comment" class="control-label">
        
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtComment" runat="server" class="form-control" placeholder="Comment"
                                            TextMode="MultiLine" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-2">
                            <div class="panel panel-body" style="border-color: Gray;">
                                <div class="col-xs-12">
                                    <!--Start First Row-->
                                    <div class="row">
                                        <!--Start First Column-->
                                        <div class="col-sm-12">
                                            <div class="row form-group">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="lblTotal" runat="server" Text="Total" class="control-label">
        
                                                    </asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txtTotal" runat="server" class="form-control" placeholder="Total"
                                                        ReadOnly></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First Column-->
                                    </div>
                                    <!--End First Row-->
                                    <!--Start Second Row-->
                                    <div class="row">
                                        <!--Start first Column-->
                                        <div class="col-sm-12">
                                            <div class="row form-group">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="lblReqDiscount" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                    <asp:Label ID="Discount" runat="server" Text="Discount(%)" class="control-label">
                                                        <asp:RegularExpressionValidator ID="ReqDiscount" runat="server" ErrorMessage="*"
                                                            ValidationExpression="[0-9]*$" ControlToValidate="txtDiscount" Display="Dynamic"
                                                            Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                            ValidationGroup="SaveSaleTransaction"></asp:RegularExpressionValidator>
                                                    </asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txtDiscount" runat="server" class="form-control" placeholder="Discount"
                                                        required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End first Column-->
                                    </div>
                                    <!--End Second Row-->
                                    <!--Start Third Row-->
                                    <div class="row">
                                        <!--Start First Column-->
                                        <div class="col-sm-12">
                                            <div class="row form-group">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="lblFinalTotal" runat="server" Text="Final Total" class="control-label">
        
                                                    </asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txtFinalTotal" runat="server" class="form-control" placeholder="Final Total"
                                                        ReadOnly></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First Column-->
                                    </div>
                                    <!--End Third Row-->
                                    <!--Start Fourth Row-->
                                    <div class="row">
                                        <!--Start first Column-->
                                        <div class="col-sm-12">
                                            <div class="row form-group">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="lblreqAmountPaid" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                    <asp:Label ID="lblAmountPaid" runat="server" Text="AmountPaid" class="control-label">
                                                        <asp:RegularExpressionValidator ID="RegAmountPaid" runat="server" ErrorMessage="*"
                                                            ValidationExpression="[0-9]*$" ControlToValidate="txtAmountPaid" Display="Dynamic"
                                                            Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                            ValidationGroup="SaveSaleTransaction"></asp:RegularExpressionValidator>
                                                    </asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txtAmountPaid" runat="server" class="form-control" placeholder="Amount Paid"
                                                        required></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End first Column-->
                                    </div>
                                    <!--End Fourth Row-->
                                    <!--Start Fifth Row-->
                                    <div class="row">
                                        <!--Start First Column-->
                                        <div class="col-sm-12">
                                            <div class="row form-group">
                                                <div class="col-sm-5">
                                                    <asp:Label ID="lblBalanceAmount" runat="server" Text="Balance Amount" class="control-label">
        
                                                    </asp:Label>
                                                </div>
                                                <div class="col-sm-7">
                                                    <asp:TextBox ID="txtBalanceAmount" runat="server" class="form-control" placeholder="Balance Amount"
                                                        ReadOnly></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First Column-->
                                    </div>
                                    <!--End Fifth Row-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Eighth Row-->
                    <!--Start Ninth Row-->
                    <div class="row form-group" align="center">
                        <div class="col-md-12">
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-lg btn-success"
                                OnClick="btnSave_Click" />
                            <asp:Button ID="BtnCancel" runat="server" Text="Clear" class="btn btn-lg btn-danger"
                                OnClick="BtnCancel_Click" />
                        </div>
                    </div>
                    <!--End Ninth Row-->
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
