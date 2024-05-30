<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="islandCart.client.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
    <style>
       

        html {
  scroll-behavior: smooth;
}
/*===== All Product Style 3 =====*/
.product-style-3 .product-image {
    position: relative;
}

.product-style-3 .product-image .product-item img {
    width: 260px;
}


    .product-style-3 .product-image .slick-arrow{
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        transition: all 0.3s linear;
        bottom: auto;
        left: 4px;
        width: 40px;
        height: 30px;
        line-height: 32px;
        text-align: center;
        color: rgba(0, 0, 0, 0.38);
        font-size: 32px;
        z-index: 5;
        cursor: pointer;
       
    }

      
    .product-style-3 .product-image .add-wishlist {
        width: 6px;
        height: 6px;
        line-height: 40px;
        text-align: center;
        font-size: 24px;
        color: #E14C7B;
        position: absolute;
        top: 5px;
        left: 15px;
        z-index: 9;
        transition: all 0.3s linear;
    }

        .product-style-3 .product-image .add-wishlist:hover {
            color: #542DED;
        }

.product-style-3 .product-content {
    background-color: #fff;
    position: relative;
    z-index: 5;
    padding: 20px 20px;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-3 .product-content {
        padding: 20px 15px 25px;
    }
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
    .product-style-3 .product-content {
        padding: 20px 15px 25px;
    }
}

@media (max-width: 767px) {
    .product-style-3 .product-content {
        padding: 20px 10px 25px;
    }
}

.product-style-3 .product-content .title a {
    font-weight: 500;
    font-size: 24px;
    line-height: 30px;
    color: #000;
    transition: all 0.3s linear;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-3 .product-content .title a {
        font-size: 20px;
    }
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
    .product-style-3 .product-content .title a {
        font-size: 20px;
    }
}

@media (max-width: 767px) {
    .product-style-3 .product-content .title a {
        font-size: 18px;
    }
}

.product-style-3 .product-content .title a:hover {
    color: #542DED;
}

.product-style-3 .product-content p {
    color: rgba(0, 0, 0, 0.74);
    font-size: 16px;
    line-height: 22px;
    font-weight: 400;
    margin-top: 8px;
}

.product-style-3 .product-content .product-price-cart {
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

    .product-style-3 .product-content .product-price-cart .price {
        font-weight: 500;
        font-size: 24px;
        color: #E14C7B;
        line-height: 30px;
        margin-top: 16px;
    }

    .product-style-3 .product-content .product-price-cart .main-btn {
        margin-top: 16px;
        font-weight:500;
        letter-spacing: 0;
        text-transform: capitalize;
       
    }
 
 /*===== All Product Style 9 =====*/
.product-style-9 {
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    align-items: center;
    background-color: #FAFAFA;
}

@media (max-width: 767px) {
    .product-style-9 {
        display: block;
    }
}

@media only screen and (min-width: 576px) and (max-width: 767px) {
    .product-style-9 {
        display: -moz-flex;
        display: -ms-flex;
        display: -o-flex;
        display: flex;
    }
}

.product-style-9 .product-image {
    position: relative;
    max-width: 240px;
    width: 100%;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-image {
        max-width: 200px;
    }
}

@media (max-width: 767px) {
    .product-style-9 .product-image {
        max-width: 100%;
    }
}

@media only screen and (min-width: 576px) and (max-width: 767px) {
    .product-style-9 .product-image {
        max-width: 240px;
    }
}

.product-style-9 .product-image .product-item img {
    width: 100%;
}

.product-style-9 .product-image .slick-arrow {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    transition: all 0.3s linear;
    bottom: auto;
    left: 4px;
    width: 32px;
    height: 32px;
    line-height: 32px;
    text-align: center;
    color: rgba(0, 0, 0, 0.38);
    font-size: 32px;
    z-index: 5;
    cursor: pointer;
}

    .product-style-9 .product-image .slick-arrow:hover {
        color: #000;
    }

    .product-style-9 .product-image .slick-arrow.next {
        right: 4px;
        left: auto;
    }

.product-style-9 .product-content {
    position: relative;
    z-index: 3;
    padding: 20px 25px 25px;
    flex: 1;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content {
        padding: 20px 15px 25px;
    }
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
    .product-style-9 .product-content {
        padding: 20px 15px 25px;
    }
}

@media (max-width: 767px) {
    .product-style-9 .product-content {
        padding: 20px 10px 25px;
    }
}

.product-style-9 .product-content .product-meta li {
    display: inline-block;
}

    .product-style-9 .product-content .product-meta li + li {
        margin-left: 16px;
    }

    .product-style-9 .product-content .product-meta li a {
        color: #4C4C4C;
        font-weight: 500;
        font-size: 16px;
        line-height: 22px;
        transition: all 0.3s linear;
    }

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .product-meta li a {
        font-size: 14px;
        line-height: 20px;
    }
}

