﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchaseProduct.aspx.cs" Inherits="MedicalShopWeb.Admin.PurchaseProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntPlcLeft" runat="server">
    <script type="text/javascript">
    function myFunction() {

        {
            document.getElementById('1').style.visibility = 'hidden';
            document.getElementById('Div1').style.visibility = 'visible';
            
        }

    }
    function myFunction2() {
        document.getElementById('1').style.visibility = 'visible';
        document.getElementById('Div1').style.visibility = 'hidden';
        
    }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntPlcCenter" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManagerPurchaseProduct" runat="server"></asp:ToolkitScriptManager>
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
        
        <h3><asp:Label ID="lblPageHeading" runat="server" Text="Purchase Products" class="control-label label label-info"></asp:Label></h3>
        </div></div>
    <div class="panel-body">
        <div class="col-md-12">
        <fieldset id="ff">
        <!--Start Hindden row-->
       <div class="row" id="Div1">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    
            <asp:Label ID="Label2" runat="server" Text="Warehouse" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
    <asp:TextBox ID="txtWareName" runat="server" class="form-control"></asp:TextBox>
     </div> 
         </div>
         </div>
          <!--End First Column-->
     <!--Start Second Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    
            <asp:Label ID="lblSup" runat="server" Text="Supplier" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
           
            <asp:TextBox ID="txtSupName" runat="server" class="form-control"></asp:TextBox>
                 </div> 
         </div>
         </div>
     
     <!--End Second Column-->
      </div>
       <!--End hidden row-->
             <!--Start First Row-->
    <div class="row" id="1">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblWarehouse" runat="server" Text="Warehouse" class="control-label">
            <asp:RequiredFieldValidator ID="WarehouseReq" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlWarehouse" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Warehouse" ValidationGroup="SavePurchaseProduct"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlWarehouse" runat="server" class="form-control">
            </asp:DropDownList>
     </div> 
         </div>
         </div>
          <!--End First Column-->
     <!--Start Second Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqSupplier" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblSupplier" runat="server" Text="Supplier" class="control-label">
            <asp:RequiredFieldValidator ID="ReqSupplier" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlSupplier" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Supplier" ValidationGroup="SavePurchaseProduct"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control">
            </asp:DropDownList>
     </div> 
         </div>
         </div>
     
     <!--End Second Column-->
      </div>
       <!--End First Row-->
       
       <!--Start Second Row-->
    <div class="row" id="2">

    
    <!--Start First Column-->
        <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="DateRequired" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblPurchaseDate" runat="server" Text="Purchase Date" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtPurchaseDate" runat="server" class="form-control" placeholder="DD/MM/YYYY" required></asp:TextBox></div>
            <asp:CalendarExtender ID="CalendarExtenderPurchaseDate" runat="server" TargetControlID="txtPurchaseDate" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
     </div>
      </div>     
          <!--End First Column-->

     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="ReqSuppReciept" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblSupplierRecipt" runat="server" Text="Receipt No" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtReceiptNo" runat="server" class="form-control" placeholder="Receipt Number" required></asp:TextBox></div>
     </div>
      </div>
     
     <!--End Second Column-->
      </div>
       <!--End Second Row-->
       </fieldset>
        <!--Start Third Row-->
    <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqModeOFpay" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblModeOfPayment" runat="server" Text="Mode Of Payment" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtModeOfPayment" runat="server" class="form-control" placeholder="Mode Of Payment" required></asp:TextBox>
     </div> 
         </div>
         </div>
          <!--End First Column-->

     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqBatchNo" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblBatchNo" runat="server" Text="Batch No" class="control-label">
            
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtBatchNo" runat="server" class="form-control" placeholder="Batch Number" required></asp:TextBox></div>
     </div>
      </div>
     
     <!--End Second Column-->
      </div>
       <!--End Third Row-->

       <!--Start Fourth Row-->
       <asp:UpdatePanel runat="server" ID="UpdatePanelProductType">
       <ContentTemplate>
       <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqProductType" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblProductType" runat="server" Text="Product Type" class="control-label">
            <asp:RequiredFieldValidator ID="ReqProductType" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlProductType" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select ProductType" ValidationGroup="SavePurchaseProduct"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlProductType" runat="server" class="form-control" 
                onselectedindexchanged="ddlProductType_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
     </div> 
         </div>
         </div>
          <!--End First Column-->

     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqProduct" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblProduct" runat="server" Text="Product" class="control-label">
            <asp:RequiredFieldValidator ID="ReqProduct" runat="server" 
                ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                ControlToValidate="ddlProduct" InitialValue="-1" SetFocusOnError="True" 
                ToolTip="Please Select Product" ValidationGroup="SavePurchaseProduct"></asp:RequiredFieldValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" AutoPostBack="true" 
                onselectedindexchanged="ddlProduct_SelectedIndexChanged">
            </asp:DropDownList>
     </div> 
         </div>
      </div>
     
     <!--End Second Column-->
      </div>
      
       <!--End Fourth Row-->

       <!--Start Fifth Row-->
       <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqPurchasePrice" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblPurchasePrice" runat="server" Text="Purchase Price" class="control-label">
            <asp:RegularExpressionValidator ID="RegPurchasePrice" runat="server" ErrorMessage="*"   
             ValidationExpression="[0-9.]*$" ControlToValidate="txtPurchasePrice" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SavePurchaseProduct"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtPurchasePrice" runat="server" class="form-control" placeholder="Purchase Price" required></asp:TextBox>
     </div> 
         </div>
         </div>
          <!--End First Column-->

     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqSaleingPrice" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblSellingPrice" runat="server" Text="Selling Price" class="control-label">
            <asp:RegularExpressionValidator ID="RegSellingPrice" runat="server" ErrorMessage="*"   
             ValidationExpression="[0-9.]*$" ControlToValidate="txtSellingPrice" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SavePurchaseProduct"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtSellingPrice" runat="server" class="form-control" placeholder="Selling Price" required></asp:TextBox></div>
     </div>
      </div>
     
     <!--End Second Column-->
      </div>
      </ContentTemplate>
       </asp:UpdatePanel>
       <!--End Fifth Row-->

       <!--Start Sixth Row-->
       <div class="row">
    <!--Start First Column-->
         <div class="col-sm-6">
         <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="ReqQuantity" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblQuantity" runat="server" Text="Purchase Quantity" class="control-label">
            <asp:RegularExpressionValidator ID="RegQuantity" runat="server" ErrorMessage="*"   
             ValidationExpression="[0-9]*$" ControlToValidate="txtQuantity" 
             Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
             ToolTip="Enter Only Numbers" ValidationGroup="SavePurchaseProduct"></asp:RegularExpressionValidator>
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtQuantity" runat="server" class="form-control" 
                placeholder="Quantity" required ></asp:TextBox>
     </div> 
         </div>
         </div>
          <!--End First Column-->

     <!--Start Second Column-->
         <div class="col-sm-6">
      <div class="row form-group">
        <div class="col-sm-4">

    <asp:Label ID="lblReqExpirydate" runat="server" Text="*" ForeColor="Red" class="control-label"></asp:Label>
            <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date" class="control-label">
              <asp:CompareValidator ID="CompDate" runat="server" ErrorMessage="*" ControlToCompare="txtPurchaseDate" ControlToValidate="txtExpiryDate" CultureInvariantValues="True" Display="Dynamic" Font-Bold="True" SetFocusOnError="True" Type="Date" Operator="GreaterThan" ToolTip="Expiry Date Must be Greater Than Purchase Date" ForeColor="Red"></asp:CompareValidator>  
            </asp:Label>
            
          
            <%--<asp:CompareValidator ID="CompareExpriyDate" runat="server" ErrorMessage="*" SetFocusOnError="True" Operator="GreaterThan" Font-Bold="True" ToolTip="Expiry Date Must Be Greater than Current Date" Type="Date" ValidationGroup="SavePurchaseProduct" ControlToValidate="txtExpiryDate"></asp:CompareValidator>--%>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtExpiryDate" runat="server" class="form-control" placeholder="DD/MM/YYYY" required></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtenderExpiryDate" runat="server" TargetControlID="txtExpiryDate" TodaysDateFormat="dd/MM/yyyy" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
         </div>
     </div>
      </div>
     
     <!--End Second Column-->
      </div>
       <!--End of Sixth Row-->

        <!--Start Seventh Row-->
       <div class="row">
   
       <!--Start Eighth Row-->
       <div class="row form-group" align="center">
        <div class="col-md-12">
            <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-lg btn-primary" 
                 ValidationGroup="SavePurchaseProduct" onclick="btnAdd_Click"/>
                 

        </div>
     </div>
       <!--End Eighth Row-->

       <!--Bind Gridview-->
       <div class="row">
       <div class="col-sm-1"></div>
       <div class="col-sm-10">
        <asp:GridView ID="grvPurhaseProduct" runat="server" AutoGenerateColumns="false" class="table" HeaderStyle-BackColor="#4596f1"
         HeaderStyle-ForeColor="White"  BorderColor="White"  HeaderStyle-BorderColor="#4596f1" AllowPaging="true" ><%--onpageindexchanging="grvCountry_PageIndexChanging"--%>

         <Columns>
            <asp:TemplateField HeaderText="Sr.No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("ProductName")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batch No" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("BatchNo")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("Quantity")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Purchase Price" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate><%#Eval("PurchaseRate")%></ItemTemplate>
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
        <div class="col-sm-1"></div>
     </div>
       <!--End Of GridView-->

       <!--Start Total Column-->
         <div class="col-sm-6 col-md-offset-6">
         <div class="row form-group">
        <div class="col-sm-4">

    
            <asp:Label ID="lblTotal" runat="server" Text="Total" class="control-label">
           
            </asp:Label>
            
            </div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtTotal" runat="server" class="form-control" ReadOnly ="true" placeholder="Total" required></asp:TextBox>
     </div> 
         </div>
         </div>
         <!--End Total Column-->
       <!--Start Ninth Row-->
      <div class="row form-group" align="center">
        <div class="col-md-12">
            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-lg btn-success" onclick="btnSave_Click">Save</asp:LinkButton>
            <%--<asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-lg btn-success" 
                  onclick="btnSave_Click"/>--%>
                 <asp:Button ID="BtnCancel" runat="server" Text="Cancel" class="btn btn-lg btn-danger" 
                  onclick="BtnCancel_Click"/>

                 

        </div>
     </div>
       <!--End Ninth Row-->


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
