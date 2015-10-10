<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="MedicalShopWeb.Admin.DoctorDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function setYearRange() {
            $find("calBehavior").set_selectedDate(new Date(1990, 1, 1));

        }
   
    </script>
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
            <div class="panel panel-default" >
                <div class="panel-header" align="left">
                    <div class="col-xs-12">
                        <h3>
                            <asp:Label ID="lblPageHeading" runat="server" Text="Doctor Details" class="control-label label label-info"></asp:Label></h3>
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
                                        <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegCountry" runat="server" ErrorMessage="*" ValidationExpression="[a-zA-Z ]*$"
                                                ControlToValidate="txtDoctorName" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Characters" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtDoctorName" runat="server" class="form-control" placeholder="Doctor Name"
                                            required>
           
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="SpecializationRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblSpecialization" runat="server" Text="Specialization" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegSpecilaz" runat="server" ErrorMessage="*" ValidationExpression="[a-zA-Z ]*$"
                                                ControlToValidate="txtspecialz" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Characters" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtspecialz" runat="server" class="form-control" placeholder="Specialization"
                                            required></asp:TextBox>
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
                                        <asp:Label ID="DOBrequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDOB" runat="server" Text="DOB" class="control-label">
                                           
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtDOB" runat="server" class="form-control" placeholder="Select Date of Birth"
                                            required></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="calBehavior" runat="server"
                                            TargetControlID="txtDOB" Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                            <!--End Of First Column-->
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="MobileNoRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblMobNo" runat="server" Text="Mobile No" class="control-label">
                                             <asp:RegularExpressionValidator ID="RegOpeningBal" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9]*$" ControlToValidate="txtmobno" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtmobno" runat="server" class="form-control" placeholder="Mobile Number"
                                            MaxLength="10" required></asp:TextBox>
                                    </div>
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
                                                        SetFocusOnError="True" ToolTip="Please Select Country" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
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
                                                        SetFocusOnError="True" ToolTip="Please Select State" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="reqcity" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlCity" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select City" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
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
                                                <asp:Label ID="lblArea1" runat="server" Text="Area" class="control-label">
            
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
                                        <asp:Label ID="AddressReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblAddreq" runat="server" Text="Address" class="control-label">
                                            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"
                                            requied TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End Of First Column-->
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="OprningBalanceReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblOpenBal" runat="server" Text="Opening Balance" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegOpenBal" runat="server" ErrorMessage="*" ValidationExpression="[0-9.-]*$"
                                                ControlToValidate="txtOpeningBalance" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ToolTip="Enter Only Number" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtOpeningBalance" runat="server" class="form-control" placeholder="Opening Balance"
                                            requied></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End of Second Column-->
                        </div>
                        <!--End of Fifth Row-->
                        <!--Start Seven Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg"
                                    ValidationGroup="SaveDoctorDetails" OnClick="btnSave_Click1" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" class=" btn  btn-primary btn-lg"
                                    OnClick="btnClear_Click" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg"
                                    ValidationGroup="SaveDoctorDetails" OnClick="btnClose_Click" />
                            </div>
                        </div>
                        <!--End of Seven Row-->
                    </div>
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields"></asp:Label>
                </div>
            </div>
        </div>
        <!--Start Grid View-->
        <div class="row">
            <asp:GridView ID="grvDoctorDetails" runat="server" AutoGenerateColumns="false">
                <%--onpageindexchanging="grvCountry_PageIndexChanging"--%>
                <Columns>
                    <%--<asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Doctor Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("DoctorName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Specialization" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Specialization")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DOB" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("DOB")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City ID" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("CityID")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Area")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("MobileNo")%></ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Address")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Opening Balance" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("OpeningBalance")%></ItemTemplate>
            </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                             <asp:HyperLink ID="HyperLinkEdit" runat="server" Text="Edit" NavigateUrl='<%#String.Format("../Admin/DoctorDetails.aspx?DoctorID={0}", DataBinder.Eval(Container.DataItem,"DoctorID") )%>'>
                              </asp:HyperLink>
                    </ItemTemplate>--%>
                    <%-- </asp:TemplateField>--%>
                    <asp:CommandField ShowEditButton="true" />
                </Columns>
            </asp:GridView>
        </div>
        <!--End Grid View-->
    </div>
</asp:Content>
