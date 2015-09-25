﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
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
                            <asp:Label ID="lblPageHeading" runat="server" Text="DMP Linking" class="control-label"></asp:Label></h3>
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
                                        <asp:DropDownList ID="ddlDoctor" runat="server" class="form-control" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of First Row-->
                                <!--Start Second Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblMedicalRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblMedical" runat="server" Text="Medical Name" class="control-label">
                                            <asp:RequiredFieldValidator ID="MedicalRequired" runat="server" ErrorMessage="*" ControlToValidate="ddlMedical"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Medical" ValidationGroup="SaveDMPLinking"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlMedical" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of Second Row-->

                                <!--Start Third Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblReqProduct" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblProduct" runat="server" Text="Product Name" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqProduct" runat="server" ErrorMessage="*" ControlToValidate="ddlProduct"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Product" ValidationGroup="SaveDMPLinking"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlProduct" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of Third Row-->
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!--Start of Third Row-->
                        <div class="row form-group">
                            <div class="col-sm-4">
                                <asp:Label ID="lblCityRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                <asp:Label ID="lblCityName" runat="server" Text="City Name" class="control-label">
                                    <asp:RegularExpressionValidator ID="RegCity" runat="server" ErrorMessage="*" ValidationExpression="[a-zA-Z ]*$"
                                        ControlToValidate="txtCityName" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                        SetFocusOnError="True" ToolTip="Enter Only Characters" ValidationGroup="SaveCity"></asp:RegularExpressionValidator>
                                </asp:Label></div>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCityName" runat="server" class="form-control" placeholder="City Name"
                                    required></asp:TextBox></div>
                        </div>
                        <!--End of third Row-->
                        <!--Start Fourth Row-->
                        <div class="row form-group">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success" ValidationGroup="SaveCity"
                                     />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger" />
                            </div>
                        </div>
                        <!--End of Fourth Row-->
                        <!--Start Grid View-->
                        <div class="row">
                            <asp:GridView ID="grvCity" runat="server" AutoGenerateColumns="false" class="table"
                                HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                                HeaderStyle-BorderColor="#4596f1" AllowPaging="true" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country Name" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("Country Name")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State Name" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("State Name")%></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City Name" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("City Name")%></ItemTemplate>
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
                        <!--End Grid View-->
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
