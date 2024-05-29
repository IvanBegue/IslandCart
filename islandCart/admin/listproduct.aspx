<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="listproduct.aspx.cs" Inherits="islandCart.admin.listproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
    .dropdown-toggle::after {
        display: none;
    }


    </style>
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
                                <table class="table table-hover" id="gvs">
                                     <thead>
                                        <tr class="text-center">
                                            <th scope="col">#</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Product Name </th>
                                            <th scope="col">Stock Quantity</th>
                                            <th scope="col">Date Added</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Sub Category</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                     <tbody>
                                         <asp:Repeater runat="server" ID="rptProduct" OnItemDataBound="rptProduct_ItemDataBound">
                                             <ItemTemplate>
                                                     <tr>
                                                        <td><asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label>

                                                        </td>
                                                    <td>
                                                        <asp:Image ImageUrl='<% # Eval("fileName") %>' runat="server" Width="50" />
                                                    </td>
                                                        <td><%# Eval("product_name") %></td>
                                                        <td>
          
                                                            <asp:Label Text='<%# Eval("quantity") %>' runat="server" CssClass="text-center" />
                                                        </td>
                                                        <td>
                                                         <%# Eval("date_posted") %>
                                                        </td>
                                                         <td>Rs   <%# Eval("product_price") %></td>

                                                        <td class="text-capitalize"> <%# Eval("category_name") %></td>

                                                        <td class="text-capitalize"><%# Eval("sub_category") %></td>
                                                        <td><%# Eval("brand") %></td>

                                                        <td class="text-center">

                                                              <div class="dropdown">
                                                              <button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             <i class="ti-more-alt"></i>
        </button>


                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                                                <asp:Button Text="Edit" CssClass="dropdown-item" runat="server" CommandArgument='<%# Eval("product_id") %>' ID="btnEdit" OnClick="btnEdit_Click" />

                                                                <asp:Button Text="Remove" CssClass="dropdown-item" runat="server" CommandArgument='<%# Eval("product_id") %>' ID="btnDel"  onclick="btnDel_Click"/>

                                                                <asp:Button runat="server" Text="Manage Stock" CssClass="dropdown-item" ID="btnStock" OnClick="btnStock_Click" CommandArgument='<%# Eval("product_id") %>'/>


                                                            </div>

                                                        </div>

                                                        
                                                           
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
