<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="cancelpayment.aspx.cs" Inherits="islandCart.client.cancelpayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container align-items-center">
    <div class="row justify-content-center">
        <div class="card w-75 m-3 text-center border-0">
            <div class="card-body">
                <h1 class="mdi mdi-close-circle text-danger">
                            </h1>
                <h4 class="card-title text-danger">Payment Declined!</h4>
                <p class="card-text">Your order has been declined</p>
                <p class="card-text">Try again later</p>
                <a href="#" class="btn btn-primary btn-sm mt-3">Back Home</a>
            </div>
        </div>
    </div>
</div>
</asp:Content>
