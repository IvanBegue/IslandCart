<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="islandCart.client.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="feature-wrapper pt-25 " style="background-color: #DEF5E5;">
        <div class="container ">
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>Begue Ivan</p>
                    <h3 class="feature-account mb-5">My Account </h3>
                </div>
            </div>
        </div>
    </section>
    <section class="pt-50 pb-100 ms-5">
        <div class="container">
            <div class="d-flex align-items-start">
                <div class="nav flex-column nav-pills me-5 pe-3  col-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">

                    <button class="nav-link " id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="false" disabled>Dashboard</button>

                    <button class="nav-link active" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="true">My Profile</button>

                    <button class="nav-link" id="v-pills-wishlist-tab" data-bs-toggle="pill" data-bs-target="#v-pills-wishlist" type="button" role="tab" aria-controls="v-pills-wishlist" aria-selected="false">Wishlist</button>

                    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Orders</button>

                    <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</button>
                </div>
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade " id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">This is home</div>
                    <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">

                        <h3 class="pb-4"><i class="mdi mdi-account"></i>Account Details </h3>
                        <div class="row ">
                            <div class="col col-md-6">
                                <label for="formGroupExampleInput" class="form-label">First Name</label>
                                <asp:TextBox runat="server" ID="txtfn" CssClass="form-control text-capitalize" placeholder="firstname"></asp:TextBox>
                               
                            </div>
                            <div class="col col-md-6">
                                <label for="formGroupExampleInput" class="form-label">Last Name</label>
                                <asp:TextBox runat="server" CssClass="form-control text-capitalize" ID="txtln"></asp:TextBox>
                               
                            </div>
                            <div class="col col-md-6">
                                <label for="formGroupExampleInput" class="form-label">Phone Number</label>
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="+23052*****" ID="txtphn"></asp:TextBox>
                               
                            </div>

                            <div class="single-checkbox checkbox-style-3 checkbox-3">
                                <asp:CheckBox ID="chknewsletter" runat="server" OnCheckedChanged="chknewsletter_CheckedChanged" cssClass=""/>
                                
                                <label for="checkbox-3"><span></span>Subcribe to promotional materials</label>
                            </div>
                        </div>
                        <div class="col-md-5 mt-5">
                            <asp:Button runat="server" ID="btnInfo" CssClass="btn btn-secondary" Text="Save changes" OnClick="btnInfo_Click"/>
                            
                        </div>

                        <h3 class="pb-4 mt-5"><i class="mdi mdi-lock"></i>Reset Password </h3>
                        <div class="row ">
                            <div class="col col-md-6">
                                <label for="formGroupExampleInput" class="form-label">New Password</label>
                                <asp:TextBox runat="server" ID="txtNwPass" CssClass="form-control" placeholder="Enter New Password"/>

                            </div>
                            <div class="col col-md-6">
                                <label for="formGroupExampleInput" class="form-label">Confirm Password</label>
                                <asp:TextBox runat="server" ID="txtConpwd" CssClass="form-control" placeholder="Confirm Password"/>
                                
                            </div>
                        </div>
                        <div class="col-md-5 mt-5">
                            <asp:Button Text="Reset Password" runat="server" CssClass="btn btn-secondary" ID="btnReset" OnClick="btnReset_Click"/>
                            
                        </div>
                    </div>
                   <%-- WISHLIST START HERE--%>
                    <div class="tab-pane fade" id="v-pills-wishlist" role="tabpanel" aria-labelledby="v-pills-wishlist-tab" tabindex="0">
                        <h3 class="pb-4"><i class="mdi mdi-heart-outline me-2"></i>Wishlist </h3>
                        <div class="row ">
                            <div class="col-lg-12">
                                <div class="checkout-style-1">
                                    <div class="checkout-table table-responsive " style="width: 50rem;">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="product text-dark">Product</th>
                                                    <th class="quantity text-dark">Status</th>
                                                    <th class="price text-dark">Price</th>
                                                    <th class="action text-dark">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater runat="server" ID="rptWishlist">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <div class="product-cart d-flex">
                                                                    <div class="product-thumb">
                                                                        <asp:Image runat="server" ID="imgProduct" ImageUrl='<%# DisplayProductImage(Eval("product_id")) %>' Width="60" />
                                                                    </div>
                                                                    <div class="product-content media-body">
                                                                        <h5 class="title">
                                                                            <asp:HyperLink runat="server" Text='<%# Eval("product_name") %>' NavigateUrl='<%# Eval("product_id","/client/productdetails.aspx?q={0}") %>' Target="_blank"></asp:HyperLink>
                                                                           

                                                                        </h5>
               
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>

                                                                <button type="button" id="sub" class="main-btn success-btn-text">
                                                                    In Stock
                                                                </button>


                                                            </td>
                                                            <td>
                                                                <p class="price">Rs <%# Eval("product_price") %></p>
                                                            </td>
                                                            <td>
                                                                <ul class="action">

                                                                    <li>
                                                                        <asp:LinkButton  runat="server" ID="lnkButtonDel" CssClass="mdi mdi-delete-outline text-danger" CommandArgument='<%# Eval("wishlist_id") %>' OnClick="lnkButtonDel_Click"/>
              
                                                                    </li>
                                                                    <li>
                                                                <asp:LinkButton  runat="server" ID="lnkButtonCart" CssClass="mdi mdi-cart-outline text-secondary" CommandArgument='<%# Eval("product_id") %>'/>
                
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                
                                                
                                              
                                             
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="checkout-btn d-sm-flex justify-content-between">
                                        <div class="single-btn">
                                            <a href="#" class="main-btn primary-btn-border">continue shopping</a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>    <%-- WISHLIST END HERE--%>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">
                        <h3 class="pb-4"><i class="mdi mdi-cart"></i>Orders History </h3>
                        <div class="row ">
                            <div class="col-lg-12">
                                <div class="single-order">
                                    <h4 class="order-id">Order ID: 1234567890</h4>
                                    <ul class="order-meta">
                                        <li><a class="product" href="#0">4 Product</a></li>
                                        <li><a class="date" href="#0">02/23/2020, 5:00PM</a></li>
                                    </ul>
                                    <div class="single-progress-bar-horizontal shipped">
                                        <div class="progress-text">
                                            <p>Shipped</p>
                                        </div>
                                        <div class="progress-bar-inner">
                                            <div class="bar-inner">
                                                <div class="progress-horizontal"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="order-price">$144.50</span>
                                </div>
                                <div class="single-order">
                                    <h4 class="order-id">Order ID: 1234567890</h4>
                                    <ul class="order-meta">
                                        <li><a class="product" href="#0">4 Product</a></li>
                                        <li><a class="date" href="#0">02/23/2020, 5:00PM</a></li>
                                    </ul>
                                    <div class="single-progress-bar-horizontal ready">
                                        <div class="progress-text">
                                            <p>Ready</p>
                                        </div>
                                        <div class="progress-bar-inner">
                                            <div class="bar-inner">
                                                <div class="progress-horizontal"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="order-price">$144.50</span>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="single-order">
                                    <h4 class="order-id">Order ID: 1234567890</h4>
                                    <ul class="order-meta">
                                        <li><a class="product" href="#0">4 Product</a></li>
                                        <li><a class="date" href="#0">02/23/2020, 5:00PM</a></li>
                                    </ul>
                                    <div class="single-progress-bar-horizontal ordered">
                                        <div class="progress-text">
                                            <p>Ordered</p>
                                        </div>
                                        <div class="progress-bar-inner">
                                            <div class="bar-inner">
                                                <div class="progress-horizontal"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="order-price">$144.50</span>
                                </div>
                                <div class="single-order">
                                    <h4 class="order-id">Order ID: 1234567890</h4>
                                    <ul class="order-meta">
                                        <li><a class="product" href="#0">4 Product</a></li>
                                        <li><a class="date" href="#0">02/23/2020, 5:00PM</a></li>
                                    </ul>
                                    <div class="single-progress-bar-horizontal delivered">
                                        <div class="progress-text">
                                            <p>Delivered</p>
                                        </div>
                                        <div class="progress-bar-inner">
                                            <div class="bar-inner">
                                                <div class="progress-horizontal"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="order-price">$144.50</span>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="single-order">
                                    <h4 class="order-id">Order ID: 1234567890</h4>
                                    <ul class="order-meta">
                                        <li><a class="product" href="#0">4 Product</a></li>
                                        <li><a class="date" href="#0">02/23/2020, 5:00PM</a></li>
                                    </ul>
                                    <div class="single-progress-bar-horizontal delivered">
                                        <div class="progress-text">
                                            <p>Delivered</p>
                                        </div>
                                        <div class="progress-bar-inner">
                                            <div class="bar-inner">
                                                <div class="progress-horizontal"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="order-price">$144.50</span>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab" tabindex="0">This is setting</div>
            </div>
        </div>
        </div>
    </section>
</asp:Content>