.product-style-9 .product-content .product-meta li a:hover {
    color: #542DED;
}

.product-style-9 .product-content .product-meta li span {
    font-weight: 500;
    font-size: 16px;
    line-height: 22px;
    color: #4C4C4C;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .product-meta li span {
        font-size: 14px;
        line-height: 20px;
    }
}

.product-style-9 .product-content .product-meta li span i {
    color: #7D7D7D;
    font-size: 20px;
}

    .product-style-9 .product-content .product-meta li span i.ration-on {
        color: #FFBE27;
    }

.product-style-9 .product-content .title a {
    font-weight: 500;
    font-size: 24px;
    line-height: 30px;
    color: #000;
    transition: all 0.3s linear;
    margin-top: 8px;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .title a {
        line-height: 22px;
    }
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .title a {
        font-size: 20px;
    }
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
    .product-style-9 .product-content .title a {
        font-size: 20px;
    }
}

@media (max-width: 767px) {
    .product-style-9 .product-content .title a {
        font-size: 18px;
    }
}

.product-style-9 .product-content .title a:hover {
    color: #542DED;
}

.product-style-9 .product-content p {
    color: rgba(0, 0, 0, 0.74);
    font-size: 14px;
    line-height: 22px;
    font-weight: 400;
    margin-top: 8px;
}

.product-style-9 .product-content .product-price-btn {
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

    .product-style-9 .product-content .product-price-btn .price {
        font-weight: 500;
        font-size: 24px;
        color: #E14C7B;
        line-height: 30px;
        margin-top: 16px;
        display: block;
        margin-right: 16px;
    }

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .product-price-btn .price {
        font-size: 20px;
        margin-right: 8px;
        margin-top: 8px;
    }
}

.product-style-9 .product-content .product-price-btn .main-btn {
    margin-top: 16px;
    font-weight: 700;
    letter-spacing: 0;
    text-transform: capitalize;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
    .product-style-9 .product-content .product-price-btn .main-btn {
        margin-top: 8px;
    }
}

.two-column-carousel-wrapper {
  padding-bottom: 60px;
  margin: 0px -10px;
}

.two-column-carousel-wrapper .row {
  margin-right: 0;
  margin-left: 0;
}

.two-column-carousel-wrapper .tns-nav {
  position: absolute;
  width: 100%;
  bottom: 0px;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2;
}

.two-column-carousel-wrapper .tns-nav button {
  width: 12px;
  height: 12px;
  border: 2px solid #542DED;
  background: none;
  border-radius: 50%;
  margin: 5px;
}

