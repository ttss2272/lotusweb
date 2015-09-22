<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="DoctorDetails.aspx.cs" Inherits="MedicalShopWeb.DoctorDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/css/DesignForm.css" rel="stylesheet" type="text/css" />
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

<div class="panel panel-default" align="center">
 
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="Doctor Details" class="control-label"></asp:Label></h3></div></div>
    <div class="panel-body">
   
 <div class="col-md-10">
   <!--Start First Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name" class="control-label">
            <asp:RegularExpressionValidator ID="RegCountry" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtDoctorName" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Characters" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtDoctorName" runat="server" class="form-control" placeholder="Doctor Name" required></asp:TextBox></div>
     </div> 
         </div>
          <!--End First Column-->
     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="SpecializationRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblSpecialization" runat="server" Text="Specialization" class="control-label">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtspecialz" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Enter Splecialization" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
        <asp:TextBox ID="txtspecialz" runat="server" class="form-control" placeholder="Specialization" required></asp:TextBox>
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
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlDOB" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Date of Birth" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlDOB" runat="server" class="form-control">
            </asp:DropDownList>
     </div> 
     </div>
     </div>
     <!--End Of First Column-->
     <!--Start of Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    
            <asp:Label ID="lblProductlist" runat="server" Text="Product List" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtProductlist" runat="server" class="form-control" TextMode="MultiLine" placeholder="Product List" required></asp:TextBox></div>
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
                ToolTip="Please Select Country" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" 
                AutoPostBack="True">
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
                ToolTip="Please Select State" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlState" runat="server" class="form-control" 
                AutoPostBack="True">
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
            <asp:RequiredFieldValidator ID="reqcity" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlCity" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select City" ValidationGroup="SaveDoctorDetails"></asp:RequiredFieldValidator>
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

    <asp:Label ID="MobileNoRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblArea" runat="server" Text="Mobile No" class="control-label">
            
             <asp:RegularExpressionValidator ID="RegOpeningBal" runat="server" ErrorMessage="*"   
             ValidationExpression="[0-9]*$" ControlToValidate="txtmobno" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtmobno" runat="server" class="form-control" placeholder="Mobile Number" required></asp:TextBox></div>
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

    <asp:Label ID="AreaRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblAddress" runat="server" Text="Area" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtArea" runat="server" class="form-control" placeholder="Area" required ></asp:TextBox></div>
     </div> 
     
     </div>
     <!--End Of First Column-->
     <!--Start of Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="AddressReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblAddreq" runat="server" Text="Address" class="control-label">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"   
             ValidationExpression="[a-zA-Z ]*$" ControlToValidate="txtAddress" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SaveDoctorDetails"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address" requied TextMode="MultiLine"></asp:TextBox></div>
     </div>
      </div>
      <!--End of Second Column-->
     </div>
    <!--End of Fifth Row-->
     <!--Start sixth Row-->
     <div class="row form-group">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-primary" 
                 ValidationGroup="SaveDoctorDetails"/>

        </div>
     </div>
     <!--End of sixth Row-->
     <!--Start Grid View-->

     <div class="row">
        <%--<%--<asp:GridView ID="grvCountry" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" ><%--onpageindexchanging="grvCountry_PageIndexChanging"--%>
<%--
         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Country Name")%></ItemTemplate>
            </asp:TemplateField>--%>

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
       <asp:Label ID="lblInfo" runat="server" Text="Madnatory Fields" ></asp:Label>
   </div>


</div>
</div>
</div>
</asp:Content>
