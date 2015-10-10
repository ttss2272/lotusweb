<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="MedicalStock.aspx.cs" Inherits="MedicalShopWeb.Admin.MedicalStock" %>

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
                            <asp:Label ID="lblPageHeading" runat="server" Text="Medical Stock" class="control-label label label-info"></asp:Label></h3>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <asp:UpdatePanel ID="UpdatePanelMedicalStock" runat="server">
                            <ContentTemplate>
                                <!--Start First Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblMedical" runat="server" Text="Medical" class="control-label">
                                            <asp:RequiredFieldValidator ID="ReqMeidcal" runat="server" ErrorMessage="*" ControlToValidate="ddlMedical"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Medical" ValidationGroup="SaveMedicalStock"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlMedical" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlMedical_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!--End Of First Row-->
                                <!--Start Second Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblProductReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblProduct" runat="server" Text="Product" class="control-label">
                                            <asp:RequiredFieldValidator ID="ProductReq" runat="server" ErrorMessage="*" ControlToValidate="ddlMedical"
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"
                                                ToolTip="Please Select Product" ValidationGroup="SaveMedicalStock"></asp:RequiredFieldValidator>
                                        </asp:Label></div>
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
                                        <asp:Label ID="lblPrevStock" runat="server" Text="Stock" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPrevStock" runat="server" class="form-control" placeholder="Stock"
                                            ReadOnly></asp:TextBox>
                                    </div>
                                </div>
                                <!--End Of Third Row-->
                                <!--Start Fourth Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblLastDate" runat="server" Text="Last Stock Date" class="control-label">
            
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtLastDate" runat="server" class="form-control" placeholder="DD/MM/YYYY" ReadOnly></asp:TextBox>
                                    </div>
                                </div>
                                <!--End Of Fourth Row-->
                                <!--Start Fifth Row-->
                                <div class="row form-group">
                                <div class="col-sm-4">
                                            <asp:Label ID="lblCurrentStockReq" runat="server" class="control-label" 
                                                ForeColor="Red" Text="*"></asp:Label>
                                            <asp:Label ID="lblCurrentStock" runat="server" class="control-label" Text="Curent Stock">
                                            <asp:RegularExpressionValidator ID="RegCurrentStock" runat="server" ErrorMessage="*"   
             ValidationExpression="[0-9.]*$" ControlToValidate="txtCurrentStock" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SaveMedicalStock"></asp:RegularExpressionValidator>
            
                                        </asp:Label>
                                        </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtCurrentStock" runat="server" class="form-control" placeholder=" Current Stock"
                                            required></asp:TextBox>
                                    </div>
                                </div>
                                <!--End Of Fifth Row-->
                                <!--Start Sixth Row-->
                                <div class="row form-group">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblDateReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Text="Stock Date" class="control-label">
                                            <asp:CompareValidator ID="CompDate" runat="server" ErrorMessage="*" ControlToCompare="txtLastDate" ControlToValidate="txtDate" CultureInvariantValues="True" Display="Dynamic" Font-Bold="True" SetFocusOnError="True" Type="Date" Operator="GreaterThan" ToolTip="Date Must be Greater Than Privious Stock Date" ForeColor="Red"></asp:CompareValidator>  
                                        </asp:Label>
                                        
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtDate" runat="server" class="form-control" placeholder="DD/MM/YYYY"
                                            required></asp:TextBox><asp:CalendarExtender ID="calExtDate" runat="server" Animated="true"
                                                Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyyy" TargetControlID="txtDate">
                                            </asp:CalendarExtender>
                                    </div>
                                </div>
                                <!--End Of Sixth Row-->
                                <!--Start Seventh Row-->
                                <div class="row form-group" align="center">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg"
                                            OnClick="btnSave_Click" ValidationGroup="SaveMedicalStock"/>
                                        
                                        <asp:LinkButton ID="lnkbtnClear" runat="server" OnClick="btnClear_Click" class=" btn btn-primary btn-lg">Clear</asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnClose" runat="server" OnClick="btnClose_Click" class=" btn btn-danger btn-lg">Close</asp:LinkButton>
                                    </div>
                                </div>
                                <!--End of Seventh Row-->
                                <!--Start Eighth Row-->
                                <div class="panel-body">
                                    <!--Start Grid View-->
                                    <div class="row">
                                        <asp:GridView ID="grvMedicalStock" runat="server" AutoGenerateColumns="false" class="table"
                                            HeaderStyle-BackColor="#4596f1" HeaderStyle-ForeColor="White" BorderColor="White"
                                            HeaderStyle-BorderColor="#4596f1" AllowPaging="true" OnPageIndexChanging="grvMedicalStock_PageIndexChanging">
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
                                                <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%#Eval("StockEntryDate")%></ItemTemplate>
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
                                <!--End Eighth Row-->
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