.two-column-carousel-wrapper .tns-nav button.hover, .two-column-carousel-wrapper .tns-nav button.tns-nav-active {
  background: #542DED;
}

    </style>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     

      <main >

      <%-- <section

        class="content-card-style-10 bg_cover "
        style="background-image: url(/assets/images/homeHeader/banner.jpg)">


        
      </section>--%>

          <section>
               <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
            <div   class="content-card-style-10 bg_cover " style="background-image: url(/assets/images/homeHeader/banner.jpg); "></div>
        </div>
        <div class="carousel-item" data-bs-interval="10000">
              <div   class="content-card-style-10 bg_cover " style="background-image: url(/assets/images/homeHeader/banner-fashion-1.jpg); overflow:hidden;" ></div>
        </div>
        <div class="carousel-item" data-bs-interval="10000">
               <div   class="content-card-style-10 bg_cover " style="background-image: url(/assets/images/homeHeader/banner-fashion-2.jpg); overflow:hidden"></div>
        </div>
      </div>
      
      
    </div>
          </section>

          


      
           <section class="feature-wrapper pt-70">
           <div class="container">
             <div class="row">
               <div class="col-md-12">
                 <h2 class="feature-7-title text-center">Browse Our Categories </h2>
                    <span class="separator"></span>
               </div>
             </div>
         </div>
    </section>

 <section class="product-wrapper pt-1">
   <div class="container">
     <div class="three-column-carousel-wrapper" >
       <div class="row three-column-carousel category-carousel justify-content-center" style="width:350rem;">
            <!-- Repeat for other items -->
           <asp:Repeater runat="server" ID="rptCategory">
               <ItemTemplate>
                      <div class="col-md-5">
                          <div class="product-category appear-animate" data-animation-name="fadeInUpShorter">
                              <asp:HyperLink runat="server" ID="hypCategory"  CssClass="d-flex align-items-center flex-column">
                                    <asp:image ImageUrl='<%# String.Format("{0}{1}", Eval("filePath"), Eval("categoryImage")) %>' runat="server" width="110" height="110" CssClass="product-category-img" style="border-radius:50%; overflow:hidden; object-fit:cover;"/>
                                  <div class="category-content text-capitalize">
                                      <h4 class="mt-3"><%# Eval ("Category_name") %></h4>
                                   </div>
                              </asp:HyperLink>
                          </div>
                     </div>
               </ItemTemplate>
           </asp:Repeater>
      
            <!-- Repeat for other items -->
         </div>
        
     </div>
   </div>
 </section>


              <section class="feature-wrapper pt-70 ">
                  <div class="container ">
                    <div class="row ">
                      <div class="col-md-12 ">
                        <h2 class="feature-7-title text-center">Our Best Seller</h2>
                      </div>
                    </div>
                </div>
            </section>
           <!--====== Product Style 9 Part Start ======-->

    <section class="product-wrapper  pt-20 mb-30">
      <div class="container">
          <div class="two-column-carousel-wrapper position-relative">
          <div class="row two-column-carousel">
          <div class="col-lg-6">
            <div class="product-style-9 flex-row-reverse mt-30">
              <div class="product-image">
                <div class="product-item active">
                    <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>
                  
                </div>
              </div>
              <div class="product-content">
                <ul class="product-meta">
                  <li>
                    <a class="add-wishlist" href="#0">
                      <i class="mdi mdi-heart-outline"></i>
                           Add To Favourite
                      </a>
                  </li>
                  <li>
                    <span>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star"></i>
                    </span>
                  </li>
                </ul>
                <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
                <p>
                  The largest Apple Watch display yet. Electrical heart sensor.
                  Re-engineered Digital Crown with haptic...
                </p>
                <div class="product-price-btn">
                   <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
                     <a href="#0" class="main-btn primary-btn">
                         <i class="mdi mdi-cart"></i> Add
                       to Cart</a>
                </div>
              </div>
            </div>
          </div>
                <div class="col-lg-6">
   <div class="product-style-9 flex-row-reverse mt-30">
     <div class="product-image">
       <div class="product-item active">
           <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>
         
       </div>
     </div>
     <div class="product-content">
       <ul class="product-meta">
         <li>
           <a class="add-wishlist" href="#0">
             <i class="mdi mdi-heart-outline"></i>
                  Add To Favourite
             </a>
         </li>
         <li>
           <span>
             <i class="mdi mdi-star ration-on"></i>
             <i class="mdi mdi-star ration-on"></i>
             <i class="mdi mdi-star ration-on"></i>
             <i class="mdi mdi-star ration-on"></i>
             <i class="mdi mdi-star"></i>
           </span>
         </li>
       </ul>
       <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
       <p>
         The largest Apple Watch display yet. Electrical heart sensor.
         Re-engineered Digital Crown with haptic...
       </p>
       <div class="product-price-btn">
          <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
            <a href="#0" class="main-btn primary-btn">
                <i class="mdi mdi-cart"></i> Add
              to Cart</a>
       </div>
     </div>
   </div>
 </div>
               
          <div class="col-lg-6">
            <div class="product-style-9 flex-row-reverse mt-30">
              <div class="product-image">
                <div class="product-item active">
                    <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>

                </div>
              </div>
              <div class="product-content">
                <ul class="product-meta">
                  <li>
                    <a class="add-wishlist" href="#0">
                      <i class="mdi mdi-heart-outline"></i>
                      Add To Favourite
                    </a>
                  </li>
                  <li>
                    <span>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star ration-on"></i>
                      <i class="mdi mdi-star"></i>
                    </span>
                  </li>
                </ul>
                <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
                <p>
                    The largest Apple Watch display yet. Electrical heart sensor.
                    Re-engineered Digital Crown with haptic...
                </p>
                <div class="product-price-btn">
                  <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
                  <a href="#0" class="main-btn primary-btn">
                      <i class="mdi mdi-cart"></i> Add
                    to Cart</a>
                </div>
              </div>
            </div>
          </div>
                <div class="col-lg-6">
    <div class="product-style-9 flex-row-reverse mt-30">
      <div class="product-image">
        <div class="product-item active">
            <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>

        </div>
      </div>
      <div class="product-content">
        <ul class="product-meta">
          <li>
            <a class="add-wishlist" href="#0">
              <i class="mdi mdi-heart-outline"></i>
              Add To Favourite
            </a>
          </li>
          <li>
            <span>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star"></i>
            </span>
          </li>
        </ul>
        <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
        <p>
             The largest Apple Watch display yet. Electrical heart sensor.
                Re-engineered Digital Crown with haptic...
        </p>
        <div class="product-price-btn">
          <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
          <a href="#0" class="main-btn primary-btn">
              <i class="mdi mdi-cart"></i> Add
            to Cart</a>
        </div>
      </div>
    </div>
  </div>
                <div class="col-lg-6">
    <div class="product-style-9 flex-row-reverse mt-30">
      <div class="product-image">
        <div class="product-item active">
            <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>

        </div>
      </div>
      <div class="product-content">
        <ul class="product-meta">
          <li>
            <a class="add-wishlist" href="#0">
              <i class="mdi mdi-heart-outline"></i>
              Add To Favourite
            </a>
          </li>
          <li>
            <span>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star"></i>
            </span>
          </li>
        </ul>
        <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
        <p>
             The largest Apple Watch display yet. Electrical heart sensor.
            Re-engineered Digital Crown with haptic...
        </p>
        <div class="product-price-btn">
          <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
          <a href="#0" class="main-btn primary-btn">
              <i class="mdi mdi-cart"></i> Add
            to Cart</a>
        </div>
      </div>
    </div>
  </div>
                <div class="col-lg-6">
    <div class="product-style-9 flex-row-reverse mt-30">
      <div class="product-image">
        <div class="product-item active">
            <asp:Image ImageUrl="~/assets/images/product/product-2.jpg" runat="server" width="190px"/>

        </div>
      </div>
      <div class="product-content">
        <ul class="product-meta">
          <li>
            <a class="add-wishlist" href="#0">
              <i class="mdi mdi-heart-outline"></i>
              Add To Favourite
            </a>
          </li>
          <li>
            <span>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star ration-on"></i>
              <i class="mdi mdi-star"></i>
            </span>
          </li>
        </ul>
        <h4 class="title"><a href="#0">Metro 38 Date</a></h4>
        <p>
             The largest Apple Watch display yet. Electrical heart sensor.
   Re-engineered Digital Crown with haptic...
        </p>
        <div class="product-price-btn">
          <span class="price me-3 text-secondary" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
          <a href="#0" class="main-btn primary-btn">
              <i class="mdi mdi-cart"></i> Add
            to Cart</a>
        </div>
      </div>
    </div>
  </div>


        </div>

     </div>
      </div>
    </section>

    <!--====== Product Style 9 Part Ends ======-->
   <%-- <section class="product-wrapper pt-5">
      <div class="container">
        <div class="three-column-carousel-wrapper">
          <div class="row three-column-carousel new-carousel">
            <div class="col-md-3 col-lg-3 col-sm-6 ">
              <div class="product-style-1 mt-30">
                <div class="product-image">
                <div class="product-item active">
                    <img
                     src="/assets/images/product/product-1.jpg"
                    alt="product"
                  />
                </div>
                <a class="add-wishlist" href="#0">
                  <i class="mdi mdi-heart-outline"></i>
                </a>
              </div>
              <div class="product-content text-center" >
                <p class="text-light">Watch</p>
                <h4 class="title"><a href="#0">Metro 38 Date</a></h4>

                <div class="d-flex justify-content-center text-dark">
                  <p class="text-decoration-line-through pe-2 text-secondary fw-semibold fs-6">Rs 250</p>
                  <p class="fw-bold fs-6">Rs 50</p>
                </div>
                
                <a href="#0" class="main-btn gray-btn">
                  Add To Cart</a>
                
              </div>
          
            </div>
          </div>
          <div class="col-md-4 col-lg-4 col-sm-6 ">
            <div class="product-style-1 mt-30">
              <div class="product-image">
              <div class="product-item active">
                  <img
                    src="/assets/images/product/product-1.jpg"
                  alt="product"
                />
              </div>
              <a class="add-wishlist" href="#0">
                <i class="mdi mdi-heart-outline"></i>
              </a>
            </div>
            <div class="product-content text-center" >
              <p class="text-light">Watch</p>
              <h4 class="title"><a href="#0">Metro 38 Date</a></h4>

              <div class="d-flex justify-content-center text-dark">
                <p class="text-decoration-line-through pe-2 text-secondary fw-semibold fs-6">Rs 250</p>
                <p class="fw-bold fs-6">Rs 50</p>
              </div>
              
              <a href="#0" class="main-btn gray-btn">
                Add To Cart</a>
              
            </div>
        
          </div>
        </div>
        <div class="col-md-4 col-lg-4 col-sm-6 ">
          <div class="product-style-1 mt-30">
            <div class="product-image">
            <div class="product-item active">
                <img
                src="/assets/images/product/product-1.jpg"
                alt="product"
              />
            </div>
            <a class="add-wishlist" href="#0">
              <i class="mdi mdi-heart-outline"></i>
            </a>
          </div>
          <div class="product-content text-center" >
            <p class="text-light">Watch</p>
            <h4 class="title"><a href="#0">Metro 38 Date</a></h4>

            <div class="d-flex justify-content-center text-dark">
              <p class="text-decoration-line-through pe-2 text-secondary fw-semibold fs-6">Rs 250</p>
              <p class="fw-bold fs-6">Rs 50</p>
            </div>
            
            <a href="#0" class="main-btn gray-btn">
              Add To Cart</a>
            
          </div>
      
        </div>
      </div>
      <div class="col-md-4 col-lg-4 col-sm-6 ">
        <div class="product-style-1 mt-30">
          <div class="product-image">
          <div class="product-item active">
              <img
                src="/assets/images/product/product-1.jpg"
              alt="product"
            />
          </div>
          <a class="add-wishlist" href="#0">
            <i class="mdi mdi-heart-outline"></i>
          </a>
        </div>
        <div class="product-content text-center" >
          <p class="text-light">Watch</p>
          <h4 class="title"><a href="#0">Metro 38 Date</a></h4>

          <div class="d-flex justify-content-center text-dark">
            <p class="text-decoration-line-through pe-2 text-secondary fw-semibold fs-6">Rs 250</p>
            <p class="fw-bold fs-6">Rs 50</p>
          </div>
          
          <a href="#0" class="main-btn gray-btn">
            Add To Cart</a>
          
        </div>
    
      </div>
    </div>
          </div>
        </div>
      </div>
    </section>--%>



   

       <section class="feature-wrapper pt-70 ">
       <div class="container ">
         <div class="row ">
           <div class="col-md-12 ">
             <h2 class="feature-7-title text-center">New Arrivals</h2>
           </div>
         </div>
     </div>
    </section>
    

              <section class="product-wrapper pt-20 mb-30">
            <div class="container ">
                <ul class="nav nav-pills mb-3 justify-content-center" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all" aria-selected="true">Electronics</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-category1-tab" data-bs-toggle="pill" data-bs-target="#pills-category1" type="button" role="tab" aria-controls="pills-category1" aria-selected="false">Clothing</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-category2-tab" data-bs-toggle="pill" data-bs-target="#pills-category2" type="button" role="tab" aria-controls="pills-category2" aria-selected="false">Home & Kitchen</button>
                    </li>

                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-category3-tab" data-bs-toggle="pill" data-bs-target="#pills-category3" type="button" role="tab" aria-controls="pills-category3" aria-selected="false">Sport & Outdoors</button>
                    </li>
                    <!-- Add more categories if needed -->
                </ul>
                
                    <div class="tab-content " id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
                            <div class="row justify-content-center">
                                <div class="col-lg-3 col-sm-3 ">
                                    <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
                                    <div class="product-image">
                                        <div class="product-item active text-center">
                                        <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
                                        </div>
                                        <a class="add-wishlist" href="#0">
                                        <i class="mdi mdi-heart"></i>
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <h4 class="title"><a href="#0">Text</a></h4>
                                        <p>Reference 1102</p>
                                        <div class="product-price-cart">
                                        <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
                                        <a href="#0" class="main-btn primary-btn me-2">
                                           <i class="mdi mdi-cart"></i></a
                                        >
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-3 ">
    <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
    <div class="product-image">
        <div class="product-item active text-center">
        <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
        </div>
        <a class="add-wishlist" href="#0">
        <i class="mdi mdi-heart"></i>
        </a>
    </div>
    <div class="product-content">
        <h4 class="title"><a href="#0">Text</a></h4>
        <p>Reference 1102</p>
        <div class="product-price-cart">
        <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
        <a href="#0" class="main-btn primary-btn me-2">
           <i class="mdi mdi-cart"></i></a
        >
        </div>
    </div>
    </div>
