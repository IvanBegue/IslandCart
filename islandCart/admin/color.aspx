<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="color.aspx.cs" Inherits="islandCart.admin.color" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2">
        <li class="breadcrumb-item">

            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Manage Color</li>
    </ol>
    <asp:Panel runat="server" ID="pnlAdd">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 mt-3">
                <div class="widget-area-2 lorvens-box-shadow">

                    <h3 class="widget-title">Add New Color</h3>

                    <div class="lorvens-widget ">

                        <div class="form-group">
                            <label>Color Name</label>
                        </div>

                        <div class="form-group">
                            <asp:TextBox runat="server" TextMode="Color" CssClass="ms-5" ID="txtColor"></asp:TextBox>
                        </div>


                        <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary form-control-color" Text="Add" OnClick="btnAdd_Click" />
                        <asp:Button runat="server" ID="btnCnl" CssClass="btn btn-secondary" Text="Cancel" />

                    </div>
                </div>


            </div>
        </div>

    </div>
</asp:Panel>
    <asp:Panel runat="server" ID="pnlEdit" Visible="false">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                 <div class="widget-area-2 lorvens-box-shadow">
                        <h3 class="widget-title">Update Color</h3>
                     <label>Current Color</label>
                    
                 <div id="DvColor" runat="server" style="width: 200px; height: 100px;"></div>
                         <div class="form-group pt-4">
                                <label>Select Color</label>
                                    <asp:TextBox runat="server" TextMode="Color" CssClass="ms-5" ID="txtNwColor"></asp:TextBox>
                            </div>

                         <asp:Button Text="Edit" runat="server" ID="btnSave" CssClass="btn btn-primary form-control-color" onclick="btnSave_Click"/>
                         <asp:Button runat="server" ID="btnCnl2" CssClass="btn btn-secondary" Text="Cancel" />
                     </div>
                 
            </div>
        </div>
    </div>

        </asp:Panel>

    <div class="container-fluid">
        <div class="row">
             <div class="col-md-12">
                 <div class="widget-area-2 lorvens-box-shadow">
                     <h3 class="widget-title">List of Color</h3>
                         <table class="table table-hover">
                              <thead>
                                 <tr>
                                     <th scope="col">#</th>
                                     <th scope="col">Color</th>
                                     
                                     <th scope="col">Action</th>
                                 </tr>
                             </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="rptColor" OnItemDataBound="rptColor_ItemDataBound">
                                        <ItemTemplate>
                                             <tr>
                                                 <td><asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label></td>
                                                 <td>
                                               <div style='<%# "width: 40px; height: 40px; background-color: " +Eval("Color") %>'></div>
                                                 </td>
                                                 <td>
                                                     <asp:Button Text="Edit" runat="server" CssClass="btn btn-primary" CommandArgument='<% # Eval("Color") %>' ID="btnEdit" OnClick="btnEdit_Click"/>
                                                     <asp:Button Text="Remove" runat="server" CssClass="btn btn-secondary"
                                                         ID="btnDel" OnClick="btnDel_Click" CommandArgument='<% # Eval("Color") %>'/>
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
