<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="confirmOtp.aspx.cs" Inherits="islandCart.client.confirmOtp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="login-registration-wrapper pt-50 pb-100">
  <div class="container">
      <div class="row justify-content-center">
          <div class="col-xl-8 col-lg-10">
            <div class="login-registration-style-3 mt-50">
              <h4 class="heading-4 font-weight-500 title text-center">
               OTP Verification</h4>
                  <p class="mt-2 text-center">Enter the OTP send to <asp:Label ID="lblEmail" runat="server" /></p>
              
            
              <div class="row">
                <div class="col-md-7">
                 
                    <div class="single-form form-default">
                      <label>Enter OTP</label>
                      <div class="form-input">

                          <asp:TextBox runat="server" ID="txtOtp" AutoCompleteType="Disabled"></asp:TextBox>
                       
                       
                      </div>
                    </div>
                    <asp:Label CssClass="text-danger fw-bold mt-2" ID="lblErr" runat="server" />

                    <div class="mt-4">
                    <asp:Button Text="Verify" runat="server" ID="btnChk" CssClass="btn btn-primary" OnClick="btnChk_Click" />

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
