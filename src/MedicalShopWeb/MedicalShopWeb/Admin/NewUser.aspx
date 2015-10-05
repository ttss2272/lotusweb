<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="MedicalShopWeb.Admin.NewUser" %>
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

<div class="panel panel-default" >
 
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="User" class="control-label label label-info"></asp:Label></h3>
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
            <asp:Label ID="lblUserName" runat="server" Text="User Name" class="control-label">
            <asp:RegularExpressionValidator ID="RegUserName" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtUserName" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveUser"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="User Name" required></asp:TextBox></div>
     </div> 
         </div>
          <!--End First Column-->
     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="UserTypeRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblUserType" runat="server" Text="User Type" class="control-label">
            <asp:RequiredFieldValidator ID="ReqUserType" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlUserType" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select User Type" ValidationGroup="SaveUser"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlUserType" runat="server" class="form-control">
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

    <asp:Label ID="Emailrequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Text="Email Address" class="control-label">
            <asp:RegularExpressionValidator ID="RegEmail" runat="server" ErrorMessage="*" 
                ControlToValidate="txtEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="SaveUser" ToolTip= "Enter Proper EmailID"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email Address" required></asp:TextBox></div>
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
             ValidationExpression="[0-9]*$" ControlToValidate="txtContactNo" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SaveUser"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder="Contact Number" required></asp:TextBox></div>
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
            <asp:RequiredFieldValidator ID="ReqCountry" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlCountry" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Country" ValidationGroup="SaveUser"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" 
                AutoPostBack="True" onselectedindexchanged="ddlCountry_SelectedIndexChanged">
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
            <asp:RequiredFieldValidator ID="ReqState" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlState" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select State" ValidationGroup="SaveUser"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlState" runat="server" class="form-control" 
                AutoPostBack="True" onselectedindexchanged="ddlState_SelectedIndexChanged">
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
            <asp:RequiredFieldValidator ID="ReqCity" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlCity" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select City" ValidationGroup="SaveUser"></asp:RequiredFieldValidator>
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
            <asp:RegularExpressionValidator ID="RegArea" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtArea" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveUser"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtArea" runat="server" class="form-control" placeholder="Area" required></asp:TextBox></div>
     </div>
      </div>
     <!--End of Second Column-->

    </div>
    <!--End of Fourth Row-->
    </ContentTemplate></asp:UpdatePanel>
    
    
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
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address" required TextMode="MultiLine"></asp:TextBox></div>
     </div> 
     
     </div>
     <!--End Of First Column-->
     <!--Start of Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="WarehouseReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse" class="control-label">
            <asp:RequiredFieldValidator ID="ReqWarehouse" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlWarehouse" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Warehouse" ValidationGroup="SaveUser"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
        <asp:DropDownList ID="ddlWarehouse" runat="server" class="form-control">
            </asp:DropDownList>
            </div>
     </div>
      </div>
      <!--End of Second Column-->
     </div>
    <!--End of Fifth Row-->

    <!--Start of Sixth Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
    
     <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="LoginRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblLogin" runat="server" Text="Login Name" class="control-label">
            
            </asp:Label>

            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtLoginName" runat="server" class="form-control" AutoPostBack="true"
                placeholder="Login Name" required ontextchanged="txtLoginName_TextChanged"></asp:TextBox></div>
     </div> 
     
     </div>
     
     <!--End Of First Column-->
     <!--Start of Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="PasswordRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblPassword" runat="server" Text="Password" class="control-label">
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" 
                placeholder="Password" required TextMode="Password"></asp:TextBox></div>
          <asp:PasswordStrength ID="pwStrenth" runat="server" HelpHandlePosition="RightSide" RequiresUpperAndLowerCaseCharacters="True" TargetControlID="txtPassword">
          </asp:PasswordStrength>
     </div>
      </div>
      <!--End of Second Column-->
     </div>
    <!--End of Sixth Row-->

    <!--Start of Seventh Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
    
     <div class="row form-group">
       
       <div class="col-sm-4"></div>
       <div class="col-sm-8">
    <asp:Label ID="lblAvailable" runat="server" Text=""  class="control-label"></asp:Label>
            </div>
            </div>
     </div>
     <!--End Of First Column-->
     <!--Start of Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="ReqConfirmPassword" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblConfirmedPassword" runat="server" Text="Re-Type Password" class="control-label" >
            <asp:CompareValidator ID="CompPassword" runat="server" ErrorMessage="*" 
                Font-Bold="True" ToolTip="Password Should Be Same" ValidationGroup="SaveUser" 
                ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" 
                Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" 
                placeholder="Password" required TextMode="Password" ControlToValidate="txtConfirmPassword"></asp:TextBox></div>
     </div>
      </div>
      <!--End of Second Column-->
     </div>
    <!--End Of Seventh Row-->

     <!--Start Eighth Row-->
     <div class="row form-group" align="center">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-success btn-lg" 
                 ValidationGroup="SaveUser" onclick="btnSave_Click"/>


                 <asp:Button ID="btnClose" runat="server" Text="Close" 
                class=" btn btn-danger btn-lg"  />

        </div>
     </div>
     <!--End of Eighth Row-->
     <!--Start Grid View-->

     

     <!--End Grid View-->
    
        
   
     
</div>
</div>
   <div class="panel-footer" align="left">
       <asp:Label ID="lblRquirdInfo" runat="server" Text="*" ForeColor="Red"></asp:Label>
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>


</div>
</div>
</div>

</asp:Content>
