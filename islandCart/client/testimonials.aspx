<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="testimonials.aspx.cs" Inherits="islandCart.client.testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .rate {
            float: left;
            height: 46px;
            padding: 0 10px;
        }

            .rate:not(:checked) > input {
                position: fixed;
                top: -9999px;
            }

            .rate:not(:checked) > label {
                float: right;
                width: 1em;
                overflow: hidden;
                white-space: nowrap;
                cursor: pointer;
                font-size: 30px;
                color: #ccc;
            }

                .rate:not(:checked) > label:before {
                    content: '★ ';
                }

            .rate > input:checked ~ label {
                color: #ffc700;
            }

            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }

            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }

            .custom-dropdown {
 
  background-color: #fff;

  border: none;
  
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
 
  padding: 8px 24px 8px 8px;
 
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 8px center;
}
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="feature-wrapper pt-70">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <h2 class="mb-2">What People Said About Us </h2>
                    <p class="fs-5">Everyday we work hard to make life of our clients better and happier</p>
                </div>
            </div>
        </div>
    </section>


    <section class="reviews-wrapper pt-100 pb-100">
        <div class="container">
            <div class="reviews-style">
                <div class="reviews-menu">
                    <ul
                        class="breadcrumb-list-grid nav nav-tabs border-0"
                        id="myTab"
                        role="tablist">

                        <li class="nav-item" role="presentation">
                            <a
                                class="active"
                                id="profile-tab"
                                data-toggle="tab"
                                href="#profile"
                                role="tab"
                                aria-controls="profile"
                                aria-selected="false">Reviews
                            </a>
                        </li>

                    </ul>
                </div>

                <div class="tab-content" id="myTabContent">

                    <div
                        class="tab-pane fade show active"
                        id="profile"
                        role="tabpanel"
                        aria-labelledby="profile-tab">
                        <div class="review-wrapper">
                            <div class="reviews-title">
                                <h4 class="title">Customer Reviews (<asp:Label ID="lblTotalReviews" runat="server" />)</h4>
                            </div>

                            <div class="reviews-rating-wrapper flex-wrap">
                                <div class="reviews-rating-star">
                                    <p class="rating-review">
                                        <i class="mdi mdi-star"></i><span>
                                            <asp:Label runat="server" ID="lblAvgRating" /></span> of 5
                                    </p>

                                    <div class="reviews-rating-bar">
                                        <div class="single-reviews-rating-bar">
                                            <p class="value">5 Stars</p>
                                            <div class="rating-bar-inner">

                                                <asp:Label runat="server" CssClass="bar-inner bg-secondary" ID="lblBar5" />
                                            </div>
                                            <p class="percent">
                                                <asp:Label runat="server" ID="lblTotal5" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reviews-rating-bar">
                                        <div class="single-reviews-rating-bar">
                                            <p class="value">4 Stars</p>
                                            <div class="rating-bar-inner">
                                                <asp:Label runat="server" CssClass="bar-inner bg-secondary" ID="lblBar4" />
                                            </div>
                                            <p class="percent">
                                                <asp:Label runat="server" ID="lblTotal4" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reviews-rating-bar">
                                        <div class="single-reviews-rating-bar">
                                            <p class="value">3 Stars</p>
                                            <div class="rating-bar-inner">
                                                <asp:Label runat="server" CssClass="bar-inner bg-secondary" ID="lblBar3" />


                                            </div>
                                            <p class="percent">
                                                <asp:Label runat="server" ID="lblTotal3" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reviews-rating-bar">
                                        <div class="single-reviews-rating-bar">
                                            <p class="value">2 Stars</p>
                                            <div class="rating-bar-inner">
                                                <asp:Label runat="server" CssClass="bar-inner bg-secondary" ID="lblBar2" />
                                            </div>
                                            <p class="percent">
                                                <asp:Label runat="server" ID="lblTotal2" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reviews-rating-bar">
                                        <div class="single-reviews-rating-bar">
                                            <p class="value">1 Star</p>
                                            <div class="rating-bar-inner">
                                                <asp:Label runat="server" CssClass="bar-inner bg-secondary" ID="lblBar1" />
                                            </div>
                                            <p class="percent">
                                                <asp:Label runat="server" ID="lblTotal1" />
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="reviews-rating-form">
                                    <h3 class="text-center">
                                        <asp:Label Text="Post A Review" runat="server" ID="lblHeader"/>
                                       

                                    </h3>
                                            
                                    <asp:Panel runat="server" ID="pnlRating" Visible="true">
                                    <div class="rating-star">
                                        <p>Click on star to review</p>

                                        <div class="d-flex">
                                            <div class="rate">
                                                <input type="radio" id="star5" name="rate" value="5" />
                                                <label for="star5" title="text">5 stars</label>
                                                <input type="radio" id="star4" name="rate" value="4" />
                                                <label for="star4" title="text">4 stars</label>
                                                <input type="radio" id="star3" name="rate" value="3" />
                                                <label for="star3" title="text">3 stars</label>
                                                <input type="radio" id="star2" name="rate" value="2" />
                                                <label for="star2" title="text">2 stars</label>
                                                <input type="radio" id="star1" name="rate" value="1" />
                                                <label for="star1" title="text">1 star</label>
                                            </div>

                                            
                                                   

                                        </div>
                                        
                                    </div>
                                </asp:Panel>

                                    <div class="rating-form">
                                        <div class="single-form form-default">
                                            <asp:Label Text="Write Your Review" runat="server" ID="lblReview"/>
                                            

                                            <div class="form-input">
                                                <asp:TextBox runat="server" ID="txtReview" TextMode="Multiline" placeholder="Tell to people about your experience with Island Cart"   />


                                                <i class="mdi mdi-message-text-outline"></i>
                                            </div>
                                            <asp:Panel runat="server" ID="pnlUserRating" Visible="false">
                                            <div class="mt-2">
                                                     <p>
                                                          Your Rating
                                                      <i class="mdi mdi-star" style="color:#ffc700;"></i>
                                                      <span class="rating"><strong>  <asp:Label ID="lblRating" runat="server" /></strong> of 5</span>
                                                      </p>
                                                </div>
                                        </asp:Panel>
                                        </div>
                                        <div class="single-rating-form flex-wrap">
                                            <div class="rating-form-file">

                                                <div class="file">
                                                    <input type="file" id="file-1" />
                                                    <label for="file-1">
                                                        <i class="mdi mdi-attachment"></i>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="rating-form-btn">
                                                <asp:LinkButton Text="Login To Post Testimonials" runat="server" CssClass="main-btn primary-btn" ID="btnToLogin" PostBackUrl="~/client/login.aspx"/>

                                                <asp:Button Text="Post Testimonial" runat="server" CssClass="main-btn primary-btn" ID="btnPost" OnClick="btnPost_Click" />

                                                <asp:Button Text="Edit Review" runat="server" CssClass="main-btn primary-btn" ID="btnEdit" Visible="false" OnClick="btnEdit_Click"/>

                                                <asp:Button Text="Save Changes" runat="server" ID="btnSave" CssClass="main-btn primary-btn" visible="false" OnClick="btnSave_Click"/>

                                                <asp:Button Text="Cancel" runat="server" ID="btnCancel" CssClass="main-btn secondary-btn" visible="false" OnClick="btnCancel_Click"/>


                                                <asp:Button Text="Remove Review" runat="server" ID="btnRmv" CssClass="main-btn error-btn-border" visible="false" OnClick="btnDel_Click"/>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="reviews-btn flex-wrap">
                                <div class="reviews-btn-left">
                                    <div class="dropdown-style">
                                        <div class="dropdown dropdown-white">


                                            <ul
                                                class="dropdown-menu sub-menu-bar"
                                                aria-labelledby="dropdownMenu-1">
                                                <li><a href="#">Dropped Menu 1</a></li>
                                                <li><a href="#">Dropped Menu 2</a></li>
                                                <li><a href="#">Dropped Menu 3</a></li>
                                                <li><a href="#">Dropped Menu 4</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="dropdown-style">
                                        <div class="dropdown dropdown-white">
                                            <button
                                                class="main-btn primary-btn-border"
                                                type="button"
                                                id="dropdownMenu-1"
                                                data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="true">
                                                Sort by Latest <i class="mdi mdi-chevron-down"></i>
                                            </button>

                                            <ul
                                                class="dropdown-menu sub-menu-bar"
                                                aria-labelledby="dropdownMenu-1">
                                                <li><a href="#">Dropped Menu 1</a></li>
                                                <li><a href="#">Dropped Menu 2</a></li>
                                                <li><a href="#">Dropped Menu 3</a></li>
                                                <li><a href="#">Dropped Menu 4</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>


                            </div>

                            <div class="reviews-comment">
                                <ul class="comment-items">
                                    <li>
                                        <asp:Repeater runat="server" ID="rptTestimonials">
                                            <ItemTemplate>
                                                <div class="single-review-comment">
                                                    
                                                    <div class="comment-user-info">
                                                        <div class="comment-author">

                                                            <asp:Image ImageUrl='<% # Eval("profile_img")%>' runat="server" width="50" Height="50"/>
                                                          
                                                        </div>
                                                        <div class="comment-content">
                                                            <h6 class="name text-capitalize">
                                                              <%# Eval("UserName")%>

                                                            </h6>

                                                            <p>
                                                                <i class="mdi mdi-star"></i>
                                                                <span class="rating"><strong>   <%# Eval("rating") %></strong> of 5</span>
                                                                <span class="date"><%# Eval("date_posted") %></span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="comment-user-text">
                                                        <p>
                                                           <%# Eval("description") %>
                                                        </p>
                                                        <ul class="comment-meta">
                                                            <li>
                                                                <i class="mdi mdi-thumb-up"></i><span>0</span>
                                                            </li>
                                                            <li><a href="#">Like</a></li>

                                                        </ul>
                                                    </div>
                                                    <%--<div class="d-flex gap-2 justify-content-end">
                                                        <asp:Button Text="Edit" runat="server" CssClass="btn btn-outline-primary" CommandArgument='<%# Eval("testimonials_id") %>' ID="btnEdit"/>  
                                                        <asp:Button Text="Remove" runat="server" CssClass="btn btn-outline-danger" CommandArgument='<%# Eval("testimonials_id") %>' ID="btnDel" OnClick="btnDel_Click"/>
                                                    </div>--%>
                                                </div>
                                                <hr />
                                            </ItemTemplate>
                                        </asp:Repeater>


                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        </div>
    </section>

</asp:Content>


