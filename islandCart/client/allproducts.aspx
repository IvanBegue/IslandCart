<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="allproducts.aspx.cs" Inherits="islandCart.client.allproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section
        class="content-card-style-10 bg_cover "
        style="background-image: url(/assets/images/banners/banner-fashion-3.jpg)">
    </section>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
             <section class="category-wrapper pt-50">
     <div class="container">
         <div class="row ">
             <div class="col-lg-4">
                 <div class="filter-style-1 mt-0">
                     <div class="filter-title">
                         <h4 class="title">Filter</h4>
                     </div>
                     <div class="filter-btn">
                         <a class="main-btn primary-btn" href="javascript:void(0)">Reset</a>
                     </div>
                 </div>
                 <div class="filter-style-8">
                     <div class="filter-title">
                         <a
                             class="title"
                             data-bs-toggle="collapse"
                             href="#category"
                             role="button"
                             aria-expanded="false">Categories</a>
                     </div>
                     <div class="collapse show" id="category">
                         <div class="filter-search">
                             <asp:TextBox runat="server" Textmode="Search" placeholder="Search" ID="txtSearch" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"/>
                         </div>
                         <div class="filter-platform mt-3">
                             <asp:CheckBoxList runat="server" ID="chkSub" CssClass="text-capitalize" OnSelectedIndexChanged="txtSearch_TextChanged" AutoPostBack="true">
                                
                             </asp:CheckBoxList>
                         </div>
                     </div>
                 </div>

                 <div class="filter-style-9">
                     <div class="filter-title">
                         <a
                             class="title"
                             data-bs-toggle="collapse"
                             href="#platform"
                             role="button"
                             aria-expanded="false">Brand</a>
                     </div>
                     <div class="collapse show" id="platform">
                         <div class="filter-platform">
                             <asp:CheckBoxList runat="server" ID="chkBrand" cssClass="text-capitalize" AutoPostBack="true" OnSelectedIndexChanged="txtSearch_TextChanged">
                             
                             </asp:CheckBoxList>
                         </div>
                     </div>
                 </div>

              <%--   <div class="filter-style-7">
                     <div class="filter-title">
                         <a
                             class="title"
                             data-toggle="collapse"
                             href="#color"
                             role="button"
                             aria-expanded="false">Select Size
                         </a>
                     </div>
                     <div class="collapse show" id="color">
                         <div class="filter-color">
                             <ul>
                                 <li>
                                     <div class="color-check">
                                         <p>
                                             <span style="background-color: #00c2fe"></span>
                                             <strong>Blue</strong>
                                         </p>

                                         <input type="checkbox" id="color-1" />
                                         <label for="color-1"><span></span></label>
                                     </div>
                                 </li>
                                 <li>
                                     <div class="color-check">
                                         <p>
                                             <span style="background-color: #e14c7b"></span>
                                             <strong>Red</strong>
                                         </p>

                                         <input type="checkbox" id="color-2" />
                                         <label for="color-2"><span></span></label>
                                     </div>
                                 </li>
                                 <li>
                                     <div class="color-check">
                                         <p>
                                             <span style="background-color: #7cb637"></span>
                                             <strong>Green</strong>
                                         </p>

                                         <input type="checkbox" id="color-3" />
                                         <label for="color-3"><span></span></label>
                                     </div>
                                 </li>
                                 <li>
                                     <div class="color-check">
                                         <p>
                                             <span style="background-color: #161359"></span>
                                             <strong>Dark</strong>
                                         </p>

                                         <input type="checkbox" id="color-4" />
                                         <label for="color-4"><span></span></label>
                                     </div>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>--%>
             </div>
             <%-- PRODUCT CONTENT START HERE--%>

             <div class="col-lg-8">
                <div class="row">
                    <asp:Repeater runat="server" ID="rptProduct" OnItemDataBound="rptProduct_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-md-4 col-lg-4 col-sm-6">
                                <div class="card border-0 position-relative">

                                       <a class="add-wishlist position-absolute top-0 start-0 translate-middle p-1">
              <asp:LinkButton runat="server"  CommandArgument='<%# Eval("product_id") %>' ID="lnkWishlist" OnClick="lnkWishlist_Click" style="position:absolute; right:10px; top:10px;"/>

            </a>
                                        <span class="badge rounded-pil position-absolute top-0 start-0 translate-middle p-1 bg-danger border m-4">
                                        <span class="text-light">On Sale</span>
                                      </span>
                                    
                          </span>
                                    <asp:Image ImageUrl='<%# Eval("fileName") %>' runat="server" CssClass="rounded-3 img-fluid " style="object-fit:cover; overflow:hidden;"/>
                                    <div class="card-body d-flex flex-column">
                <h5 class="card-title text-capitalize flex-grow-1">
                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("product_id","/client/productdetails.aspx?q={0}") %>' Target="_blank" Text='<%#Eval("product_name") %>'></asp:HyperLink>
                </h5>
                <p class="card-text text-secondary text-capitalize flex-grow-1">
                    <%#Eval("sub_category") %>
                </p>
                <div class="product-price-cart md-5"> 
                    <div class="row">
                        <div class="col">
                             <p class="fw-bold fs-6  mt-3 me-2 text-decoration-line-through">Rs 3500</p>
                            <div class="d-flex justify-content-between  align-items-center">
                              
                                <p class="fw-bold fs-6   me-2 text-danger">Rs <%#Eval("product_price") %></p>
                                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn btn-primary mdi mdi-cart mt-2" CommandArgument='<%# Eval("product_id") %>' OnClick="btnCart_Click" />
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

             </div>

         </div>
     </div>
 </section>
        </ContentTemplate>
        <Triggers>
            
              <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged"/>
            <asp:AsyncPostBackTrigger ControlID="chkSub" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="chkbrand" EventName="SelectedIndexChanged"/>
        </Triggers>   
    </asp:UpdatePanel>



  





   
</asp:Content>
