<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="listproduct.aspx.cs" Inherits="islandCart.admin.listproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <ol class="breadcrumb mt-2 mb-3">
    <li class="breadcrumb-item">
        <a href="index.html">
            <span class="ti-home"></span>
        </a>
    </li>
    <li class="breadcrumb-item active">Manage Product</li>
</ol>

        <div class="container-fluid">
    <div class="row">
       <div class="col-md-12">
           <div class="widget-area-2 lorvens-box-shadow">
               <h3 class="widget-title">List of Products</h3>
                   <div class="lorvens-widget">
                        <div class="table-div">
                                <table class="table table-hover">
                                     <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Product Name </th>
                                            <th scope="col">Stock Status</th>
                                            <th scope="col">Date Added</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Sub Category</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                     <tbody>
                                         <asp:Repeater runat="server" ID="rptProduct">
                                             <ItemTemplate>
                                                     <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <asp:Image ImageUrl='<% # Eval("fileName") %>' runat="server" Width="50" />
                                                    </td>
                                                        <td><%# Eval("product_name") %></td>
                                                        <td>
          
                                                            <asp:Label Text="In Stock" cssClass="text-success" runat="server" />
                                                        </td>
                                                        <td>
                                                         <%# Eval("date_posted") %>
                                                        </td>
                                                         <td>Rs   <%# Eval("product_price") %></td>

                                                        <td> <%# Eval("category_name") %></td>

                                                        <td><%# Eval("sub_category") %></td>
                                                        <td><%# Eval("brand") %></td>

                                                        <td>
                                                            <asp:Button Text="Remove" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("product_id") %>' ID="btnDel" OnClick="btnDel_Click"/>

                                                        
                                                            <asp:Button Text="Edit"  CssClass="btn btn-secondary"   runat="server" CommandArgument='<%# Eval("product_id") %>' ID="btnEdit" OnClick="btnEdit_Click"/>
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
</div>
</asp:Content>
