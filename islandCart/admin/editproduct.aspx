<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="islandCart.admin.editproduct" ValidateRequest="false"%>


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

    
    <script>
        function validatePrice(priceValue) {
            var errorMessage = document.getElementById('<%= lblErrPrice.ClientID %>');

            
            if (isNaN(priceValue) || parseFloat(priceValue) < 1) {
                errorMessage.textContent = "Minimum Price Should be greater than or equal to 1.00";
                errorMessage.style.display = ""; 
                return false;
            } else {
                errorMessage.textContent = ""; 
                errorMessage.style.display = "none"; 
            }
        }

    </script>
    <script src="https://cdn.tiny.cloud/1/1wlutk2u68sb4j5e4davwulzs1cjx8ofgkg9a3ucq9i7ewzz/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>

    
       <script>
           tinymce.init({
               selector: 'textarea',  
               plugins: [
                   'advlist', 'autolink', 'lists', 'charmap', 'preview', 
                   'searchreplace', 'wordcount', 'visualblocks', 'visualchars',  'fullscreen', 
                   'help'
               ],
               menu: {
                   edit: { title: 'Edit', items: 'undo, redo, selectall' },
                   tools: { title: 'Tools', items: 'spellchecker spellcheckerlanguage |  wordcount' }
               },
               
           });
    </script>
    <style>
     .custom-checkbox input[type="checkbox"] {

        transform: scale(1.3); 
   
        transform-origin: center;
        cursor:pointer;
     }

    .custom-checkbox .text-bold {
      
        vertical-align: middle;
    }

    
    .custom-checkbox label {
        font-size: 1em; 
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--<Admin:Breadcrumb runat="server" ID="lblPageName"/>--%>
    

    <asp:Panel runat="server" DefaultButton="btnAdd">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">
                        <h3 class="widget-title">Edit  Product</h3>
                       
                        <div class="lorvens-widget">
                            <div class="form-group">
                                <label>Product Name</label>
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Required Field" CssClass="text-danger" ValidationGroup="Val_Form"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription" ErrorMessage="Required Field" CssClass="text-danger" ValidationGroup="val_form"></asp:RequiredFieldValidator>
                            </div>


                            <div class="form-group row">

                                <div class="col-md-4">
                                    <label>Price</label>

                                    <asp:TextBox runat="server" ID="txtprice" CssClass="form-control" placeholder="0.00" AutoCompleteType="Disabled" onkeyup="validatePrice(this.value)"></asp:TextBox>
                                    <asp:Label  runat="server" ID="lblErrPrice" CssClass="text-danger" visible="true"/>
                                </div>

                                <div class="col-md-4">
                                    
                             <label>Measurement<i data-toggle="tooltip" title="Leave blank if measurement does not apply" style="cursor:pointer;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"  class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                              <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg></i></label>
                                    <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label>Unit Weight</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlWeight">
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
                                    <asp:TextBox runat="server" ID="txtQuantity" Placeholder="0" CssClass="form-control" ></asp:TextBox>
                                  
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

            </div>
            <hr />
          <div class="row">
            <div class="col-md-12">
                   
                <div class="widget-area-2">
                    
                    <h3 class="widget-title">Product Color Stock </h3>
                 
                    <div class="lorvens-widget">
                          <asp:Label ID="lblErrColor" runat="server" CssClass="text-danger" visible="false"></asp:Label>
                        <div class="form-group row">
                            <asp:Repeater runat="server" ID="rptColor" OnItemDataBound="rptColor_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                         <asp:Label Text='<%# Eval("Color") %>' runat="server" />
                                        <asp:HiddenField ID="hfColor" runat="server" Value='<%# Eval("Color") %>' />
                                         <div class="color-container" style="display:flex; align-items:center;">
                                        <div  style='<%# "width: 55px;  height: 43px; background-color: " +Eval("Color") %>'></div>
                                             <asp:TextBox runat="server" Placeholder="Enter Quantity" CssClass="form-control form-control-sm" ID="txtQuantityColor" TextMode="Number"  />
                                         </div>  
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="custom-checkbox">
                          <asp:CheckBox Text="&nbsp; Color Not Apply Here" runat="server" cssClass="text-semibold" ID="chkNoColor" ToolTip="When checked after confirming update this action cannot be reversed" style="cursor:pointer"/>
                    </div>
                  
                    
                </div>
            </div>
        </div>
            
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2">
                         
                        <h3 class="widget-title">Product Size Stock</h3>
                       
                        <div class="lorvens-widget">
                              <asp:Label ID="lblErrSize" runat="server" CssClass="text-danger" visible="false"></asp:Label>
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
                         <div class="custom-checkbox">
                            <asp:CheckBox Text="&nbsp; Size Not Apply Here" runat="server"  ID="chkNosize" cssClass="text-bold"
                                ToolTip="When checked after confirming update this action cannot be reversed" style="cursor:pointer"/>
                          </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="sizeConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <p>When you confirm the update, all colors for this product will be removed.</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">ok</button>
                    
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



            <asp:Button Text="Update" runat="server" CssClass="btn btn-primary" ID="btnAdd" onClick="btnAdd_Click" UseSubmitBehavior="False" ValidationGroup="Val_Form"/>
            <asp:Button Text="Cancel & Back" runat="server" CssClass="btn btn-secondary" />


        </div>




    </asp:Panel>
</asp:Content>
