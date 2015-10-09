<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="MedicalShopWeb.Supplier" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Supplier Details" class="control-label label label-info"></asp:Label></h3>
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
                                        <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblCompanyName" runat="server" Text="Company Name" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtcompanyName" runat="server" class="form-control" placeholder="Enter Company Name"
                                            required />
                                    </div>
                                </div>
                                <!--End First Column-->
                            </div>
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblSupplierName" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDOB" runat="server" Text="Supplier Name" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegCountry" runat="server" ErrorMessage="*" ValidationExpression="[a-zA-Z ]*$"
                                                ControlToValidate="txtSupplierName" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Characters" ValidationGroup="SaveSupplierDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtSupplierName" runat="server" class="form-control" placeholder="Enter Supplier Name"
                                            required />
                                    </div>
                                </div>
                            </div>
                            <!--End Of Second Column-->
                        </div>
                        <!--End First Row-->
                        <!--Start Second Row-->
                        <div class="row">
                            <!--Start First column -->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="Contactrequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblContactNo" runat="server" Text="Contact Number" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegCont" runat="server" ErrorMessage="*" ValidationExpression="[0-9]*$"
                                                ControlToValidate="txtContactNo" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Numbers" ValidationGroup="SaveSupplierDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder="Enter Contact Number"
                                            required MaxLength="10" />
                                    </div>
                                </div>
                            </div>
                            <!--End first Column-->
                            <!--Start of Second Row-->
                            <div class="col-sm-6">
                            <div class="row form-group">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblReqOpeningBal" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                    <asp:Label ID="lblOpeningBalance" runat="server" Text="Opening Balance" class="control-label">
                                     <asp:RegularExpressionValidator ID="RegOpeingBal" runat="server" ErrorMessage="*" ValidationExpression="[0-9.]*$"
                                                ControlToValidate="txtOpeningBalance" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Numbers" ValidationGroup="SaveSupplierDetails"></asp:RegularExpressionValidator>
                                    </asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtOpeningBalance" runat="server" class="form-control" placeholder="Opening Balance"
                                            required />
                                </div>
                            </div>
                        </div>


                            
                            <!--End Second Column-->
                        </div>
                        <!--End of Second Row-->
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
                        <asp:UpdatePanel ID="UpdatePanelTransporter" runat="server">
                            <ContentTemplate>
                                <!--Start of Third Row-->
                                <div class="row">
                                    <!--Start First Column-->
                                    <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="CountryRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblCountry" runat="server" Text="Country" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqCountry" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="ddlCountry" InitialValue="-1"
                                                SetFocusOnError="True" ToolTip="Please Select Country" ValidationGroup="SaveSupplierDetails"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                                    
                                    <!--Start Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="StateRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblState" runat="server" Text="State" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqState" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlState" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select State" ValidationGroup="SaveSupplierDetails"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlState" runat="server" class="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    
                        <!--End Second Column-->
                    </div>
                    <div class="row">
                        <!--Start Forth row-->

                        <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="CityRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblCity" runat="server" Text="City" class="control-label">
                                                    <asp:RequiredFieldValidator ID="reqcity" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlCity" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select City" ValidationGroup="SaveSupplierDetails"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlCity" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                           
                        
                        <!--End First Column-->
                        <!--Start Second Column-->
                        <div class="col-sm-6">
                            <div class="row form-group">
                                <div class="col-sm-4">
                                    <asp:Label ID="AreaRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                    <asp:Label ID="lblArea" runat="server" Text="Area" class="control-label">
                                    </asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtArea" runat="server" class="form-control" placeholder="Area"
                                        required></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        

                        
                        <!--End Of Second Column-->
                    </div>
                                         </ContentTemplate>
                        </asp:UpdatePanel>

                    <!--End of Fourth Row-->

                    <!--Start Fifth Row-->
                    <div class="row">
                        <!--Start First Column-->
                        <div class="col-sm-12">
                            <div class="row form-group">
                                <div class="col-sm-2">
                                    <asp:Label ID="AddressReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                    <asp:Label ID="lblAddreq" runat="server" Text="Address" class="control-label">
                                        
                                    </asp:Label>
                                </div>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"
                                        requied TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!--End Of First Column-->
                        
                    </div>
                    <!--End Fifth Row-->

                    <!--Start of Sixth Row-->
                    <div class="row">
                        <!--Start First Column-->
                        <div class="col-sm-6">
                            <div class="row form-group">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblRequredModeOfTransport" runat="server" Text="*" ForeColor="Red"
                                        class="control-label"></asp:Label>
                                    <asp:Label ID="lblModeOfTransport" runat="server" Text="Mode of Transport" class="control-label">
                                        <asp:RequiredFieldValidator ID="ReqValModeOfTransport" runat="server" ErrorMessage="*"
                                            Display="Dynamic" Font-Bold="True" ForeColor="Red" ControlToValidate="ddModeOfTransport"
                                            InitialValue="Select Mode Of Transport" SetFocusOnError="True" ToolTip="Please Select Mode of Transport"
                                            ValidationGroup="SaveSupplierDetails"></asp:RequiredFieldValidator>
                                    </asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddModeOfTransport" runat="server" class="form-control">
                                        <asp:ListItem>Select Mode Of Transport</asp:ListItem>
                                        <asp:ListItem>By Air</asp:ListItem>
                                        <asp:ListItem>By Sea</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!--End Of First Column-->
                        <!--Start of Second Column-->
                        <div class="col-sm-6">
                            <div class="row form-group">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-8">
                                    <asp:Label ID="lblReqcif" runat="server" Text="*" ForeColor="Red" class="control-label">
             
                                    </asp:Label>
                                    <asp:RadioButton ID="rbtnCIF" runat="server" Text="CIF" GroupName="CIFFOB" class="control-label"
                                        Checked="true" />
                                    <asp:RadioButton ID="rbtnFOB" runat="server" Text="FOB" GroupName="CIFFOB" class="control-label" />
                                </div>
                            </div>
                        </div>
                        <!--End Of Second Column-->
                    </div>
                    <!--End of Sixth Row-->
                    

                    <!--Start Seventh Row-->
                    <div class="row form-group" align="center">
                        <div class="col-md-12">
                            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" ValidationGroup="SaveSupplierDetails"
                                OnClick="btnSave_Click1" />
                            <asp:LinkButton ID="lnkbtnClear" runat="server" class=" btn btn-primary btn-lg">Clear</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnClose" runat="server" class=" btn btn-danger btn-lg">Close</asp:LinkButton>
                            
                        </div>
                    </div>
                    <!--End of Seventh Row-->
                    <!--Start Grid View-->
                    <div class="row">
                        <asp:GridView ID="grvProductDetails" runat="server" AutoGenerateColumns="false" class="table"
                            HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                            HeaderStyle-BorderColor="#4596f1" AllowPaging="true">
                            <%--onpageindexchanging="grvCountry_PageIndexChanging"--%>
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Doctor Name" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Eval("Product Type")%></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/Products.aspx?ProductID={0}", DataBinder.Eval(Container.DataItem,"ProductID") )%>'>
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <!--End Grid View-->
                </div>
            </div>
            <div class="panel-footer" align="left">
                <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                <asp:HiddenField ID="hdnSupplierID" runat="server" />
                <asp:HiddenField ID="hdnIsDelete" runat="server" />
            </div>
        </div>
    </div>
    </div>
</asp:Content>
