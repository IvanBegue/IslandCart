<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="productUnit.aspx.cs" Inherits="islandCart.admin.productUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
        <li class="breadcrumb-item">
            <a href="index.html">
                <span class="ti-home"></span>
            </a>
        </li>
        <li class="breadcrumb-item active">Product Unit</li>
    </ol>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="widget-area-2 lorvens-box-shadow">
                    <h3 class="widget-title">

                        <asp:Label Text="Create Product Unit" runat="server" ID="lblHeader" />
                    </h3>
                    <div class="lorvens-widget">
                        <div class="form-group row">

                            <div class="col-md-4">
                                <label>Unit Name</label>
                                <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control" placeholder="e.g kilogram,gram"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field*" CssClass="text-danger"
                                    ControlToValidate="txtWeight"
                                    ValidationGroup="valUnit"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-md-4">
                                <label>Unit Abbreviation</label>
                                <asp:TextBox runat="server" ID="txtAbbr" CssClass="form-control" placeholder="e.g kg,g"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field*" CssClass="text-danger" ControlToValidate="txtAbbr" ValidationGroup="valUnit"></asp:RequiredFieldValidator>
                            </div>


                        </div>
                        <div class="pt-4">

                            <asp:Button Text="Create" runat="server" CssClass="btn btn-primary" ID="btnAdd" UseSubmitBehavior="False" OnClick="btnAdd_Click" ValidationGroup="valUnit" />

                             <asp:Button Text="Edit" runat="server" CssClass="btn btn-primary" ID="btnEdit" UseSubmitBehavior="False"  ValidationGroup="valUnit" OnClick="btnEdit_Click" Visible="false"/>


                            <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />
                        </div>


                    </div>

                </div>
            </div>

        </div>
    </div>

    <div class="container-fluid">
    <div class="row">
         <div class="col-md-12">
             <div class="widget-area-2 lorvens-box-shadow">
                 <h3 class="widget-title">List of Product Unit </h3>

                     <table class="table table-hover">
                          <thead>
                             <tr>
                                 <th scope="col">#</th>
                                 <th scope="col">Unit </th>
                                 <th scope="col">Abbrevation</th>
                                 <th scope="col">Action</th>
                             </tr>
                         </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="rptUnit" OnItemDataBound="rptUnit_ItemDataBound">
                                    <ItemTemplate>
                                            <tr>
                                                <td><asp:Label runat="server" ID="lblRowCount" Text="1"></asp:Label></td>
                                                     <td><%# Eval("unit") %></td>
                                                      <td><%# Eval("unit_abbr") %></td>
                                                <td>
                                                        <asp:button runat="server" ID="btnEdt" CssClass="btn btn-secondary" Text="Edit" CommandArgument='<%# Eval("u_id") %>' onclick="btnEdt_Click"/>
                                                        <asp:button runat="server" ID="btnRemove" CssClass="btn btn-danger" Text="Remove" CommandArgument='<%# Eval("u_id") %>' onClick="btnRemove_Click" />
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
