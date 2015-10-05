<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="State.aspx.cs" Inherits="MedicalShopWeb.Admin.State" %>
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
        <asp:Label ID="lblPageHeading" runat="server" Text="State" class="control-label label label-info"></asp:Label></h3>
        </div>
        </div>
    <div class="panel-body">
    <div class="col-md-4"></div>
 <div class="col-md-4">  
    <!--Start First Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblCountryName" runat="server" Text="Country Name" class="control-label">
            <asp:RequiredFieldValidator ID="ReqCountry" runat="server" ErrorMessage="*" 
             ControlToValidate="ddlCountry" Display="Dynamic" Font-Bold="True" 
             ForeColor="Red" InitialValue="-1" SetFocusOnError="True" 
             ToolTip="Please Select Country" ValidationGroup="SaveState"></asp:RequiredFieldValidator>
            </asp:Label></div>
         
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlCountry" runat="server"  class="form-control">
            </asp:DropDownList>
            </div>
     </div> 
     <!--End Of First Row-->

     <!--Start of Second Row-->
     <div class="row form-group">
        <div class="col-sm-4">
    <asp:Label ID="lblStateRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblStateName" runat="server" Text="State Name" class="control-label">
            <asp:RegularExpressionValidator ID="RegState" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtStateName" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveState"></asp:RegularExpressionValidator>
            </asp:Label></div>
         
        <div class="col-sm-8">
            <asp:TextBox ID="txtStateName" runat="server" class="form-control" placeholder="State Name" required></asp:TextBox></div>
     </div> 
     <!--End of Second Row-->

     <!--Start Third Row-->
     <div class="row form-group" align="center">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" 
                onclick="btnSave_Click" ValidationGroup="SaveState"/>

                <asp:Button ID="btnClear" runat="server" Text="Clear" class=" btn btn-primary btn-lg" 
               />

                <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-danger btn-lg" 
                />

        </div>
     </div>
     <!--End of Third Row-->
     <!--Start Grid View-->

     <div class="row">
        <asp:GridView ID="grvState" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" onpageindexchanging="grvState_PageIndexChanging">

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Country Name")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("State Name")%></ItemTemplate>
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
        
     <div class="col-md-4"></div> 
     
</div>
   <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>

</div>
</div>
</div>
</asp:Content>
