<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="successpayment.aspx.cs" Inherits="islandCart.client.successpayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container align-items-center">
    <div class="row justify-content-center">
        <div class="card w-75 m-3 text-center border-0">
            <div class="card-body">
                <h1 class="mdi mdi-check-circle-outline text-success"></h1>
                <h4 class="card-title text-success">Payment Done!</h4>
                <p class="card-text">Thanks you for your purchase</p>
                <p class="card-text">You'll be contacted shortly</p>
                <a href="#" class="btn btn-primary btn-sm mt-3">View My Order</a>
            </div>
        </div>
    </div>
</div>

   

   
</asp:Content>
