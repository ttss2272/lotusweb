<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="MedicalShop.aspx.cs" Inherits="MedicalShopWeb.Admin.MedicalShop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Medical Shop" class="control-label label label-info"></asp:Label></h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-10">
                        <!--Start First Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblShopName" runat="server" Text="Medical Name" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegCountry" runat="server" ErrorMessage="*" ValidationExpression="[a-zA-Z ]*$"
                                                ControlToValidate="txtShopName" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Characters" ValidationGroup="SaveMedicalShop"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtShopName" runat="server" class="form-control" placeholder="Shop Name"
                                            required></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="ShopTypeRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblShopType" runat="server" Text="Shop Type" class="control-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" ControlToValidate="ddlShopType"
                                                InitialValue="-1" SetFocusOnError="True" ToolTip="Please Select Shop Type" ValidationGroup="SaveMedicalShop"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlShopType" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--End Second Column-->
                        </div>
                        <!--End First Row-->
                        <!--Start of Second Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="OwnerNamerequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblOwnerName" runat="server" Text="Owner Name" class="control-label">
                                            <asp:RegularExpressionValidator ID="regOwnerName" runat="server" ErrorMessage="*"
                                                ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtOwnerName" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Characters"
                                                ValidationGroup="SaveMedicalShop"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtOwnerName" runat="server" class="form-control" placeholder="Owner Name"
                                            required></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End Of First Column-->
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="ContactRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblContactNo" runat="server" Text="Contact No" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegContactNo" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9]*$" ControlToValidate="txtContactNo" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="SaveMedicalShop"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder="Contact Number"
                                            required></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End of Second Column-->
                        </div>
                        <!--End Of Second Row-->
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
                        <asp:UpdatePanel ID="UpdatePanelTransporter" runat="server">
                            <ContentTemplate>
                                <!--Start of Third Row-->
                                <div class="row">
                                    <!--Start First column -->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="CountryRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblCountry" runat="server" Text="Country" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqCountry" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlCountry" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select Country" ValidationGroup="SaveMedicalShop"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End first Column-->
                                    <!--Start of Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="StateRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblState" runat="server" Text="State" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqState" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlState" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select State" ValidationGroup="SaveMedicalShop"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlState" runat="server" class="form-control" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End of Second Column-->
                                </div>
                                <!--End of Third Row-->
                                <!--Start of Fourth Row-->
                                <div class="row">
                                    <!--Start First column -->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="CityRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblCity" runat="server" Text="City" class="control-label">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" Font-Bold="True" ForeColor="Red" ControlToValidate="ddlCity"
                                                        InitialValue="-1" SetFocusOnError="True" ToolTip="Please Select City" ValidationGroup="SaveMedicalShop"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlCity" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End first Column-->
                                    <!--Start of Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="AreaRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblArea" runat="server" Text="Area" class="control-label">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                                        ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtArea" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Characters"
                                                        ValidationGroup="SaveMedicalShop"></asp:RegularExpressionValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtArea" runat="server" class="form-control" placeholder="Area"
                                                    required></asp:TextBox></div>
                                        </div>
                                    </div>
                                    <!--End of Second Column-->
                                </div>
                                <!--End of Fourth Row-->
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!--Start of Fifth Row-->
                        <div class="row">
                            <!--Start First Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="AddressRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblAddress" runat="server" Text="Address" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"
                                            required TextMode="MultiLine"></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End Of First Column-->
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="OpeningBalreq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblOpeningBalance" runat="server" Text="Opening Balance" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegOpeningBal" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9.]*$" ControlToValidate="txtOopenningBalance" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="SaveMedicalShop"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtOopenningBalance" runat="server" class="form-control" placeholder="Opening Balance"
                                            required></asp:TextBox></div>
                                </div>
                            </div>
                            <!--End of Second Column-->
                        </div>
                        <!--End of Fifth Row-->
                        <!--Start sixth Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success" ValidationGroup="SaveMedicalShop"
                                    OnClick="btnSave_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" class=" btn  btn-primary" OnClick="btnClear_Click" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger" OnClick="btnClose_Click" />
                            </div>
                        </div>
                        <!--End of sixth Row-->
                        <!--Start Grid View-->
                        <div class="row">
                            <asp:GridView ID="grvCountry" runat="server" AutoGenerateColumns="false" class="table"
                                HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                                HeaderStyle-BorderColor="#4596f1" AllowPaging="true">
                                <%--onpageindexchanging="grvCountry_PageIndexChanging"--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Country Name" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Eval("Country Name")%></ItemTemplate>
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
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
