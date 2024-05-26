<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="brand.aspx.cs" Inherits="islandCart.admin.brand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <ol class="breadcrumb mt-2">
      <li class="breadcrumb-item">

          <a href="index.html">
              <span class="ti-home"></span>
          </a>
      </li>
      <li class="breadcrumb-item active">Manage Brand</li>
  </ol>
  <div class="container-fluid">
      <div class="row">
          <div class="col-md-12 mt-3">
              <div class="widget-area-2 lorvens-box-shadow">
                  <h3 class="widget-title">
                      <asp:Label Text="Add New Brand" runat="server" ID="lblHeader"/>
                  </h3>
                  <div class="lorvens-widget">
                      <div class="form-group">
                          <label>Brand Name</label>
                           <asp:TextBox runat="server" CssClass="form-control" ID="txtBrand" ></asp:TextBox>
                      </div>
                      <asp:Button Text="Edit" runat="server" ID="btnEdit" OnClick="btnEdit_Click" CssClass="btn btn-primary" Visible="false"/>
                      <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" onclick="btnAdd_Click"/>
                      <asp:Button runat="server" ID="btnCnl" CssClass="btn btn-secondary" Text="Cancel" />
                  </div>
              </div>
          </div>
      </div>
  </div>
    
   


    <div class="container-fluid">
        <div class="row">
             <div class="col-md-12">
                 <div class="widget-area-2 lorvens-box-shadow">
                     <h3 class="widget-title">List of Brand</h3>

                         <table class="table table-hover">
                              <thead>
                                 <tr>
                                     <th scope="col">#</th>
                                     <th scope="col">Brand Name</th>
                                     <th scope="col">Action</th>
                                 </tr>
                             </thead>
                                <tbody>

                                    <asp:Repeater runat="server" ID="rptBrand" OnItemDataBound="rptBrand_ItemDataBound">
                                        <ItemTemplate>
                                                <tr>
                                                    <td><asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label></td>
                                                    <td><%# Eval("brand") %></td>
                                                     <td>
                                                         <asp:button runat="server" ID="btnEdt" CssClass="btn btn-secondary" Text="Edit" CommandArgument='<%# Eval("brand_id") %>' OnClick="btnEdt_Click"/>
                                                         <asp:button runat="server" ID="btnRemove" CssClass="btn btn-danger" Text="Remove" CommandArgument='<%# Eval("brand_id") %>' OnClick="btnRemove_Click"  />
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

</asp:Content>
