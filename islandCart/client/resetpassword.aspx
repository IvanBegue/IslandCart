﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="islandCart.client.resetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <section class="login-registration-wrapper pt-50 pb-100">
  <div class="container">
      <div class="row justify-content-center">
          <div class="col-xl-8 col-lg-10">
            <div class="login-registration-style-3 mt-50">
              <h4 class="heading-4 font-weight-500 title text-center">
              Reset Password</h4>
                  <p class="mt-2 text-center">Enter your new password for your account</p>
              
            
              <div class="row">
                <div class="col-md-7">
                 
                    <div class="single-form form-default">
                      <label>New Password</label>
                      <div class="form-input">
                          <asp:TextBox runat="server" ID="txtNw"  textmode="Password"></asp:TextBox>
                      </div>
                    </div>
                    <div class="single-form form-default">
                       <label>Confirm Password</label>
                       <div class="form-input">
                           <asp:TextBox runat="server" ID="txtConfirm"  textmode="Password"></asp:TextBox>
                       </div>
                    </div>

                    <div class="mt-4">
                    <asp:Button Text="Reset Password" runat="server" ID="btnReset" CssClass="btn btn-primary" OnClick="btnReset_Click"/>
                    <asp:LinkButton Text="Cancel" runat="server" CssClass="btn btn-secondary" PostBackUrl="~/client/index.aspx" />
                   </div>
                </div>
              </div>
            </div>
          </div>
        </div>

  </div>
</section>
</asp:Content>
