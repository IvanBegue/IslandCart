<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="islandCart.client.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="checkout-wrapper pt-50">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
             <div class="checkout-steps-form-style-1 mt-50">
              <ul id="accordionExample">
                <li>
                  <h6
                    class="title"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseThree"
                    aria-expanded="true"
                    aria-controls="collapseThree"
                  >
                    Your Personal Details
                  </h6>
                  <section
                    class="checkout-steps-form-content collapse show"
                    id="collapseThree"
                    aria-labelledby="headingThree"
                    data-bs-parent="#accordionExample"
                  >
                    <div class="row">
                      <div class="col-md-12">
                        <div class="single-form form-default">
                          <label>User Name</label>
                          <div class="row">
                            <div class="col-md-6 form-input form">
                              <input type="text" placeholder="First Name" />
                            </div>
                            <div class="col-md-6 form-input form">
                              <input type="text" placeholder="Last Name" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Email Address</label>
                          <div class="form-input form">
                            <input type="text" placeholder="Email Address" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Phone Number</label>
                          <div class="form-input form">
                            <input type="text" placeholder="Phone Number" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="single-form form-default">
                          <label>Delivery  Address</label>
                          <div class="form-input form">
                            <input type="text" placeholder="Delivery Address" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>City</label>
                          <div class="form-input form">
                            <input type="text" placeholder="City" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Post Code</label>
                          <div class="form-input form">
                            <input type="text" placeholder="Post Code" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Country</label>
                          <div class="form-input form">
                            <input type="text" placeholder="Country" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="select-elements select-style-2 mt-30">
                          <label>Region/State</label>
                          <div class="select-items select">
                            <div class="select-position">
                              <select style="padding: 0px 15px">
                                <option value="0">Select</option>
                                <option value="1">Select option 01</option>
                                <option value="2">Select option 02</option>
                                <option value="3">Select option 03</option>
                                <option value="4">Select option 04</option>
                                <option value="5">Select option 05</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="single-checkbox checkbox-style-3">
                          <input type="checkbox" id="checkbox-3" />
                          <label for="checkbox-3"><span></span></label>
                          <p>save my delivery address for later</p>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="single-form">
                            <asp:Button Text="Proceed To Payment" runat="server" 
                                ID="btnPay" 
                                CssClass="vjsteps_nxt main-btn primary-btn"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseFour"
                                aria-expanded="false"
                                aria-controls="collapseFour"
                                OnClick="btnPay_Click"/>
                        </div>
                      </div>
                    </div>
                  </section>
                </li>
               

              </ul>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="checkout-sidebar-accordion mt-50">
              <div class="accordion" id="accordionExample">
                <div class="card">
                  <div class="card-header" id="headingOne">
                    <a
                      href="javascript:void(0)"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapseOne"
                      aria-expanded="true"
                      aria-controls="collapseOne"
                      >Selected Products</a
                    >
                  </div>

                  <div
                    id="collapseOne"
                    class="collapse show"
                    aria-labelledby="headingOne"
                    data-parent="#accordionExample"
                  >
                    <div class="card-body">
                      <div class="checkout-table table-responsive">
                        <table class="table">
                          <tbody>
                              <asp:Repeater runat="server" ID="rptCheckoutCart">
                                  <ItemTemplate>
                                       <tr>
                                           <td class="checkout-product">
                                             <div class="product-cart d-flex">
                                               <div class="product-thumb">
                                                    <asp:Image ImageUrl='<%# Eval("fileName") %>' runat="server" width="80px"/>
                                               </div>
                                               <div class="product-content media-body">
                                                 <h5 class="title">
                                                   <a href="#0"><%# Eval("product_name") %></a>
                                                 </h5>
                                                 <ul>
                                                   <%--<li><span>Brown</span></li>
                                                   <li><span>XL</span></li>--%>
                                                   <li><span><%# Eval("Quantity") %> X <%# Eval("product_price") %></span></li>
                                                 </ul>
                                               </div>
                                             </div>
                                           </td>
                                           <td class="checkout-price">
                                             <p class="price">Rs <%# Eval("product_price") %></p>
                                           </td>
                                         </tr>
                                  </ItemTemplate>
                              </asp:Repeater>
                           


                          </tbody>
                        </table>
                      </div>
                      <div class="pricing-table">
                        

                        <div class="total-payable">
                          <div class="payable-price">
                            <p class="value">Total Price:</p>
                              
                              <asp:TextBox runat="server" ID="txtTotal" Visible="false"/>
                            <p class="price">Rs<asp:Label ID="lblTotalPrice" runat="server"  /></p>
                          </div>
                        </div>

                        <div class="price-table-btn">
                          <a href="#" class="main-btn primary-btn-border"
                            >edit shopping cart</a
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card">
                  <div class="card-header" id="headingTwo">
                    <a
                      href="javascript:void(0)"
                      class="collapsed"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapseTwo"
                      aria-expanded="false"
                      aria-controls="collapseTwo"
                      >Personal Details</a
                    >
                  </div>
                  <div
                    id="collapseTwo"
                    class="collapse"
                    aria-labelledby="headingTwo"
                    data-parent="#accordionExample"
                  >
                    <div class="card-body">
                      <div class="checkout-sidebar-details">
                        <div class="single-details">
                          <p class="info">Jhone Doe</p>
                          <p class="info">doejhon@email.com</p>
                          <p class="info">+123 456 789 0234</p>
                        </div>
                        <div class="single-details">
                          <h6 class="title">Mailing Address</h6>
                          <p class="info">
                            Company Inc., 8901 Marmora Road, <br />
                            Glasgow, D04 89GR.
                          </p>
                        </div>
                        <div class="details-btn">
                          <a href="#" class="main-btn primary-btn-border"
                            >edit Information</a
                          >
                        </div>
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
</asp:Content>
