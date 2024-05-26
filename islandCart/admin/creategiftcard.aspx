<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="creategiftcard.aspx.cs" Inherits="islandCart.admin.adddiscount" EnableEventValidation="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script>
        function CheckInputNumber(input)
        {
            var quantity = document.getElementById("<%= txtQnt.ClientID%>");

           
            var value = parseInt(quantity.value, 10);

            
            if (value < 1) {
                
                quantity.value = 1;
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
        <li class="breadcrumb-item">
            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Giftcard</li>
    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">
                        <asp:Label Text="Create Giftcard" runat="server" ID="HeaderDiscount"/> 

                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row">
                            <div class="col-md-5">
                                <label>Giftcard Name</label>
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>

                             <div class="col-md-5">
                                 <label>Giftcard Price </label>
                                 <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" >
                                 </asp:TextBox>
                            </div>

                            <div class="col-md-2">
                                <label>Quantity</label>
                                <asp:TextBox runat="server" cssClass="form-control" TextMode="Number" ID="txtQnt" oninput="CheckInputNumber(this)"/>
                            </div>


                        </div>

                        

                        
                        </div>
           

                        <asp:Button Text="Save" runat="server" CssClass="btn btn-primary" ID="btnAdd" onclick="btnAdd_Click"/>
                        
                        <asp:Button Text="Edit" runat="server" CssClass="btn btn-primary" ID="btnEdit" OnClick="btnEdit_Click" Visible="false" />

                        <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" ID="btnCnl" OnClick="btnCnl_Click"/>
                    </div>
                </div>
            </div>
        </div>


    

     <div class="container-fluid">
         <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">
                    <h3 class="widget-title">List of Giftcard </h3>
                        <div class="lorvens-widget">
                             <div class="table-div">
                                     <table class="table table-hover">
                                          <thead>
                                             <tr>
                                                 <th scope="col">#</th>
                                                 <th scope="col">GiftCard Name</th>
                                                 <th scope="col">Price</th>
                                                 <th scope="col">Total Stock</th>
                                                 <th scope="col">Created Date</th>
                                              
                                                 <th scope="col">Action</th>
                                             </tr>
                                         </thead>
                                          <tbody>
                                              <asp:Repeater runat="server" ID="rptLovDiscount" OnItemDataBound="rptLovDiscount_ItemDataBound">
                                                  <ItemTemplate>
                                                       <tr>
                                                             <td>
                                                                <asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label>

                                                             </td>
                                                              <td>
                                                      <asp:Label CssClass="text-capitalize" Text='<%# Eval("g_name") %>' runat="server" />
                                                              </td>
                                                               <td>
                                                            <asp:Label CssClass="text-capitalize"  Text='<%# "Rs " + Eval("g_price") %>' runat="server" />
                                                               </td>
                                                             
                                                               <td><asp:Label CssClass="text-capitalize" Text='<%# Eval("quantity") %>' runat="server" /></td>

                                                                <td><asp:Label CssClass="text-capitalize" Text='<%# Eval("createdOn") %>' runat="server" />

                                                                </td>

                                                           <td>
                                                              
                                                               <asp:Button Text="Edit" runat="server" CssClass="btn btn-primary" ID="btnEditDiscount" OnClick="btnEditDiscount_Click" CommandArgument='<%# Eval("g_id") %>'/>
                                                               <asp:Button Text="Remove" runat="server" CssClass="btn btn-secondary" ID="btnRemove" OnClick="btnRemove_Click" CommandArgument='<%# Eval("g_id") %>'/>
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


</asp:Content>
