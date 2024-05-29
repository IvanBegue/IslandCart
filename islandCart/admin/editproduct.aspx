<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="islandCart.admin.editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script>
     function previewImage() {
         var fileUpload = document.getElementById("<%= productImg1.ClientID %>");

         var fileUpload2 = document.getElementById("<%= productImg2.ClientID %>");


         var fileUpload3 = document.getElementById("<%= productImg3.ClientID %>");

         var fileUpload4 = document.getElementById("<%= productImg4.ClientID %>");

         var imgPreview = document.getElementById("<%= imgPreview.ClientID %>");

         var imgPreview1 = document.getElementById("<%= imgPreview1.ClientID %>");

         var imgPreview2 = document.getElementById("<%= imgPreview2.ClientID %>");


         var imgPreview3 = document.getElementById("<%= imgPreview3.ClientID %>");


         if (fileUpload.files && fileUpload.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 imgPreview.src = e.target.result;
             };

             reader.readAsDataURL(fileUpload.files[0]);
         }

         if (fileUpload2.files && fileUpload2.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 imgPreview1.src = e.target.result;
             }
             reader.readAsDataURL(fileUpload2.files[0]);
         }



         if (fileUpload3.files && fileUpload3.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 imgPreview2.src = e.target.result;
             }
             reader.readAsDataURL(fileUpload3.files[0]);
         }


         if (fileUpload4.files && fileUpload4.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 imgPreview3.src = e.target.result;
             }
             reader.readAsDataURL(fileUpload4.files[0]);
         }
     }

     </script>--%>
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
                        <h3 class="widget-title">Edit Current Product</h3>
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
                                    <label>Measurement</label>
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
                                    <asp:DropDownList runat="server" ID="ddlBrand" CssClass="form-control text-capitalize" >
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
                    <asp:Repeater runat="server" ID="rptColor" OnItemDataBound="rptColor_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-md-3">
                                 <asp:Label Text='<%# Eval("Color") %>' runat="server" />
                                <asp:HiddenField ID="hfColor" runat="server" Value='<%# Eval("Color") %>' />

                                 <div class="color-container" style="display:flex; align-items:center;">
                                    
                                <div  style='<%# "width: 55px;  height: 43px; background-color: " +Eval("Color") %>'></div><asp:TextBox runat="server" Placeholder="Enter Quantity" CssClass="form-control form-control-sm" ID="txtQuantityColor" TextMode="Number"  />
                                 </div>
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
                                <asp:Repeater runat="server" ID="rptsize" OnItemDataBound="rptsize_ItemDataBound" >
                                    <ItemTemplate>
                                        <div class="col-md-2">
                                            <asp:Label Text='<%# Eval("size_type") %>' runat="server" CssClass="fs-2 pb-2 text-uppercase" />
                                            <asp:HiddenField ID="hfSizeId" runat="server" Value='<%# Eval("size_id") %>' />
                                            <asp:TextBox runat="server" TextMode="Number" CssClass="form-control form-control-sm" ID="txtSizeTotal" text='<%# Eval("quantity") %>'/>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <hr/>

            <%--<div class="container">--%>
    <div class="row">
        <div class="col-md-12">
            <div class="widget-area-2">
                <h3 class="widget-title">Product Image</h3>
                <div class="lorvens-widget">
                    <div class="row">

                        <asp:Repeater runat="server" ID="rptProductImage">
                            <ItemTemplate>
                                <div class="col-md-4 col-sm-6">
                                    <div class="form-group">

                                        <div class="card" style="width: 15rem;">
                                            <div class="card-body">
                                                <asp:Image ImageUrl='<%# Eval("fileImage") %>' runat="server" ID="imgPreview" AlternateText="Default Image" Height="200" Width="200" />
                                            </div>
                                        </div>
                                        <asp:FileUpload runat="server" ID="productImg1" AllowMultiple="False" onChange="previewImage()" />
                                    </div>
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
                            <h3 class="widget-title">Product  Video</h3>
                            <div class="lorvens-widget">
                                    <div class="form-group">
                                        <div class="form-group row">
                                            <label>Video Link</label>
                                            <asp:TextBox runat="server" ID="txtvideo" placeholder="https://" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
           
                        </div>
                    </div>
                     </div>



            <asp:Button Text="Edit" runat="server" CssClass="btn btn-primary" ID="btnAdd" UseSubmitBehavior="False" onClick="btnAdd_Click"/>
            <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />


        </div>




    </asp:Panel>
</asp:Content>
