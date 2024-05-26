<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="subcategory.aspx.cs" Inherits="islandCart.admin.subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2">
        <li class="breadcrumb-item">
            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Manage Sub Category</li>
    </ol>
    <div class="container-fluid">
        <asp:Panel runat="server" ID="pnlAdd" Visible="true">
             <div class="row">
     <div class="col-md-12 mt-3">
         <div class="widget-area-2 lorvens-box-shadow">

             <h3 class="widget-title">Add Product Sub Category</h3>

             <div class="lorvens-widget ">

                 <div class="form-group">
                     <label>Sub Category Name</label>
                     <asp:TextBox runat="server" ID="txtsub" CssClass="form-control" Placeholder="Sub Category Name"></asp:TextBox>
                 </div>

                 <div class="form-group">
                     <label>Choose Category</label>
                     <asp:DropDownList runat="server" ID="ddlCat" CssClass="form-control text-capitalize" />

                 </div>



                 <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" onclick="btnAdd_Click" />


             </div>

         </div>


     </div>
 </div>
        </asp:Panel>
       

        <asp:Panel runat="server" Visible="false" ID="pnlUpdate">

        
            <div class="row">
            <div class="col-md-12 mt-3">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">Update Sub Category</h3>

                    <div class="lorvens-widget ">

                        <div class="form-group">
                            <label>Current Sub Category</label>
                            <asp:TextBox runat="server" ID="txtNewSubcat" CssClass="form-control" Placeholder="Sub Category "></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Current  Category</label>
                            <asp:TextBox runat="server" ID="txtCatName" CssClass="form-control" Placeholder="Category" ReadOnly="True"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Choose Category</label>
                            <asp:DropDownList runat="server" ID="ddlcat2" CssClass="form-control text-capitalize" />
                        </div>
                        <asp:Label  runat="server" ID="txtsid" Visible="false"/>
                        <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-primary" Text="Update" onclick="btnUpdate_Click"/>
                        <asp:LinkButton Text="Cancel" runat="server" CssClass="btn btn-secondary" PostBackUrl="~/admin/subcategory.aspx" />
                    </div>

                </div>
            </div>
        </div>
        </asp:Panel>
    </div>
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="widget-area-2 lorvens-box-shadow">
                <h3 class="widget-title">List of SubCategory</h3>

                <div class="table-div">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Sub Category</th>
                                <th scope="col">Category Assigned</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <asp:Repeater runat="server" ID="rptsubCategory" OnItemDataBound="rptsubCategory_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label></td>
                                      
                                        <td>
                                            <asp:Label CssClass="text-capitalize" Text='<%# Eval("sub_category") %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Label CssClass="text-capitalize" Text='<%# Eval("category_name") %>' runat="server" /></td>
                                        <td>
                                            <asp:Button runat="server" CssClass="btn btn-secondary" Text="Edit" ID="btnEdit"  CommandArgument='<%# Eval("sub_category_id") %>' onclick="btnEdit_Click"/>

                                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Remove" ID="btnRemove" CommandArgument='<%# Eval("sub_category_id") %>' OnClick="btnRemove_Click"/>
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
