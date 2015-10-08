<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="DoctorPayment.aspx.cs" Inherits="MedicalShopWeb.Admin.DoctorPayment" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Doctor Payment Details" class="control-label label label-info"></asp:Label></h3>
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
                                        <asp:Label ID="lblReceiptNo" runat="server" Text="Receipt Number" class="control-label">
             
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtReceiptNo" runat="server" class="form-control" placeholder="Receipt Number"
                                            required ReadOnly="True">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End First Column-->
                            <!--Start Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="DrNameRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDrName" runat="server" Text="Doctor Name" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqDrName" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="ddlDrName" InitialValue="-1"
                                                SetFocusOnError="True" ToolTip="Please Select Doctor Name" ValidationGroup="SaveDoctorPayment"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlDrName" runat="server" class="form-control">
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
                                        <asp:Label ID="Daterequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Text="Paid Amount Date" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqDate" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="txtPaymentDate" InitialValue="-1"
                                                SetFocusOnError="True" ToolTip="Please Select Amount Paid Date" ValidationGroup="SaveDoctorPayment"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPaymentDate" runat="server" class="form-control" placeholder="Select Payment Date"
                                            required></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" BehaviorID="calBehavior" runat="server"
                                            TargetControlID="txtPaymentDate" Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                            <!--End Of First Column-->
                            <!--Start of Second Column-->
                            <div class="col-sm-6">
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="PaymentAmoRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblPaymentAmo" runat="server" Text="Payment Amount" class="control-label">
                                            <asp:RegularExpressionValidator ID="RegPaymentAmo" runat="server" ErrorMessage="*"
                                                ValidationExpression="[0-9.]*$" ControlToValidate="txtPaymentAmo" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Only Numbers"
                                                ValidationGroup="SaveDoctorPayment"></asp:RegularExpressionValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPaymentAmo" runat="server" class="form-control" placeholder="Payment Amount"
                                            MaxLength="10" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End of Second Column-->
                        </div>
                        <!--End of Second Row-->
                        <!--Start of third Row-->
                        <div class="row">
                            <!--Start First column -->
                            <div class="col-sm-12">
                                <div class="row form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="CommentRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblComment" runat="server" Text="Comment" class="control-label">
                                            <asp:RequiredFieldValidator ID="reqComment" runat="server" ErrorMessage="*" Display="Dynamic"
                                                Font-Bold="True" ForeColor="Red" ControlToValidate="txtComment" SetFocusOnError="True"
                                                ToolTip="Please Enter Comment" ValidationGroup="SaveDoctorPayment"></asp:RequiredFieldValidator>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtComment" runat="server" class="form-control" TextMode="MultiLine">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--End of third Row-->
                        </div>
                        <!--Start fourth Row-->
                        <div class="row form-group" align ="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" ValidationGroup="SaveDoctorPayment" />
                                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg" ValidationGroup="SaveDoctorPayment" />
                                <asp:ValidationSummary runat="server" ShowMessageBox="true" ShowSummary="false" ID="validationSummary" />
                            </div>
                        </div>
                        <!--End of fourth Row-->
                    </div>
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Mandatory Fields"></asp:Label>
                </div>
            </div>
        </div>
</asp:Content>
