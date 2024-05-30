<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="islandCart.client.shoppingcart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
<script type="text/javascript">
    function updateQuantity(button, increment) {
        const input = button.parentElement.querySelector('input[type="text"]');
        let quantity = parseInt(input.value);

        if (isNaN(quantity)) {
            quantity = 0;
        }

        quantity += increment;

        if (quantity < 1) {
            quantity = 1;
        }

        input.value = quantity;

        const row = button.closest('tr');
        const hiddenInput = row.querySelector('input[type="hidden"]');
        hiddenInput.value = quantity; // Update hidden input with new quantity

        const priceElement = row.querySelector('.price');
        const unitPrice = parseFloat(row.getAttribute('data-unit-price'));

        if (isNaN(unitPrice)) {
            console.error('Unit price is not a number.');
            return;
        }

        const newPrice = unitPrice * quantity;
        priceElement.textContent = 'Rs ' + newPrice.toFixed(2);

        updateTotal();
    }

    function updateTotal() {
        let Subtotal = 0;
        const DeliveryCost = 200;
        const Discount = 0;

        document.querySelectorAll('tr[data-unit-price]').forEach(row => {
            const checkbox = row.querySelector('input[type="checkbox"]');
            if (checkbox && checkbox.checked) {
                const quantity = parseInt(row.querySelector('input[type="text"]').value);
                const unitPrice = parseFloat(row.getAttribute('data-unit-price'));

                if (!isNaN(quantity) && !isNaN(unitPrice)) {
                    Subtotal += unitPrice * quantity;
                }
            }
        });

        const total = Subtotal + DeliveryCost - Discount;

        document.getElementById('<%= lblSubTotal.ClientID %>').textContent = 'Rs ' + Subtotal.toFixed(2);
        document.getElementById('<%= lblDiscount.ClientID %>').textContent = 'Rs ' + Discount.toFixed(2);
        document.getElementById('<%= lblDeliveryCost.ClientID %>').textContent = 'Rs ' + DeliveryCost.toFixed(2);
        document.getElementById('<%= lblTotalPrice.ClientID %>').textContent = 'Rs ' + total.toFixed(2);
    }

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.sub').forEach(button => {
            button.addEventListener('click', function () {
                updateQuantity(this, -1);
            });
        });

        document.querySelectorAll('.add').forEach(button => {
            button.addEventListener('click', function () {
                updateQuantity(this, 1);
            });
        });
    });
</script>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <section class="checkout-wrapper pt-100">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="checkout-style-1">
          <div class="checkout-table table-responsive">
            <table class="table w-100">
              <thead>
                <tr >
                  <th class="action text-secondary">#</th>
                  <th class="product text-secondary">Product</th>
                  <th class="quantity text-secondary">Quantity</th>
                  <th class="price text-secondary">Price</th>
                  <th class="action text-secondary">Action</th>
                  
                </tr>
              </thead>
              <tbody>

                  <asp:Panel runat="server" Visible="false" ID="pnlEmpty">
                      <tr class="text-center">
                        <td colspan="4" class="align-middle">
                          <div class="d-flex flex-column justify-content-center align-items-center ">
                            <h1 class="mdi mdi-basket text-secondary" style="font-size: 10rem;"></h1>
                            <p>Empty Cart</p>
                          </div>
                        </td>
                    </tr>
                  </asp:Panel>
                  
                  <asp:Repeater runat="server" ID="rptProductCart" OnItemCommand="rptProductCart_ItemCommand" >
                      <ItemTemplate>
                          <tr data-unit-price='<%# Eval("product_price") %>'>
                              <td>
                                  <asp:CheckBox  runat="server" ID="chkProduct" value='<%# Eval("product_id") %>'  Checked="True" />
                              </td>
                              <td>
                                <div class="product-cart d-flex">
                                  <div class="product-thumb">
                                      <asp:Image ImageUrl='<%# Eval("fileName") %>' runat="server" width="80px"/>
                                  </div>
                                  <div class="product-content media-body">
                                    <h3 class="title text-capitalize me-5 mt-3">
                                  <asp:HyperLink runat="server" NavigateUrl='<%# Eval("product_id","/client/productdetails.aspx?q={0}") %>' Target="_blank" Text='<%#Eval("product_name") %>'></asp:HyperLink>

                                    </h3>
                                    <%--<span>UG 0123</span>--%>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <div class="product-quantity d-inline-flex">
                                  <button type="button" id="sub" class="sub">
                                    <i class="mdi mdi-minus"></i>
                                  </button>
                                  <input type="text" value="1" />
                                        <asp:HiddenField ID="hiddenProductQuantity" runat="server" Value="1" />
                                  <button type="button" id="add" class="add">
                                    <i class="mdi mdi-plus"></i>
                                  </button>
                                </div>
                              </td>
                                 <td class="col-2">  
                                     <p class="price ">Rs <%#Eval("product_price") %></p>
                                </td>
                              <td>
                                <ul class="action">
 
                                  <li>
                                        <asp:LinkButton runat="server" CssClass="delete"  CommandName="DeleteItem" CommandArgument='<%#Eval("product_id") %>'>
                                        <i class="mdi mdi-delete text-danger" ></i>
                                </asp:LinkButton>
                                  </li>
                                </ul>
                              </td>
                            </tr>

                      </ItemTemplate>
                  </asp:Repeater>
                

              </tbody>
            </table>
          </div>
          <div
            class="
              checkout-coupon-total checkout-coupon-total-2
              d-flex
              flex-wrap">
            <%--  <asp:Panel runat="server" ID="pnlPay" Visible="false">--%>
                   <div class="checkout-coupon">
                   <span>Do you have a giftcard ?</span>
 
                     <div class="single-form form-default d-flex">
                       <div class="form-input form">
                         <input type="text" placeholder="Redem gift" />
                       </div>
                       <button class="main-btn primary-btn">Redem</button>
                     </div>
   
                 </div>
                 <div class="checkout-total">
                   <div class="single-total">
                     <p class="value">Subotal Price:</p>
                     <p class="price">
                         <asp:Label runat="server" ID="lblSubTotal"/>

                     </p>
                   </div>
                   <div class="single-total">
                     <p class="value">Delivery Cost (+):</p>
                     <p class="price">
                         <asp:Label  runat="server" ID="lblDeliveryCost"/>
                     </p>
                   </div>
                   <div class="single-total">
                     <p class="value">Discount (-):</p>
                     <p class="price">
                         <asp:Label  runat="server" ID="lblDiscount"/>
                     </p>
                   </div>

                   <div class="single-total total-payable">
                     <p class="value">Total Payable:</p>
                     <p class="price"> <asp:Label  runat="server" ID="lblTotalPrice"/></p>
                   </div>
                 </div>
            <%--  </asp:Panel>--%>
           

          </div>

          <div class="checkout-btn d-sm-flex justify-content-between">
            <div class="single-btn">

              
              <a href="#" class="main-btn primary-btn-border">
                  continue shopping

              </a>
            </div>
          <%--    <asp:Panel runat="server" ID="pnlChkBtn" Visible="false">--%>
                   <div class="single-btn">
                       <asp:Button Text="Next Step" runat="server" CssClass="main-btn primary-btn" ID="btnCheckout" OnClick="btnCheckout_Click"/>
                    
                     
 
                 </div>
            <%--  </asp:Panel>--%>
           

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger  EventName="ItemCommand" ControlID="rptProductCart"/>
        </Triggers>
    </asp:UpdatePanel>
    

</asp:Content>
