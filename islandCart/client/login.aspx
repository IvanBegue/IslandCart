<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="islandCart.client.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function togglePasswordVisibility(element) {
    var target = $(element).attr('toggle');
    var passwordField = $(target);

        if (passwordField.attr('type') === 'password') {
            passwordField.attr('type', 'text');
        } else {
            passwordField.attr('type', 'password');
        }
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="login-registration-wrapper pt-50 pb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-10">
                  <div class="login-registration-style-3 mt-50">
                    <h4 class="heading-4 font-weight-500 title">
                      Login to your account
                    </h4>
                    <p class="paragraph-small font-weight-300 mt-15">
                      Login to your account for a faster checkout.
                    </p>


                    <div class="row">


                      <div class="col-md-7">
                            
                          <div class="single-form form-default">
                            <label>Email Address</label>
                            <div class="form-input">
                                <asp:TextBox runat="server" ID="txtemail" TextMode="Email" placeholder="user@email.com"></asp:TextBox>
                             
                              <i class="mdi mdi-email"></i>
                            </div>
                          </div>
                          <div class="single-form form-default">
                            <label>Choose Password</label>
                            <div class="form-input">
                                <asp:TextBox runat="server" ID="txtpassword" placeholder="Password" TextMode="Password"></asp:TextBox>
                              
                              <i class="mdi mdi-lock"></i>
                             
                              <span toggle="#<%= txtpassword.ClientID %>"
                                  class="mdi mdi-eye-outline toggle-password" 
                                  onclick="togglePasswordVisibility(this)">

                              </span>
                            </div>
                          </div>
                            <div class="single-checkbox checkbox-style-3">
                          
                           <input type="checkbox" id="login-1" name="chkrememberme"/>
                            <label for="login-1"><span></span> </label>
                            <p>Remember Me</p>
                          </div>
                          <asp:HyperLink CssClass="forget" NavigateUrl="~/client/forgotpassword.aspx" runat="server" Text="Forgot Password ?"/>

                          <div class="single-form">
                              <asp:Button runat="server" ID="btnlogin" CssClass="main-btn primary-btn me-3" Text="Log in" OnClick="btnlogin_Click"
                                  />

                              <asp:HiddenField runat="server" ID="HdnEmail"/>
                               <asp:HiddenField runat="server" ID="HdnPassword"/>

                               <asp:Button runat="server" ID="BtnLoginCookie" CssClass="main-btn secondary-3-btn-border Text-capitalize"  OnClick="btnlogin_Click" Visible="false"/>

                          </div>
                        
                      </div>
                      <div class="col-md-5">
                         
                        <p class="account">Login with Social Account</p>
                        <ul>
                          <li>
                            <a href="#0" class="facebook-login-registration"
                              ><i class="lni lni-facebook-original"></i>
                              <span>Login with Facebook</span></a
                            >
                          </li>
                          <li>
                            <a href="#0" class="google-login-registration"
                              ><img src="assets/images/google-logo.svg" alt="" />
                              <span>Login with Google</span></a
                            >
                          </li>
                        </ul>
                        <p class="login">
                          Haven’t an account? <asp:HyperLink runat="server" NavigateUrl="~/client/registration">Sign Up</asp:HyperLink>
                            
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

        </div>
      </section>
</asp:Content>