</div>
                                <div class="col-lg-3 col-sm-3 ">
    <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
    <div class="product-image">
        <div class="product-item active text-center">
        <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
        </div>
        <a class="add-wishlist" href="#0">
        <i class="mdi mdi-heart"></i>
        </a>
    </div>
    <div class="product-content">
        <h4 class="title"><a href="#0">Text</a></h4>
        <p class="text-capitalize">Smart Watch</p>
        <div class="product-price-cart">
        <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
        <a href="#0" class="main-btn primary-btn me-2">
           <i class="mdi mdi-cart"></i></a
        >
        </div>
    </div>
    </div>
</div>
                                
                            </div>

                            <div class="row justify-content-center">
                        <div class="col-lg-3 col-sm-3 ">
                            <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
                            <div class="product-image">
                                <div class="product-item active text-center">
                                <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
                                </div>
                                <a class="add-wishlist" href="#0">
                                <i class="mdi mdi-heart"></i>
                                </a>
                            </div>
                            <div class="product-content">
                                <h4 class="title"><a href="#0">Text</a></h4>
                                <p>Reference 1102</p>
                                <div class="product-price-cart">
                                <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
                                <a href="#0" class="main-btn primary-btn me-2">
                                   <i class="mdi mdi-cart"></i></a
                                >
                                </div>
                            </div>
                            </div>
                        </div>
                                <div class="col-lg-3 col-sm-3 ">
    <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
    <div class="product-image">
        <div class="product-item active text-center">
        <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
        </div>
        <a class="add-wishlist" href="#0">
        <i class="mdi mdi-heart"></i>
        </a>
    </div>
    <div class="product-content">
        <h4 class="title"><a href="#0">Text</a></h4>
        <p>Reference 1102</p>
        <div class="product-price-cart">
        <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
        <a href="#0" class="main-btn primary-btn me-2">
           <i class="mdi mdi-cart"></i></a
        >
        </div>
    </div>
    </div>
