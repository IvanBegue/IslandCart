<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="createuser.aspx.cs" Inherits="islandCart.admin.createuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
        <li class="breadcrumb-item">
            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Create User</li>
    </ol>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">
                    <h3 class="widget-title">Create New User</h3>
                        <div class="lorvens-widget">

                            <div class="form-group row">
                                <div class="col-md-6">
                                     <label>First Name</label>
                                    <asp:TextBox runat="server" ID="txtFn" CssClass="form-control"   AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                 <div class="col-md-6">
                                       <label>Last Name</label>
                                      <asp:TextBox runat="server" ID="txtLn" CssClass="form-control"   AutoCompleteType="Disabled"></asp:TextBox>
                                  </div>

                            </div>
                             <div class="form-group row">
                             <div class="col-md-6">
                                  <label>User Name</label>
                                 <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control"   AutoCompleteType="Disabled"></asp:TextBox>
                             </div>
                              <div class="col-md-6">
                                    <label>Email</label>
                                   <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"   AutoCompleteType="Disabled"></asp:TextBox>
                               </div>

                         </div>
                            <div class="form-group">
                                <div class="col-md-6">  
                                    <label>Attribute Role</label>
                                    <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control">
                                    
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Button Text="Add New" runat="server" CssClass="btn btn-primary" ID="btnAdd" OnClick="btnAdd_Click"/>
                            <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />


                        </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid">
          <div class="row">
                <div class="col-md-12">
                  <div class="widget-area-2 lorvens-box-shadow">
                      <h3 class="widget-title">List of User</h3>
                          <div class="lorvens-widget">
                              <table class="table table-hover">
                                   <thead>
                                      <tr>
                                          <th scope="col">#</th>
                                          <th scope="col">Firstname</th>
                                          <th scope="col">LastName</th>
                                          <th scope="col">Username</th>
                                          <th scope="col">Role</th>
                                          <th scope="col">Email</th>
                                          <th scope="col">Status</th>
                                          <th scope="col">Action</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <asp:Repeater runat="server" ID="rptUser" OnItemDataBound="rptUser_ItemDataBound">
                                          <ItemTemplate>
                                              <tr>
                                                <td><asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label></td>
                                                <td class="text-capitalize"><%# Eval("lastname") %></td>
                                                <td class="text-capitalize"><%# Eval("firstname") %></td>
                                                <td class="text-capitalize"><%# Eval("username") %></td>
                                                <td class="text-capitalize"><%# Eval("role") %></td>
                                                 <td class="text-lowercase"><%# Eval("email") %></td>
                                                 <td class="text-capitalize">Active</td>
                                                <td>
                                                    <asp:Button Text="Block" runat="server" CssClass="btn btn-primary" />
                                                    <asp:Button Text="Unblock" runat="server" CssClass="btn btn-secondary"/>
                                                </td>
                                            </tr>
                                          </ItemTemplate>
                                      </asp:Repeater>
                                      
                                  </tbody>
                              </table>
                        </div>
                </div>
            </div>
          </div>
    </div>


</asp:Content>
