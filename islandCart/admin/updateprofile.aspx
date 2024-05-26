<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="updateprofile.aspx.cs" Inherits="islandCart.admin.updateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <ol class="breadcrumb mt-2 mb-3">
     <li class="breadcrumb-item">
         <a href="index.html">
             <span class="ti-home"></span>
         </a>
     </li>
     <li class="breadcrumb-item active">Update Profile</li>
 </ol>
     <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="widget-area-2 lorvens-box-shadow">
                 <h3 class="widget-title">Update Profile</h3>
                     <div class="lorvens-widget">

                         <div class="form-group row">
                             <div class="col-md-6">
                                  <label>First Name</label>
                                 <asp:TextBox runat="server" ID="txtFn" CssClass="form-control text-lowercase"   AutoCompleteType="Disabled"></asp:TextBox>
                             </div>
                              <div class="col-md-6">
                                    <label>Last Name</label>
                                   <asp:TextBox runat="server" ID="txtLn" CssClass="form-control text-lowercase"   AutoCompleteType="Disabled"></asp:TextBox>
                               </div>

                         </div>
                          <div class="form-group row">
                          <div class="col-md-6">
                               <label>User Name</label>
                              <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control text-lowercase"   AutoCompleteType="Disabled"></asp:TextBox>
                          </div>
                           <div class="col-md-6">
                                 <label>Email</label>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control text-lowercase"   AutoCompleteType="Disabled"></asp:TextBox>
                            </div>

                      </div>
                         
                         <div class="pt-3">
                             <asp:Button Text="Save Changes" runat="server" CssClass="btn btn-primary" ID="BtnSave" OnClick="BtnSave_Click"/>
                                <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />
                         </div>
                         


                     </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
