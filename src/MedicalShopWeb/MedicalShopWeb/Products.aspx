<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MedicalShopWeb.Products" %>
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

<div class="panel panel-default" align="center">
 
    <div class="panel-header" align="left">
    <div class="col-xs-12">
        
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="Products Details" class="control-label"></asp:Label></h3>
        </div></div>
    <div class="panel-body">
   
 <div class="col-md-10">
   <!--Start First Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblProductType" runat="server" Text="Product Type" class="control-label">
            <asp:RequiredFieldValidator ID="ReqValProductType" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddproductType" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Product Type" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddproductType" runat="server" class="form-control" 
                AutoPostBack="True">
            </asp:DropDownList>
     </div> 
         </div>
          <!--End First Column-->
      </div>
       <!--End First Row-->
       </div>
    <!--Start of Second Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
    
     <div class="row form-group">
        <div class="col-sm-4">

           <asp:Label ID="lblProductName" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblDOB" runat="server" Text="Product Name" class="control-label">
             <asp:RequiredFieldValidator ID="ReqValidPrductName" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtProductName" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Enter Product Name" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
        <asp:TextBox ID="txtProductName" runat="server" class="form-control" placeholder="Enter Product Name" required />
        </div> 
     </div>
     </div>
     <!--End Of First Column-->
   </div>
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

    <asp:Label ID="CodeRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblCode" runat="server" Text="Code" class="control-label">
            <asp:RequiredFieldValidator ID="ReqCode" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtCode" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Country" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtCode" runat="server" class="form-control" placeholder="Enter Code" required />
     </div>
      </div>
     </div>
     <!--End first Column-->
    
     </div>
    <!--End of Third Row-->

    <!--Start of Fourth Row-->
    <div class="row">
    <!--Start First column -->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="BatchRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblBatch" runat="server" Text="Batch" class="control-label">
            <asp:RequiredFieldValidator ID="reqbatch" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtbatch" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Enter Batch No" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtbatch" runat="server" class="form-control" placeholder="Enter Batch" required />
     </div>
      </div>
     </div>
     
     <!--End first Column-->
    
    </div>
    <!--End of Fourth Row-->
    </ContentTemplate></asp:UpdatePanel>
    <!--Start of Fifth Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
    
     <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="PurchaseRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblAddress" runat="server" Text="Purchase Price" class="control-label">
            <asp:RequiredFieldValidator ID="ReqValPurchasePrice" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtPurchasePrice" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Enter Pruchase Price" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtPurchasePrice" runat="server" class="form-control" placeholder="Enter Purchase Price" required ></asp:TextBox></div>
     </div> 
     
     </div>
     <!--End Of First Column-->
     </div>
    <!--End of Fifth Row-->

    <!--Start of Six Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
    
     <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblSalePriceReq" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblSalePrice" runat="server" Text="Sale Price" class="control-label">
            <asp:RequiredFieldValidator ID="ReqValSaleprice" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="txtSalePrice" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Enter Sale Price" ValidationGroup="SaveProductDetails"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtSalePrice" runat="server" class="form-control" placeholder="Enter Sale Price" required ></asp:TextBox></div>
     </div> 
     
     </div>
     <!--End Of First Column-->
     </div>
    <!--End of Six Row-->
     <!--Start Seven Row-->
     <div class="row form-group">
        <div class="col-md-12">
            <asp:Button ID="btnSave" runat="server" Text="Save" class=" btn btn-primary" 
                 ValidationGroup="SaveProductDetails"/>
                 
                 <asp:Button ID="btnClose" runat="server" Text="Close" class=" btn btn-primary" 
                 ValidationGroup="SaveProductDetails"/>

        </div>
     </div>
     <!--End of Seven Row-->
     <!--Start Grid View-->

     <div class="row">
        <asp:GridView ID="grvProductDetails" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" ><%--onpageindexchanging="grvCountry_PageIndexChanging"--%>

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Doctor Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Product Type")%></ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate >
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
