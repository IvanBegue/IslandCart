<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="paymentTest.aspx.cs" Inherits="islandCart.client.paymentTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox runat="server" ID="txtAmount"/>
    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="submit"/>
</asp:Content>

