<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="islandCart.client.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
    function togglePasswordVisibility(element) {
    var target = $(element).attr('toggle');
    var passwordField = $(target);

        if (passwordField.attr('type') === 'password') {
            passwordField.attr('type', 'text');
            element.classList.remove('mdi-eye-outline');
            element.classList.add('mdi-eye-off-outline');
        } else {
            passwordField.attr('type', 'password');
            element.classList.remove('mdi-eye-off-outline');
            element.classList.add('mdi-eye-outline');
        }
    }
    </script>

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
                                            <asp:TextBox runat="server" placeholder="Firstname" ID="fn"></asp:TextBox>
                                            
                                            <i class="mdi mdi-account"></i>
                                            <asp:RequiredFieldValidator runat="server" display="Dynamic" ControlToValidate="fn" ErrorMessage="*" cssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                         <asp:RegularExpressionValidator 
                                             runat="server" 
                                             ErrorMessage="Invalid Firstname"
                                             ControlToValidate="fn"
                                             display="Dynamic"
                                             cssClass="text-danger"
                                             ValidationExpression="^[a-zA-Z]+$">

                                         </asp:RegularExpressionValidator>
                                    </div>
                                   
                                    <div class="col-sm-6">
                                        <div class="form-input form">
                                              <asp:TextBox runat="server" placeholder="Lastname" ID="ln"></asp:TextBox>
                                              <asp:RequiredFieldValidator runat="server" display="Dynamic" ControlToValidate="ln" ErrorMessage="*" cssClass="text-danger"></asp:RequiredFieldValidator>
                                        </div>
                                            <asp:RegularExpressionValidator 
                                                runat="server" 
                                                ErrorMessage="Invalid Lastname"
                                                ControlToValidate="ln"
                                                display="Dynamic"
                                                cssClass="text-danger"
                                                ValidationExpression="^[a-zA-Z]+$">

                                            </asp:RegularExpressionValidator>

                                    </div>
                                     
                                </div>
                            </div>
                            <div class="single-form form-default form-border">
                                <label>Email Address</label>
                                <div class="form-input">
                                     <asp:TextBox runat="server" placeholder="user@email.com" ID="userEmail"></asp:TextBox>
                                  
                                    <i class="mdi mdi-email"></i>
                                      <asp:RequiredFieldValidator runat="server" display="Dynamic" ControlToValidate="useremail" ErrorMessage="*" cssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>

                                <asp:Label  runat="server" ID="lblEmailErr" CssClass="text-danger" visible="false"/>
                            </div>
                            <div class="single-form form-default form-border">
                                <label>Choose Password</label>
                                <div class="form-input">
                               
                                    <asp:TextBox runat="server" ID="pwd" placeholder="password" TextMode="Password"></asp:TextBox>
                                    <i class="mdi mdi-lock"
                                       ></i>
                                    <span toggle="#<%= pwd.ClientID %>"
                                        class="mdi mdi-eye-outline toggle-password"
                                        onclick="togglePasswordVisibility(this)"  style="cursor:pointer;"></span>
                                </div>
                            </div>
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator1" 
                                runat="server" 
                                ErrorMessage="Password should 8 length and one uppercase or lowercase" 
                                ControlToValidate="pwd"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z]).{8,}$"
                                display="Dynamic"
                                cssClass="text-danger"
                                ></asp:RegularExpressionValidator>

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
