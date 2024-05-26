<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="islandCart.admin.addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .custom-file-upload {
            display: inline-block;
            padding: 8px 12px;
            cursor: pointer;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
        }


            .custom-file-upload input[type="file"] {
                display: none;
            }
            .color-indicator {
    width: 30px;
    height: 30px;
    display: inline-block;
    vertical-align: middle; 
    margin-right: 10px; 
}
    </style>

    <script>
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

    </script>
<script>
        function addDropdown() {

            var dropdownIndex = 1;

            var container = $('#dropdownContainer');
            var clone = container.clone();
            dropdownIndex++;

            // Adjust IDs and names of the cloned dropdown and input
            clone.find('select').attr('id', 'ddlColor' + dropdownIndex).attr('name', 'ddlColor' + dropdownIndex);
            clone.find('input[type="text"]').attr('id', 'txtQuantity' + dropdownIndex).attr('name', 'txtQuantity' + dropdownIndex);


            container.parent().append(clone);


        }

        function removeDropdown() {
            // Remove the last dropdown 
            $('#dropdownContainer').parent().children('.form-group').not(':first').last().remove();
        }
</script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ol class="breadcrumb mt-2 mb-3">
        <li class="breadcrumb-item">
            <a href="#">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Add Product</li>
    </ol>
    <asp:Panel runat="server" DefaultButton="btnAdd">


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">
                        <h3 class="widget-title">Add New Product</h3>
                        <div class="lorvens-widget">
                            <div class="form-group">
                                <label>Product Name</label>
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" AutoCompleteType="Disabled" ValidationGroup="Val_Form"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Required Field" CssClass="text-danger" ValidationGroup="Val_Form"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription" ErrorMessage="Required Field" CssClass="text-danger" ValidationGroup="val_form"></asp:RequiredFieldValidator>

                            </div>


                            <div class="form-group row">

                            
                                <div class="col-md-4">
                                    <label>Price <small>(Rs)</small></label>
                                    <asp:TextBox runat="server" ID="txtprice" CssClass="form-control" placeholder="0.00" AutoCompleteType="Disabled"></asp:TextBox>
                                    <asp:RangeValidator  runat="server" ErrorMessage="Price should be greater than 0.00" CssClass="text-danger" ValidationGroup="val_form" ControlToValidate="txtprice"></asp:RangeValidator>
                                </div>

                                <div class="col-md-4">
                                    <label>Weight <i data-toggle="tooltip" title="Leave blank if weight does not apply" style="cursor:pointer;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"  class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                      <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                                    </svg>
                                                  </i>


                                    </label>
                                    <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label>Unit Weight</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlWeight">
                                        <asp:ListItem Text="-- Select Option --" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Kilogram(kg)" Value="kg"></asp:ListItem>
                                        <asp:ListItem Text="Gram(g)" Value="g"></asp:ListItem>
                                        <asp:ListItem Text="Pound(lb)" Value="lb"></asp:ListItem>
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
                                <asp:Repeater runat="server" ID="rptColor">
                                    <ItemTemplate>
                                        <div class="col-md-3">
                                             <asp:Label Text='<%# Eval("Color") %>' runat="server" />
                                            <asp:HiddenField ID="hfColor" runat="server" Value='<%# Eval("Color") %>' />

                                             <div class="color-container" style="display:flex; align-items:center;">
                                                
                                            <div  style='<%# "width: 55px;  height: 43px; background-color: " +Eval("Color") %>'></div><asp:TextBox runat="server" Placeholder="Enter Quantity" CssClass="form-control form-control-sm" ID="txtQuantityColor" TextMode="Number" />
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
                        <h3 class="widget-title">Product Size Details </h3>
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
                        <h3 class="widget-title">Product Image  </h3>
                        <div class="lorvens-widget">
                            <div class="d-flex justify-content-start">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                          <div class="form-group">
                                                  <asp:Label runat="server" Text="Main Photo"></asp:Label>
                                                  <div class="card" style="width: 15rem;">
                                                      <div class="card-body">
                                                          <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview" AlternateText="Default Image" Height="200" Width="200" />

                                                      </div>
                                                  </div>
                                                  <asp:FileUpload runat="server" ID="productImg1" AllowMultiple="False" onChange="previewImage()" />
                                              </div>

                                        </div>
                                    <div class="col-md-6 col-sm-6">
                                              <div class="form-group ">
                                                  <asp:Label Text="Product Image" runat="server" />
                                                  <div class="card" style="width: 15rem;">
                                                      <div class="card-body">
                                                          <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview1" AlternateText="Default Image" Height="200" Width="200" />
                                                      </div>
                                                  </div>
                                                  <asp:FileUpload runat="server" ID="productImg2" OnChange="previewImage()" />
                                              </div>
                                            </div>

                                    
                                </div>

                              


                                    </div>

                                </div>
                           <div class="d-flex justify-content-start">
                               <div class="row">

                               
                                   <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <asp:Label Text="Product Image" runat="server" />
                                            <div class="card" style="width: 15rem;">
                                                <div class="card-body">
                                                    <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview2" AlternateText="Default Image" Height="200" Width="200" />
                                                </div>
                                            </div>
                                            <asp:FileUpload runat="server" ID="productImg3" onChange="previewImage()" />
                                        </div>
                                       </div>

                                       <div class="col-md-6 col-sm-6">
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
                                    

                                </div>

                               </div>


                            </div>

                        </div>
                    </div>
                

            <hr/>
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 ">
                        <h3 class="widget-title">Product  Video</h3>
                        <div class="lorvens-widget">
                         
                                <div class="form-group ">
                                    <div class="form-group row">
                                        <label>Video Link</label>
                                        <asp:TextBox runat="server" ID="txtvideo" placeholder="https://" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                       
                    </div>
                </div>
                 </div>


                <asp:Button Text="Add" runat="server" CssClass="btn btn-primary" ID="btnAdd" OnClick="btnAdd_Click" UseSubmitBehavior="False" ValidationGroup="Val_Form" />
                <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />


            </div>
    </asp:Panel>


</asp:Content>
