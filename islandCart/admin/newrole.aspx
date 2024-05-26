<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="newrole.aspx.cs" Inherits="islandCart.admin.newrole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb mt-2 mb-3">
    <li class="breadcrumb-item">
        <a href="index.html">
            <span class="ti-home"></span>
        </a>
    </li>
    <li class="breadcrumb-item active">Create New Role</li>
</ol>
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="widget-area-2 lorvens-box-shadow">
                <h3 class="widget-title">Create New User</h3>
                    <div class="lorvens-widget">

                        <div class="form-group row">
                            <div class="col-md-6">
                                 <label>New Role</label>
                                <asp:TextBox runat="server" ID="txtRole" CssClass="form-control"   AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button Text="Create New " runat="server" CssClass="btn btn-primary" ID="btnAdd" />
                        <asp:Button Text="Cancel" runat="server" CssClass="btn btn-secondary" />


                    </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
