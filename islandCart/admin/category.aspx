<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="islandCart.admin.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2">
        <li class="breadcrumb-item">

            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Manage Category</li>
    </ol>

    <div class="container-fluid">
    <%--    UPDATE CATEGORY START--%>
        <asp:Panel runat="server" ID="pnlUpdate" Visible="false">
            <div class="row">
                <div class="col-md-12 mt-3">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">Update Product Category</h3>

                        <div class="lorvens-widget ">

                            <div class="form-group">
                                <label >Category Name</label>
                                <asp:TextBox runat="server" ID="txtCurrentCat" CssClass="form-control" Placeholder="Category Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Category Image</label>
                                <asp:FileUpload runat="server" CssClass="form-control" ID="fupCatImg" />
                            </div>
                            <div class="form-group">
                                <label>Current Image</label>
                                    <asp:Image ID="ImgCategoryImg" runat="server" Width="200" />
                            </div>
                            <asp:label runat="server" ID="hdnCid" Visible="false"/>
                            <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click"  />


                        </div>

                    </div>


                </div>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlAdd" Visible="true">
             <%--    ADD CATEGORY START--%>
            <div class="row">
                <div class="col-md-12 mt-3">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">Add Product Category</h3>

                        <div class="lorvens-widget ">

                            <div class="form-group">
                                <label for="exampleInputEmail1">Category Name</label>
                                <asp:TextBox runat="server" ID="txtCategory" CssClass="form-control" Placeholder="Category Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category Image</label>
                                <asp:FileUpload runat="server" CssClass="form-control" ID="picCategory" />
                            </div>
                            <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click"  />
                          

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
                    <h3 class="widget-title">List of Category</h3>

                    <div class="table-div">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Occurence</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="rptCategory" OnItemDataBound="rptCategory_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label>
                                            <td>
                                                <asp:Image runat="server" Width="100px" CssClass="rounded rounded-2" ImageUrl='<%# String.Format("{0}{1}", Eval("filePath"), Eval("categoryImage")) %>' />
                                            </td>
                                            <td>
                                                <asp:Label CssClass="text-capitalize" Text='<%# Eval("category_name") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label CssClass="text-capitalize" Text='<%# Eval("product_count") %>' runat="server" /></td>
                                            <td>
                                                <asp:Button runat="server" CssClass="btn btn-secondary " Text="Edit" ID="btnEdit" OnClick="btnEdit_Click" CommandArgument='<%# Eval("category_id") %>' />
                                                  <asp:Button runat="server" ID="btnRemove" CssClass="btn btn-danger ms-4" Text="Remove"  CommandArgument='<%# Eval("category_id") %>' OnClick="btnRemove_Click"/>
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
