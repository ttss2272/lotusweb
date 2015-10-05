<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="DMPLinking.aspx.cs" Inherits="MedicalShopWeb.Admin.DMPLinking" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="DMP Linking" class="control-label label label-info"></asp:Label></h3>

                    </div>
                </div>
                
                <div class="panel-body">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <asp:UpdatePanel ID="UpdatePanelDMPLinking" runat="server">
                            <ContentTemplate>
                                <!--Start First Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDoctor" runat="server" Text="Doctor" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqDoctor" runat="server" ErrorMessage="*" ControlToValidate="ddlDoctor"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Doctor" ValidationGroup="SaveDMPLinking"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlDoctor" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of First Row-->
                                <!--Start Second Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblMedicalRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblMedical" runat="server" Text="Medical" class="control-label">
                                            <asp:RequiredFieldValidator ID="MedicalRequired" runat="server" ErrorMessage="*"
                                                ControlToValidate="ddlMedical" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                InitialValue="-1" SetFocusOnError="True" ToolTip="Please Select Medical" ValidationGroup="SaveDMPLinking"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlMedical" runat="server" class="form-control" OnSelectedIndexChanged="ddlMedical_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of Second Row-->
                                <!--Start Third Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqProduct" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblProduct" runat="server" Text="Product" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqProduct" runat="server" ErrorMessage="*" ControlToValidate="ddlProduct"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Product" ValidationGroup="SaveDMPLinking"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of Third Row-->
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!--Start Fourth Row-->
                        <div class="row form-group">
                            <div class="col-sm-4">
                            </div>
                            <div class="col-sm-8 ">
                                <asp:RadioButtonList ID="rdbPriceType" runat="server">
                                    <asp:ListItem Value="1">Percentage Wise</asp:ListItem>
                                    <asp:ListItem Value="2">Price Unit Wise</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <!--End Of Fourth Row-->
                        <!--Start of Fifth Row-->
                        <div class="row form-group">
                            <div class="col-sm-4">
                                <asp:Label ID="lblReqPrice" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                <asp:Label ID="lblPrice" runat="server" Text="Price" class="control-label">
                                    <asp:RegularExpressionValidator ID="RegPrice" runat="server" ErrorMessage="*" ValidationExpression="[0-9.]*$"
                                        ControlToValidate="txtPrice" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                        SetFocusOnError="True" ToolTip="Enter Only Numbers" ValidationGroup="SaveDMPLinking"></asp:RegularExpressionValidator>
                                </asp:Label></div>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="Price"
                                    required></asp:TextBox></div>
                        </div>
                        <!--End of Fifth Row-->
                        <!--Start Fourth Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" ValidationGroup="SaveDMPLinking"
                                    OnClick="btnSave_Click" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg" OnClick="btnClose_Click" />
                            </div>
                        </div>
                        <!--End of Fourth Row-->
                        <!--Start Grid View-->
                        <div class="row">
                            <asp:GridView ID="grvDMPLinking" runat="server" AutoGenerateColumns="false" class="table"
                                HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                                HeaderStyle-BorderColor="#4596f1" AllowPaging="true">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Medical" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("ShopName")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("ProductName")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("Price")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price Type" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("PriceTypeName")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/DMPLinking.aspx?DMPID={0}&IsDel=0", DataBinder.Eval(Container.DataItem,"DMPID") )%>'>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Delete" ForeColor="Red" NavigateUrl='<%#String.Format("../Admin/DMPLinking.aspx?DMPID={0}&IsDel=1", DataBinder.Eval(Container.DataItem,"DMPID") )%>'>
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!--End Grid View-->
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                    <asp:HiddenField ID="hdnDMPID" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
