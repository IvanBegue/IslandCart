<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addflashsale.aspx.cs" Inherits="islandCart.admin.addflashsale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function previewImage() {

            var fileUpload = document.getElementById("<%= ImgBanner.ClientID %>");
            var imgPreview1 = document.getElementById("<%= imgPreview1.ClientID %>");

            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    imgPreview1.src = e.target.result;
                };

                reader.readAsDataURL(fileUpload.files[0]);
            }



        }


        function DisplayPanel() {

            var rbPercentage = document.getElementById("<%=rbPercentage.ClientID%>");

             var pnlPercentage = document.getElementById("<%=pnlPercentage.ClientID%>");



            var pnlBogo = document.getElementById("<%=pnlBogo.ClientID%>");

            var rbBuyXGeyY = document.getElementById("<%=rbBuyXGetY.ClientID%>");

            var pnlAppliesTo = document.getElementById("<%=pnlAppliesTo.ClientID%>");



            pnlPercentage.style.display = rbPercentage.checked ? 'block' : 'none';



            


            if (rbBuyXGeyY.checked) {
                pnlBogo.style.display = "block";
                pnlAppliesTo.style.display = "none";
            } else {
                pnlBogo.style.display = "none";
                pnlAppliesTo.style.display = "block";
            }
        }

        function handleCheckBoxClick(checkbox) {
            //To allow only one check for checkbox
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (cb) {
                if (cb !== checkbox) {
                    cb.checked = false;
                }
            });
        }

        function DisplayApplyPanel() {

            var rbAll = document.getElementById("<%=rbAll.ClientID%>");

             var rbCategory = document.getElementById("<%=rbCategory.ClientID%>");


             var rbSub = document.getElementById("<%=rbSub.ClientID%>");

             var rbProduct = document.getElementById("<%=rbProduct.ClientID%>");

             var pnlCategory = document.getElementById("<%= pnlCategory.ClientID%>");

             var pnlSub = document.getElementById("<%=pnlSub.ClientID%>");

             var pnlProduct = document.getElementById("<%=pnlProduct.ClientID %>");



            if (rbAll.checked) {
                pnlProduct.style.display = 'none';

                pnlSub.style.display = 'none';

                pnlCategory.style.display = 'none';
            }

            if (rbSub.checked) {
                pnlSub.style.display = 'block';

                pnlProduct.style.display = 'none';

                pnlCategory.style.display = 'none';
            }

            if (rbCategory.checked) {
                pnlCategory.style.display = 'block';

                pnlSub.style.display = 'none';

                pnlProduct.style.display = 'none';
            }

            if (rbProduct.checked) {
                pnlProduct.style.display = 'block';

                pnlSub.style.display = 'none';

                pnlCategory.style.display = 'none';
            }
        }


        $.noConflict();
        jQuery(document).ready(function ($) {

            $("#<%=txtStart.ClientID%>").datepicker({
                     dateFormat: "dd/mm/yy",
                     timeFormat: "HH:mm",
                     changeMonth: true,
                     changeYear: true,
                     minDate: 0
                 });

                 $("#<%=txtEnd.ClientID%>").datepicker({
                     dateFormat: "dd/mm/yy",
                     timeFormat: "HH:mm",
                     changeMonth: true,
                     changeYear: true,
                     minDate: 0
                 });

             });


    </script>
   
    <script>
        (function ($) {
            "use strict";
            $(document).ready(function () {
                // Initialize DataTables
                $('#gvs2').DataTable({
                    paging: true,  // Enable pagination
                    searching: true,  // Enable search functionality
                    lengthChange: false,  // Disable the ability to change page length
                    info: false,  // Disable table information
                    pageLength: 4,  // Set the default page length
                    ordering: false,  // Disable sorting
                    language: {
                        search: "Search:"  // Customize search input placeholder
                    },
                    columnDefs: [
                        { width: "3px", targets: 0 },  // Set width for the first column
                        { width: "100px", targets: 1 }, // Set width for the second column
                        // Add more column width definitions as needed
                    ],
                    autoWidth: false  // Disable automatic column width calculation
                });
            });
        }(jQuery));
    </script>

    <style>
    .dataTables_filter {
        float: left !important;
        text-align: left !important;
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
        <li class="breadcrumb-item active">Manage Flashsale</li>
    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Create Flash Sale" runat="server" ID="HeaderDiscount" />

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group">
                            <label>Flashsale Title </label>
                            <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Type of Flashsale" runat="server" />

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row">
                            <div class="col-md-3">
                                <div class="form-check ">
                                    <asp:RadioButton runat="server" GroupName="Options" Text="&nbsp; Percentage" ID="rbPercentage" onclick="DisplayPanel()" />
                                </div>

                                <div class="form-check ">
                                    <asp:RadioButton runat="server" GroupName="Options" Text="&nbsp; Buy X Get Y" ID="rbBogo" onclick="DisplayPanel()"/>
                                </div>

                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:Panel runat="server" ID="pnlBogo" ClientIDMode="Static" Style="display: none">
             <div class="row">
     <div class="col-md-12">
         <div class="widget-area-2 lorvens-box-shadow">

             <h3 class="widget-title">
                 <asp:Label Text="Buy X Get Y Product" runat="server" />
             </h3>

             <div class="lorvens-widget">
                 <div class="form-group row">
                     <div class="col-md-5">
                         <label>Buy X Product</label>
                         <asp:TextBox runat="server" CssClass="form-control" ID="TextBox1"  />
                         

                         </div>
                     <div class="col-md-5">
                         <label>Get Y Product</label>
                         <asp:TextBox runat="server" CssClass="form-control" ID="TextBox2"  />
                     </div>
                     <div class="col-md-2 mt-4">
                         <button type="button" class="btn btn-primary" >
                         <i class="ti-search"></i>
                         </button></div>

                 </div>
             </div>
             


         </div>
     </div>

 </div>
        </asp:Panel>
       
        <asp:Panel runat="server" ID="pnlPercentage" ClientIDMode="Static" Style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">
                            <asp:Label Text="Set Percentage of Flashsale" runat="server" />

                        </h3>

                        <div class="lorvens-widget">
                            <div class="form-group row">
                                <div class="col-md-3">
                                    <label>Percentage</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPercentage" Placeholder="0%" />
                                </div>
                            </div>
                        </div>



                    </div>
                </div>

            </div>
        </asp:Panel>

        

    </div>
    <hr />
    <asp:Panel runat="server" ID="pnlAppliesTo" style="display:none;">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Applies To" runat="server" />

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row">
                            <div class="col-md-3">
                                <div class="form-check ">
                                    <asp:RadioButton runat="server" Text="All Products" GroupName="ApplyOptions" ID="rbAll" OnClick="DisplayApplyPanel()" />
                                </div>
                                <div class="form-check ">
                                    <asp:RadioButton runat="server" Text="Specific Category" GroupName="ApplyOptions" ID="rbCategory" OnClick="DisplayApplyPanel()" />
                                </div>
                                <div class="form-check ">
                                    <asp:RadioButton runat="server" Text="Specific Sub Category" GroupName="ApplyOptions" ID="rbSub" OnClick="DisplayApplyPanel()" />
                                </div>
                                <div class="form-check ">
                                    <asp:RadioButton runat="server" Text="Specific Product" GroupName="ApplyOptions" ID="rbProduct" OnClick="DisplayApplyPanel()" />
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:Panel runat="server" ID="pnlCategory" ClientIDMode="Static" Style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">
                            <asp:Label Text="Select Category" runat="server" />
                        </h3>
                        <div class="lorvens-widget">
                            <div class="form-group row">
                                <div class="col-md-5">
                                    <label>Select a Category </label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCat">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlSub" ClientIDMode="Static" Style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">
                            <asp:Label Text="Select Sub Category" runat="server" />
                        </h3>
                        <div class="lorvens-widget">
                            <div class="form-group row">
                                <div class="col-md-5">
                                    <label>Select a Sub Category </label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSubCategory">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlProduct" ClientIDMode="Static" Style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lorvens-box-shadow">

                        <h3 class="widget-title">
                            <asp:Label Text="Set Product on Flashsale" runat="server" />
                        </h3>
                        <div class="lorvens-widget">
                            <div class="form-group row">
                                <div class="col-md-10">
                                    <table class="table table-hover" id="gvs2">
                                        <thead>
                                            <tr>
                                                <th scope="col">Select</th>
                                                <th scope="col">Product</th>

                                            </tr>
                                        </thead>
                                        <tbody class="table-group-divider">
                                            <asp:Repeater runat="server" ID="rptProduct">
                                                <ItemTemplate>
                                                    <tr>

                                                        <td class="col-md-1">
                                                            <asp:CheckBox runat="server" ID="chkProduct" Width="20" onClick="handleCheckBoxClick(this)" ToolTip='<%# Eval("product_id") %>' />

                                                        </td>

                                                        <td colspan="2">
                                                            <asp:Image ImageUrl='<%# Eval("fileName") %>' runat="server" Width="50" />
                                                            <%# Eval("product_name") %>


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
        </asp:Panel>

    </div>
        </asp:Panel>
    <hr />

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Set Date of Flash Sales" runat="server" />

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row">
                            <div class="col-md-5">
                                <label>Start Date </label>
                                <asp:TextBox runat="server" ID="txtStart" CssClass="form-control" ClientIDMode="Static" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                            <div class="col-md-5">
                                <label>End Date </label>
                                <asp:TextBox runat="server" ID="txtEnd" CssClass="form-control" ClientIDMode="Static" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Set Banner to display" runat="server" />

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row d-flex justify-content-center">
                            <asp:Image ImageUrl="~/assets/images/product/default.png" runat="server" ID="imgPreview1" AlternateText="Banner Image" Height="300" Width="1000" Style="object-fit: cover; overflow: hidden;" />
                        </div>
                    </div>
                    <div>
                        <asp:FileUpload runat="server" onChange=" previewImage()" AllowMultiple="false" ID="ImgBanner" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container p-3">
        <asp:Button Text="Add FlashSale" runat="server" CssClass="btn btn-primary" ID="btnAdd" OnClick="btnAdd_Click" />
        <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />
    </div>

</asp:Content>
