<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="islandCart.client.productdetails" %>
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

          .video-popup {
      display: inline-block;
      margin: 20px;
      cursor: pointer;
      color: #1760BF;
      text-decoration: none;
    }
    .video-popup:hover {
      color: #c00;
    }
    </style>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="product-details-wrapper pt-50 pb-100">
      <div class="container">
       
        <div class="row pb-30">

         
            <div class="col-lg-6">
              <div class="slider slider-for">
                  <asp:Repeater runat="server" ID="RptMainImg">
                      <ItemTemplate>
                          <div >
                          <asp:Image ImageUrl='<%#Eval ("fileName") %>' runat="server" Width="1000" Height="600px" style="object-fit:cover; overflow:hidden;" />
                        </div>
                      </ItemTemplate>
                  </asp:Repeater>
              </div>
              
            </div>
            <div class=" col-6 justify-content-start pt-30">
              <h2 class="text-capitalize">
                  <asp:Label  runat="server" ID="lblProductName"/></h2>

              <div class="d-flex justify-content-start">
                <div class="rating-star pt-1">
                  <ul id="stars" class="stars d-flex justify-content-start fs-5 mt-2">
                    <li class="star" data-value="1">
                      <i class="mdi mdi-star  text-warning " ></i>
                    </li>
                    <li class="star" data-value="2">
                      <i class="mdi mdi-star  text-warning"></i>
                    </li>
                    <li class="star" data-value="3">
                      <i class="mdi mdi-star  text-warning"></i>
                    </li>
                    <li class="star" data-value="4">
                      <i class="mdi mdi-star  text-warning"></i>
                    </li>
                    <li class="star" data-value="5">
                      <i class="mdi mdi-star"></i>
                      
                    </li>

                    <h4 class="text-warning ms-2 mt-1">4.5</h4>
                 
                  </ul>
                     <h5 class="mdi mdi-cart-outline ms-1 mt-1 text-secondary fw-normal ">
                       <asp:Label  runat="server" ID="lblTotalOrders" CssClass="fw-normal"/>
                       Orders</h5>
                </div>
              </div>
              
              

              <div class="d-flex justify-content-start mt-4">
                  <asp:Panel runat="server" ID="pnlDiscount" Visible="false">
                <h3 class="text-muted text-decoration-line-through pe-3">
                    <asp:Label  runat="server" ID="lblCutPrice" Visible="false"/></h3></asp:Panel>

                <h3>
                    <asp:Label runat="server" ID="lblPrice"/></h3>
              </div>

              <div class="d-flex justify-content-start mt-4">
                <p>
                    <asp:Label  runat="server" ID="lblDescription"/>
                </p>
              </div>

              <div class="d-flex  align-items-start flex-column mb-3 mt-4">
                

                  <p class="fs-6 me-2 pb-2">Brand:  <b>
                      <asp:Label  runat="server" cssClass="text-capitalize" ID="lblBrand"/></b></p>

                  <p class="fs-6 me-2 pb-2">Category  : <b>
                      <asp:Label  runat="server"  cssClass="text-capitalize"  ID="lblCategory"/></b> </p>

                  <p class="fs-6 me-2 pb-2">Tags : <b>
                      <asp:Label  runat="server"  cssClass="text-capitalize"  ID="lblTags"/></b> </p>

                   <p class="fs-6 me-2 pb-2">Weight : <b>
                       <asp:Label  runat="server" ID="lblWeight"/></b> </p>

                  <p class="fs-6 me-2 pb-2 text-success">In Stock</p>
                
                <%--  <p class="fs-6 me-2 pb-2 text-warning">Low In Stock</p>

                  <p class="fs-6 me-2 pb-2 text-danger">Out of Stock</p>--%>
              </div>
              <hr>

              <div class="d-flex  justify-content-start ">
            
                <div class="col-md-3 pe-3">
                  <label class="form-label">Size</label>

                  <select  class="form-select ">
                
                    <option>Small</option>
                    <option>Large</option>
                    <option>Medium</option>
                  </select>

                  

                </div>
                <div class="col-md-3 mt-1">
                  <label class="form-label">Quantity</label>
                  <input type="number" min="1" class="form-control">
                </div>
              </div>
              <div class="d-flex  justify-content-start mt-4">
                <div class="me-5">
               
                  <button type="button" class="btn btn-primary">Add To Cart</button>
                  <button type="button" class="btn btn-danger">Add To Wishlist</button>
                </div>
               
              </div>
            </div>

          
        </div>
        

        <div class="row">
            <div class="col-6">
              <div class="slider slider-nav">
                  <asp:Repeater runat="server" ID="RptSlideImg">
                      <ItemTemplate>
                           <div class="border border-4 "  >
                               <asp:Image ImageUrl='<%#Eval ("fileName") %>' runat="server"  Width="300" Height="200" style="object-fit:cover; overflow:hidden;"/>
                                
                            </div>
                      </ItemTemplate>
                  </asp:Repeater>
               
                
                 
              </div>
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
              role="tablist"
            >
              <li class="nav-item" role="presentation">
                <a
                  id="home-tab"
                  data-toggle="tab"
                  href="#home"
                  role="tab"
                  aria-controls="home"
                  aria-selected="true"
                >
                  Details
                </a>
              </li>
              <li class="nav-item" role="presentation">
                <a
                  class="active"
                  id="profile-tab"
                  data-toggle="tab"
                  href="#profile"
                  role="tab"
                  aria-controls="profile"
                  aria-selected="false"
                >
                  Reviews
                </a>
              </li>

              <li class="nav-item" role="presentation">
                <a
                  id="specifications-tab"
                  data-toggle="tab"
                  href="#specifications"
                  role="tab"
                  aria-controls="specifications"
                  aria-selected="false"
                >
                  specifications
                </a>
              </li>
                 <li class="nav-item" role="presentation">
                   <a
                     id="video-tab"
                     data-toggle="tab"
                     href="#video"
                     role="tab"
                     aria-controls="video"
                     aria-selected="false"
                   >
                     video
                   </a>
                 </li>

            </ul>
          </div>

          <div class="tab-content" id="myTabContent">
            <div
              class="tab-pane fade"
              id="home"
              role="tabpanel"
              aria-labelledby="home-tab"
            >
              <div class="details-wrapper">
                <div class="row">
                  <div class="col-lg-8">
                    <div class="reviews-title">
                      <h4 class="title">Oculus VR</h4>
                    </div>
                    
                    
                    <p class="mb-15 pt-30">
                      Lorem ipsum dolor sit amet consectetur adipisicing elit.
                      Maxime quod sequi vitae atque perspiciatis voluptas
                      recusandae explicabo ea dolores numquam ratione, obcaecati
                      ullam, ipsam minima vero nostrum nesciunt facere
                      laudantium? Facere animi rem veniam quibusdam nam sed ex
                      maxime laboriosam a vero nesciunt tenetur, eius autem
                      fugiat quod expedita dignissimos.
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="tab-pane fade show active"
              id="profile"
              role="tabpanel"
              aria-labelledby="profile-tab"
            >
              <div class="review-wrapper">
                <div class="reviews-title">
                  <h4 class="title">Customer Reviews (38)</h4>
                </div>

                <div class="reviews-rating-wrapper flex-wrap">
                  <div class="reviews-rating-star">
                    <p class="rating-review">
                      <i class="mdi mdi-star"></i> <span>4.5</span> of 5
                    </p>

                    <div class="reviews-rating-bar">
                      <div class="single-reviews-rating-bar">
                        <p class="value">5 Starts</p>
                        <div class="rating-bar-inner">
                          <div class="bar-inner bg-secondary" style="width: 60%"></div>
                        </div>
                        <p class="percent">60%</p>
                      </div>
                    </div>
                    <div class="reviews-rating-bar">
                      <div class="single-reviews-rating-bar">
                        <p class="value">4 Starts</p>
                        <div class="rating-bar-inner">
                          <div class="bar-inner bg-secondary" style="width: 20%"></div>
                        </div>
                        <p class="percent">20%</p>
                      </div>
                    </div>
                    <div class="reviews-rating-bar">
                      <div class="single-reviews-rating-bar">
                        <p class="value">3 Starts</p>
                        <div class="rating-bar-inner">
                          <div class="bar-inner  bg-secondary" style="width: 10%"></div>
                        </div>
                        <p class="percent">10%</p>
                      </div>
                    </div>
                    <div class="reviews-rating-bar">
                      <div class="single-reviews-rating-bar">
                        <p class="value">2 Starts</p>
                        <div class="rating-bar-inner">
                          <div class="bar-inner bg-secondary" style="width: 5%"></div>
                        </div>
                        <p class="percent">05%</p>
                      </div>
                    </div>
                    <div class="reviews-rating-bar">
                      <div class="single-reviews-rating-bar">
                        <p class="value">1 Starts</p>
                        <div class="rating-bar-inner">
                          <div class="bar-inner bg-secondary" style="width: 0"></div>
                        </div>
                        <p class="percent">0%</p>
                      </div>
                    </div>
                  </div>

                  <div class="reviews-rating-form">
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
                    <div class="rating-form">
             
                        <div class="single-form form-default">
                          <label>Write your Review</label>
                          <div class="form-input">
                             <asp:TextBox runat="server" ID="txtReview" TextMode="Multiline" placeholder="Write your reviews" />
                            <i class="mdi mdi-message-text-outline"></i>
                          </div>
                        </div>
                        <div class="single-rating-form flex-wrap">
                          <div class="rating-form-file">
                            
                            <div class="file">
                               
                            <input type="file" id="file-1"  multiple="multiple" name="img"/>
                              <label for="file-1"
                                ><i class="mdi mdi-attachment"></i
                              ></label>
                            </div>
                          </div>
                          <div class="rating-form-btn">
                              <asp:Button Text="write a  review" runat="server"  CssClass="main-btn primary-btn" ID="btnAdd" OnClick="btnAdd_Click" Visible="true"/>

                              <asp:Button Text="Login To Post Review" runat="server"  CssClass="main-btn primary-btn" ID="btnLogin"  Visible="false"/>
                            
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
                          aria-labelledby="dropdownMenu-1"
                        >
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
                          aria-expanded="true"
                        >
                          Sort by Latest <i class="mdi mdi-chevron-down"></i>
                        </button>

                        <ul
                          class="dropdown-menu sub-menu-bar"
                          aria-labelledby="dropdownMenu-1"
                        >
                          <li><a href="#">Dropped Menu 1</a></li>
                          <li><a href="#">Dropped Menu 2</a></li>
                          <li><a href="#">Dropped Menu 3</a></li>
                          <li><a href="#">Dropped Menu 4</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>

                  <div class="reviews-btn-right">
                    <a href="#" class="main-btn">with photo (18)</a>
                    
                  </div>
                </div>

                <div class="reviews-comment">
                  <ul class="comment-items">
                    <li>
                      <div class="single-review-comment">
                        <div class="comment-user-info">
                          <div class="comment-author">
                            <img
                              src="assets/images/review/author-1.jpg"
                              alt=""
                            />
                          </div>
                          <div class="comment-content">
                            <h6 class="name">User Name</h6>

                            <p>
                              <i class="mdi mdi-star"></i>
                              <span class="rating"
                                ><strong>4</strong> of 5</span
                              >
                              <span class="date">20 Nov 2019 22:01</span>
                            </p>
                          </div>
                        </div>
                        <div class="comment-user-text">
                          <p>
                            Good headphones. The sound is clear. AND the bottoms
                            repyat and top ring. Currently are really not taken.
                            For me quiet. With my Beats of course can not be
                            compared. But for the money and definitely
                            recommend. The one who took happy as an elephant.
                            Product as advertised, looks good Quality, sound is
                            not the best but because of cost-benefit ratio it
                            seems very good to me, recommended the seller .
                          </p>
                          <ul class="comment-meta">
                            <li>
                              <i class="mdi mdi-thumb-up"></i> <span>31</span>
                            </li>
                            <li><a href="#">Like</a></li>
                            
                          </ul>
                        </div>
                      </div>

                      
                    </li>
                    
                  </ul>
                </div>
              </div>
            </div>

            <div
              class="tab-pane fade"
              id="specifications"
              role="tabpanel"
              aria-labelledby="specifications-tab"
            >
              <div class="specifications-wrapper">
                <div class="row">
                  <div class="col-lg-8">
                    <div class="reviews-title">
                      <h4 class="title">Oculus VR</h4>
                    </div>
                    <div class="mb-15 pt-30">
                      <table class="table table-hover table-striped-columns table-bordered">
                        <thead>
                          <tr>
                            <th scope="col">Specification</th>
                            <th scope="col">Details</th>
                            
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                                Name
                            </td>
                            <td>
                              Samsung
                            </td>
                          </tr>
                          <tr>
                            <td>
                               Model
                            </td>
                            <td>
                              A23
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    
                    
                  </div>
                </div>
              </div>
            </div>


              <div
              class="tab-pane fade"
              id="video"
              role="tabpanel"
              aria-labelledby="video-tab"
            >
              <div class="specifications-wrapper">
                <div class="row">
                  <div class="col-lg-8">
                    
                    <div class="mb-15 pt-30">
                       <div class="links">
                            <h4>Video-based:</h4>
                            <ul id="video-popups">
                              <li><a class="video-popup" href="https://www.youtube.com/watch?v=zpOULjyy-n8" data-effect="mfp-zoom-out">Zoom-out Video</a></li>
                            </ul>
                          </div>
                        
                    </div>
        
        
                  </div>
                </div>
              </div>
            </div>


          </div>
        </div>
      </div>
    </section>
    <script>
        $(document).ready(function () {
            $('.video-popup').magnificPopup({
                type: 'iframe',
                mainClass: 'mfp-zoom-out',
                removalDelay: 300,
                preloader: false,
                fixedContentPos: false
            });
        });

    </script>

    

</asp:Content>
