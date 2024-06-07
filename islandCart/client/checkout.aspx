<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="islandCart.client.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="checkout-wrapper pt-50">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
             <div class="checkout-steps-form-style-1 mt-50">
              <ul >
                <li>
                  <h6
                    class="title">
                    Your Personal Details
                  </h6>
                  <section
                    class="checkout-steps-form-content collapse show"
                    id="collapseThree"
                    aria-labelledby="headingThree"
                    
                  >
                    <div class="row">
                      <div class="col-md-6">
                          <div class="single-form form-default">
                            <label>First name</label>
                            <div class="form-input form">
                                <asp:TextBox runat="server" ID="txtFn" placeholder="First name"/>
                             
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="single-form form-default">
                            <label>Last name</label>
                            <div class="form-input form">
                                <asp:TextBox runat="server" ID="txtLn" placeholder="Last name" />
                              
                            </div>
                          </div>
                        </div>
                       
                      
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Email Address</label>
                          <div class="form-input form">
                              <asp:TextBox runat="server" ID="txtEmail" placeholder="Email Address" TextMode="Email"/>
                           
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>Phone Number</label>
                          <div class="form-input form">
                              <asp:TextBox runat="server"  ID="txtPhone" placeholder="59****"/>
                            
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="single-form form-default">
                          <label>Delivery  Address</label>
                          <div class="form-input form">
                              <asp:TextBox runat="server" ID="txtAddress" placeholder="Address"/>
                          
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="single-form form-default">
                          <label>City</label>
                          <div class="form-input form">
                              <asp:TextBox runat="server" ID="txtCity" placeholder="City" list="datalistOptions"/>
                            <datalist id="datalistOptions">
                              <option value="Port Louis">
                              <option value="Beau Bassin-Rose Hill">
                              <option value="Vacoas-Phoenix">
                              <option value="Curepipe">
                              <option value="Quatre Bornes">
                              <option value="Triolet">
                              <option value="Goodlands">
                              <option value="Centre de Flacq">
                              <option value="Bel Air">
                              <option value="Mahebourg">
                              <option value="Saint Pierre">
                              <option value="Grand Baie">
                              <option value="Bambous">
                              <option value="Le Hochet">
                              <option value="Terre Rouge">
                            </datalist>
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
                      <div class="col-md-12">
                        <div class="single-form form-default">
                          <label>Additional Information</label>
                          <div class="form-input form">
                              <asp:TextBox runat="server" TextMode="MultiLine"  rows="3"/>
                           
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
                                             <p class="price">Rs&nbsp<%# Eval("product_price") %></p>
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
                            <p class="price">Rs&nbsp<asp:Label ID="lblTotalPrice" runat="server"  /></p>
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

               

                

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</asp:Content>
