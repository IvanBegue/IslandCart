<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="islandCart.client.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="login-registration-wrapper pt-50 pb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="login-registration-style-1 registration mt-50">
                        <h1 class="heading-4 font-weight-500 title">Create an Account with
                        </h1>
                        <ul>
                            <li>
                                <a href="#0" class="facebook-login-registration"><i class="lni lni-facebook-original"></i>
                                    <span>Login with Facebook</span></a>
                            </li>
                            <li>
                                <a href="#0" class="google-login-registration">
                                    <asp:Image runat="server" ImageUrl="~/assets/images/google-logo.svg"/>
                                    <img src="./assets/images/google-logo.svg" alt="" />
                                    <span>Login with Google</span></a>
                            </li>
                        </ul>
                        <p class="account">Or create account with email</p>
                        <div class="login-registration-form pt-10">

                            <div class="single-form form-default form-border">
                                <label>Full Name</label>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-input">
                                            <asp:TextBox runat="server" placeholder="First Name" ID="fn"></asp:TextBox>
                                            
                                            <i class="mdi mdi-account"></i>
                                            <asp:RequiredFieldValidator runat="server" display="Dynamic" ControlToValidate="fn" ErrorMessage="Required Field*" cssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-input form">
                                              <asp:TextBox runat="server" placeholder="Last Name" ID="ln"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="single-form form-default form-border">
                                <label>Email Address</label>
                                <div class="form-input">
                                     <asp:TextBox runat="server" placeholder="user@email.com" ID="useremail"></asp:TextBox>
                                  
                                    <i class="mdi mdi-email"></i>
                                </div>
                            </div>
                            <div class="single-form form-default form-border">
                                <label>Choose Password</label>
                                <div class="form-input">
                                 <%--   <input
                                        id="password-1"
                                        type="password"
                                        placeholder="Password" />--%>
                                    <asp:TextBox runat="server" ID="pwd" placeholder="password" TextMode="Password"></asp:TextBox>
                                    <i class="mdi mdi-lock"></i>
                                    <span
                                        toggle="#password-1"
                                        class="mdi mdi-eye-outline toggle-password"></span>
                                </div>
                            </div>
                            <div class="single-checkbox checkbox-style-3">
                                <input type="checkbox" id="login-1" />
                                <label for="login-1"><span></span></label>
                                <p>I accept the Terrms of Use.</p>
                            </div>
                            <div class="single-form">
                                <asp:Button runat="server" CssClass="main-btn primary-btn" ID="btnregister" OnClick="btnregister_Click" Text="Register"/>
                                <%--<button class="main-btn primary-btn">Signup</button>--%>
                            </div>

                        </div>
                        <p class="login">Have an account? 
                            <asp:HyperLink runat="server" NavigateUrl="~/client/login.aspx">Log in</asp:HyperLink>
                            

                        </p>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
