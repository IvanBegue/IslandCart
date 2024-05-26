<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="islandCart.admin.editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
        <li class="breadcrumb-item">
            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Edit Product</li>
        
    </ol>
    <asp:Panel runat="server" DefaultButton="btnAdd">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">
                        <h3 class="widget-title">Add New Product</h3>
                        <div class="lorvens-widget">
                            <div class="form-group">
                                <label>Product Name</label>
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                            </div>


                            <div class="form-group row">

                                <%--  <div class="col-md-4">
                                <label>Product Sku</label>
                                <asp:TextBox runat="server" ID="txtSku" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>

                            </div>--%>
                                <div class="col-md-4">
                                    <label>Price</label>
                                    <asp:TextBox runat="server" ID="txtprice" CssClass="form-control" placeholder="0.00" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>

                                <div class="col-md-4">
                                    <label>Weight</label>
                                    <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label>Unit Weight</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlWeight">
                                        <asp:ListItem Text="-- Select Option --" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Kilogram" Value="kg"></asp:ListItem>
                                        <asp:ListItem Text="Gram" Value="g"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label>Brand</label>
                                    <asp:DropDownList runat="server" ID="ddlBrand" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label>Category</label>
                                    <asp:DropDownList runat="server" ID="ddlSubcategory" CssClass="form-control text-capitalize">
                                        <asp:ListItem Text="-- Select Option --" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="col-md-4">
                                    <label>Total Stock Quantity</label>
                                    <asp:TextBox runat="server" ID="txtQuantity" Placeholder="0" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 ">
                        <h3 class="widget-title">Product Color Details</h3>
                        <div class="lorvens-widget">

                            <div class="form-group row">
                                <asp:Repeater runat="server" ID="rptColor">
                                    <ItemTemplate>
                                        <div class="col-md-2">
                                            <asp:HiddenField ID="hfColor" runat="server" Value='<%# Eval("Color") %>' />
                                            <div style='<%# "width: 30px; height: 30px; background-color: " +Eval("Color") %>'></div>
                                            <asp:TextBox runat="server" Placeholder="Enter Quantity" CssClass="form-control form-control-sm" ID="txtQuantityColor" TextMode="Number" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>



                            </div>

                        </div>
                    </div>

                </div>

            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2">
                        <h3 class="widget-title">Product Size Details</h3>
                        <div class="lorvens-widget">

                            <div class="form-group row">
                                <asp:Repeater runat="server" ID="rptsize">
                                    <ItemTemplate>
                                        <div class="col-md-2">
                                            <asp:Label Text='<%# Eval("size_type") %>' runat="server" CssClass="fs-2 pb-2 text-uppercase" />
                                            <asp:HiddenField ID="hfSizeId" runat="server" Value='<%# Eval("size_id") %>' />
                                            <asp:TextBox runat="server" TextMode="Number" CssClass="form-control form-control-sm" ID="txtSizeTotal" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>


                        </div>
                    </div>

                </div>

            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 ">
                        <h3 class="widget-title">Product Image & Video</h3>
                        <div class="lorvens-widget">
                            <div class="d-flex justify-content-start">
                                <div class="form-group ">
                                    <asp:Label runat="server" Text="Main Photo"></asp:Label>
                                    <div class="card" style="width: 15rem;">
                                        <div class="card-body">
                                            <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview" AlternateText="Default Image" Height="200" Width="200" />

                                        </div>
                                    </div>
                                    <asp:FileUpload runat="server" ID="productImg1" AllowMultiple="False" onChange="previewImage()" />
                                </div>

                                <div classs="form-group">
                                    <asp:Label Text="Product Image" runat="server" />
                                    <div class="card" style="width: 15rem;">
                                        <div class="card-body">
                                            <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview1" AlternateText="Default Image" Height="200" Width="200" />
                                        </div>
                                    </div>
                                    <asp:FileUpload runat="server" ID="productImg2" OnChange="previewImage()" />
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="Product Image" runat="server" />
                                    <div class="card" style="width: 15rem;">
                                        <div class="card-body">
                                            <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview2" AlternateText="Default Image" Height="200" Width="200" />
                                        </div>
                                    </div>
                                    <asp:FileUpload runat="server" ID="productImg3" onChange="previewImage()" />
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="Product Image" runat="server" />
                                    <div class="card" style="width: 15rem;">
                                        <div class="card-body">
                                            <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview3" AlternateText="Default Image" Height="200" Width="200" />
                                        </div>
                                    </div>
                                    <asp:FileUpload runat="server" ID="productImg4" onChange="previewImage()" />
                                </div>



                            </div>




                            <div class="form-group ">
                                <label>Video Link</label>
                                <asp:TextBox runat="server" ID="txtvideo" placeholder="https://" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <asp:Button Text="Add" runat="server" CssClass="btn btn-primary" ID="btnAdd" UseSubmitBehavior="False" />
            <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />


        </div>




    </asp:Panel>
</asp:Content>
