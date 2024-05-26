<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="allreviews.aspx.cs" Inherits="islandCart.admin.allreviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
    <li class="breadcrumb-item">
        <a href="index.html">
            <span class="ti-home"></span>
        </a>
    </li>
    <li class="breadcrumb-item active">Manage Reviews</li>
</ol>
     <div class="container-fluid">
     <div class="row">
        <div class="col-md-12">
            <div class="widget-area-2 lorvens-box-shadow">
                <h3 class="widget-title">List of Current Testimonials</h3>
                    <div class="lorvens-widget">
                         <div class="table-div">
                                 <table class="table table-hover">
                                      <thead>
                                         <tr>
                                             <th scope="col">#</th>
                                             <th scope="col">Customer Picture</th>
                                             <th scope="col">Customer Name </th>
                                             <th scope="col">Reviews</th>
                                             <th scope="col">Date Posted</th>
                                             <th scope="col">Action</th>
                                             
                                         </tr>
                                     </thead>
                                      <tbody>
                                          <asp:Repeater runat="server" ID="rptReviews" OnItemDataBound="rptReviews_ItemDataBound">
                                              <ItemTemplate>
                                                       <tr>
                                                         <td>
                                                            <asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label>

                                                         </td>
                                                        <td>
                                                            <asp:Image ImageUrl='<%# Eval ("UserPicture") %>' runat="server" width="50" />
                                                        </td>
                                                         <td class="text-capitalize"><%# Eval ("Customer_Name") %></td>
                                                         <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target='<%# "#exampleModalLong_" + Eval("Testimonials_ID") %>'>
                        Click To View
                    </button>
                    <div class="modal fade" id='<%# "exampleModalLong_" + Eval("Testimonials_ID") %>' tabindex="-1" role="dialog" aria-labelledby='<%# "exampleModalLongTitle_" + Eval("Testimonials_ID") %>' aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-capitalize" id='<%# "exampleModalLongTitle_" + Eval("Testimonials_ID") %>'>
                                        <%# Eval("Customer_Name") %>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p><%# Eval("description") %></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                                                         <td><%# Eval ("date_posted") %></td>
                                                         <td>
                                                             <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("testimonials_id")%>' ID="btnDel" OnClick="btnDel_Click"/>
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
