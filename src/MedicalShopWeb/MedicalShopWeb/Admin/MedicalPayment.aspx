﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="MedicalPayment.aspx.cs" Inherits="MedicalShopWeb.Admin.MedicalPayment" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Medical Payment Details" class="control-label label label-info"></asp:Label>
                        </h3>
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
                                        <asp:Label ID="lblInvoiceNo" runat="server" Text="Payment Invoice Number" class="control-label">             
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtInvoiceNo" runat="server" class="form-control" placeholder="Payment Invoice No"
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
                                        <asp:Label ID="PaymentDateRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblPaymentDate" runat="server" Text="Payment Date" class="control-label">
                                            
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
                            <!--End Second Column-->
                        </div>
                        <!--End First Row-->
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
                        <asp:UpdatePanel ID="UpdatePanelTransporter" runat="server">
                            <ContentTemplate>
                                <!--Start of Second Row-->
                                <div class="row">
                                    <!--Start First Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="MedicalShopRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblMedicalShop" runat="server" Text="MedicalShop Name" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqMedicalShop" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlMedicalShop" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select MedicalShop" ValidationGroup="SaveMedicalPaymentDetails"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlMedicalShop" runat="server" class="form-control" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlMedicalShop_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Of First Column-->
                                    <!--Start of Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="InvoiceNoRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblSaleInvoiceNo" runat="server" Text="Sale Invoice Number" class="control-label">
                                                    <asp:RequiredFieldValidator ID="ReqInvoiceNo" runat="server" ErrorMessage="*" Display="Dynamic"
                                                        Font-Bold="True" ForeColor="Red" ControlToValidate="ddlSaleInvoiceNo" InitialValue="-1"
                                                        SetFocusOnError="True" ToolTip="Please Select Sale Invoice No" ValidationGroup="SaveMedicalPaymentDetails"></asp:RequiredFieldValidator>
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlSaleInvoiceNo" runat="server" class="form-control" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlSaleInvoiceNo_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End of Second Column-->
                                </div>
                                <!--End Of Second Row-->
                                <!--Start of Third Row-->
                                <div class="row">
                                    <!--Start First column -->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="lblTotalAmo" runat="server" Text="Total Amount" class="control-label">             
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtTotalAmo" runat="server" class="form-control" placeholder="Total Amount"
                                                    required ReadOnly="True">
           
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End first Column-->
                                    <!--Start of Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="lblCurrentBal" runat="server" Text="Current Balance" class="control-label">             
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtCurrentBal" runat="server" class="form-control" placeholder="Current Balance"
                                                    required ReadOnly="True">
           
                                                </asp:TextBox>
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
                                                <asp:Label ID="lblPaidAmoReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                                <asp:Label ID="lblPaidAmo" runat="server" Text="Paid Amount" class="control-label">
                                                    <asp:RegularExpressionValidator ID="RegPaidAmo" runat="server" ErrorMessage="*" ValidationExpression="[0-9.]*$"
                                                        ControlToValidate="txtPaidAmo" Display="Dynamic" Font-Bold="True" ForeColor="Red"
                                                        SetFocusOnError="True" ToolTip="Enter Only Numbers" ValidationGroup="SaveMedicalPaymentDetails"></asp:RegularExpressionValidator>
                                                    <asp:CompareValidator ID="CmpAmt" runat="server" ForeColor="Red" ErrorMessage="*" Display="Dynamic" Font-Bold="True" Operator="LessThanEqual" SetFocusOnError="True" ToolTip="Paid Amount Must Be Less Than Current Balance" ValidationGroup="SaveMedicalPayment" Type="Double" CultureInvariantValues="True" ControlToValidate="txtPaidAmo" ControlToCompare="txtCurrentBal"></asp:CompareValidator>

                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtPaidAmo" runat="server" class="form-control" placeholder="Enter Paid Amount" AutoPostBack="true"
                                                    required OnTextChanged="txtPaidAmo_TextChanged">
           
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End first Column-->
                                    <!--Start of Second Column-->
                                    <div class="col-sm-6">
                                        <div class="row form-group">
                                            <div class="col-sm-4">
                                                <asp:Label ID="lblRemBal" runat="server" Text="Remaining Balance" class="control-label">             
                                                </asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtRemBal" runat="server" class="form-control" placeholder="Remaining Balance"
                                                    required ReadOnly="True">
           
                                                </asp:TextBox>
                                            </div>
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
                            <div class="col-sm-12">
                                <div class="row form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="CommentReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblComment" runat="server" Text="Comment" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtComment" runat="server" class="form-control" placeholder="Enter Comment"
                                            requied TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End of Fifth Row-->
                        <!--Start Seven Row-->
                        <div class="row form-group" align="center">
                            <div class="col-md-12">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg"
                                    ValidationGroup="SaveMedicalPaymentDetails" OnClick="btnSave_Click" />
                                <asp:LinkButton ID="lnkClear" runat="server" class="btn btn-lg btn-primary" OnClick="lnkClear_Click">Clear</asp:LinkButton>
                                <asp:LinkButton ID="lnkclose" runat="server" class="btn btn-lg btn-danger" OnClick="lnkclose_Click">Close</asp:LinkButton>
                                <asp:ValidationSummary runat="server" ShowMessageBox="true" ShowSummary="false" ID="validationSummary" />
                            </div>
                        </div>
                        <!--End of Seven Row-->
                    </div>
                </div>
                <div class="panel-footer" align="left">
                    <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblInfo" runat="server" Text="Mandatory Fields"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