</div>
                                <div class="col-lg-3 col-sm-3 ">
    <div class="product-style-3 mt-30 shadow-lg bg-body-tertiary">
    <div class="product-image">
        <div class="product-item active text-center">
        <asp:Image ImageUrl="~/assets/images/product/product-1.jpg" runat="server" cssClass="hide-bg"/>
        </div>
        <a class="add-wishlist" href="#0">
        <i class="mdi mdi-heart"></i>
        </a>
    </div>
    <div class="product-content">
        <h4 class="title"><a href="#0">Text</a></h4>
        <p>Reference 1102</p>
        <div class="product-price-cart">
        <span class="price me-3" style="display:inline-block; white-space:nowrap; margin-right:10px;">Rs 15999.99</span>
           
        <a href="#0" class="main-btn primary-btn me-2">
           <i class="mdi mdi-cart"></i></a
        >
        </div>
    </div>
    </div>
</div>
                    </div>



                          </div>
                        <div class="tab-pane fade" id="pills-category1" role="tabpanel" aria-labelledby="pills-category1-tab">
                            
                        </div>
                        <div class="tab-pane fade" id="pills-category2" role="tabpanel" aria-labelledby="pills-category2-tab">
                            <div class="row">
                                <!-- Display Category 2 products here -->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-category3" role="tabpanel" aria-labelledby="pills-category3-tab">
                            <div class="row">
                                <!-- Display Category 3 products here -->
                            </div>
                        </div>
                    
                    </div>
               
               
             
            </div>

                  
        </section>



    <div class="banner banner-big-sale appear-animate p-5" data-animation-delay="200" data-animation-name="fadeInUpShorter" style="background: #2A95CB center/cover url('/assets/images/banners/pexels-johannes-plenio-1103970.jpg">
      <div class="banner-content row align-items-center mx-0">
          <div class="col-md-9 col-sm-8">
              <h2 class="text-white text-uppercase text-center text-sm-left ls-n-20 mb-md-0 px-4">
                  <b class="d-inline-block mr-3 mb-1 mb-md-0">Big Sale</b> All new fashion brands items up to 70% off
                  <small class="text-transform-none align-middle">Online Purchases Only</small>
              </h2>
          </div>
          <div class="col-md-3 col-sm-4 text-center text-sm-right">
              <a class="btn btn-light btn-white btn-lg" href="category.html">View Sale</a>
          </div>
      </div>
    </div>

 <section class="cta-style-3 mt-70">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 col-md-12 pl-0 pt-70 pr-5">
            <div class="cta-style-3-img mb-30">
               <img src="https://live.staticflickr.com/65535/53716328634_ea400e3635_c.jpg" width="450" height="450" alt="courier-image"/>
            </div>
          </div>
          <div class="col-lg-6 col-md-12 pl-4">
            <div class="cta-content mb-30">
              <h3 class="mb-20">Deliver Joy, Earn Rewards, Apply Now!</h3>
             <p class="mb-30">
                Join our team of dedicated couriers and experience the satisfaction of delivering joy to our customers' doorsteps. As a valued member of our network, you'll not only spread smiles but also unlock exciting rewards along the way. Whether it's ensuring timely deliveries or going the extra mile to exceed expectations, every effort counts towards making a difference. Apply now and embark on a rewarding journey with us!
            </p>
              <a class="main-btn primary-btn" href="Javascript:void(0)">
               
                Join Us
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>




  <section class="testimonial-wrapper pt-60 pb-60 mt-50 bg-white-light">
    <div class="container">
      <div class="row">
        <div class="mx-auto col-lg-6">
          <div class="testimonial-title-2">
            <span>Testimonials</span>
            <h1>What clients Say?</h1>
            <span class="separator"></span>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="mx-auto col-lg-8 col-md-11 testimonial-style-3-wrapper">
          <div class="testimonial-style-3-active">
            
            
            
            <div class="testimonial-style-3">
              <div class="testimonial-img">
                <img
                  src="assets/images/testimonial/testimonial-1.svg"
                  alt="Image"
                />
              </div>
              <div class="testimonial-content">
                <p>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Ipsam perspiciatis provident voluptatibus corporis pariatur
                  ullam facere excepturi obcaecati, eveniet porro earum itaque
                  nesciunt inventore expedita id? Ea quo temporibus nostrum.
                </p>
              </div>
              <div class="testimonial-info">
                <h3>Sarah A. K.</h3>
                <span>
                  <i class="mdi mdi-star text-warning"></i>
                  <i class="mdi mdi-star text-warning"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                </span>
              </div>
            </div>
            <div class="testimonial-style-3">
              <div class="testimonial-img">
                <img
                  src="assets/images/testimonial/testimonial-2.svg"
                  alt="Image"
                />
              </div>
              <div class="testimonial-content">
                <p>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Ipsam perspiciatis provident voluptatibus corporis pariatur
                  ullam facere excepturi obcaecati, eveniet porro earum itaque
                  nesciunt inventore expedita id? Ea quo temporibus nostrum.
                </p>
              </div>
              <div class="testimonial-info">
                <h3>David Smith</h3>
                <span>
                  <i class="mdi mdi-star text-warning"></i>
                  <i class="mdi mdi-star text-warning"></i>
                  <i class="mdi mdi-star  text-warning"></i>
                  <i class="mdi mdi-star  text-warning"></i>
                  <i class="mdi mdi-star"></i>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="color-section mt-5 pt-15 pb-15">
    <div class="container">
      <div class="row text-center">
        <div class="col-md-3">
          <h3 class="count-to text-primary mb-0" style="font-size: 3.3rem;" data-fromvalue="0"
            data-tovalue="19000" data-duration="3000"  data-append="+">45</h3>
          <p style="font-size: 1.5rem;">Satisfied Customers</p>
        </div>
        <div class="col-md-3">
          <h3 class="count-to text-danger mb-0" style="font-size: 3.3rem;" data-fromvalue="0"
            data-tovalue="15" data-duration="3000">50</h3>
          <p style="font-size: 1.5rem;">Popular Products</p>
        </div>
        <div class="col-md-3">
          <h3 class="count-to text-info mb-0" style="font-size: 3.3rem;" data-fromvalue="0"
            data-tovalue="352" data-duration="3000">50</h3>
          <p style="font-size: 1.5rem;">Vast Category</p>
        </div>
        <div class="col-md-3">
          <h3 class="count-to text-dark mb-0" style="font-size: 3.3rem;" data-fromvalue="0"
            data-tovalue="178" data-duration="3000">15</h3>
          <p style="font-size: 1.5rem;">Years Of Service</p>
        </div>
      </div>
    </div>

    </section>
        


    </main>


</asp:Content>
