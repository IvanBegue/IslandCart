<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="subcategoryflashsale.aspx.cs" Inherits="islandCart.admin.subcategoryflashsale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <ol class="breadcrumb mt-2 mb-3">
    <li class="breadcrumb-item">
        <a href="index.html">
            <span class="ti-home"></span>
        </a>
    </li>
    <li class="breadcrumb-item active">Manage Sub Category Flashsale</li>
</ol>
      <div class="container-fluid">
      <div class="row">
          <div class="col-md-12">
              <div class="widget-area-2 lorvens-box-shadow">
                  <h3 class="widget-title">List of Flashsale</h3>
                  <div class="lorvens-widget">
                      <div class="table-div">
                          <table class="table table-hover">
                              <thead>
                                  <tr>
                                      <th scope="col">#</th>
                                      <th scope="col">Title</th>
                                      <th scope="col">Percentage </th>
                                      <th scope="col">Minimum Amount</th>
                                      <th scope="col">Start Date</th>
                                      <th scope="col">End Date</th>
                                      <th scope="col">Action</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>1</td>
                                      <td>Black Friday</td>
                                      <td>35 %</td>
                                      <td>Rs 1000</td>
                                      <td>14/01/2024</td>
                                      <td>22/01/2024</td>
                                      <td>
                                          <asp:LinkButton Text="Remove"  runat="server" ID="btnDel" CssClass="btn btn-danger"/>
                                          <asp:LinkButton Text="Edit" runat="server" ID="btnEdit" CssClass="btn btn-secondary"/>
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>

                  </div>
              </div>
          </div>
      </div>

  </div>
</asp:Content>
