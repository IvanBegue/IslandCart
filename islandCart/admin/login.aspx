<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="islandCart.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <!-- Fav  Icon Link -->
	<link rel="shortcut icon" type="image/png" href="images/fav.png"/>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="/assets/adminAssets/css/bootstrap.min.css"/>
	<!-- themify icons CSS -->
	<link rel="stylesheet" href="/assets/adminAssets/css/themify-icons.css"/>
	<!-- Animations CSS -->
	<link rel="stylesheet" href="/assets/adminAssets/css/animate.css"/>
	<!-- Main CSS -->
	<link rel="stylesheet" href="/assets/adminAssets/css/styles.css"/>
	<link rel="stylesheet" href="/assets/adminAssets/css/red.css" id="style_theme"/>
	<link rel="stylesheet" href="/assets/adminAssets/css/responsive.css"/>
	<!-- morris charts -->
	<link rel="stylesheet" href="/assets/adminAssets/charts/css/morris.css"/>
	<!-- jvectormap -->
	<link rel="stylesheet" href="/assets/adminAssets/css/jquery-jvectormap.css"/>

</head>
<body>
    <form id="form1" runat="server">
        
        <div class="pt-5">
			<div class="container-fluid ">
	<div class="row">
		<div class="col-sm-6 auth-box">
			<div class="lorvens-box-shadow">
				<h3 class="widget-title">Login</h3>
				
					
					<div class="form-group row">
						<div class="col-sm-12">
							<asp:TextBox runat="server" ID="txtname" CssClass="form-control" placeholder="Username or Email"></asp:TextBox>
							
						</div>
					</div>
				
					<div class="form-group row">
						<div class="col-sm-12">
							<asp:TextBox runat="server" ID="txtPwd" CssClass="form-control" TextMode="Password" placeholoder="Password"></asp:TextBox>
						

						</div>
					</div>
					
					
							
					<div class="button-btn-block">
						<asp:Button Text="Login" runat="server" CssClass="btn btn-primary btn-lg btn-block" ID="btnLogin" OnClick="btnLogin_Click"/>
						
					</div>
					
					
				
			</div>
		</div>
	</div>
</div>
        </div>

		
			
	










		<!-- Jquery Library-->
		<script src="/assets/adminAssets/js/jquery-3.2.1.min.js"></script>
	
		<!-- Popper Library-->
		<script src="/assets/adminAssets/js/popper.min.js"></script>
		<!-- Bootstrap Library-->
		<script src="/assets/adminAssets/js/bootstrap.min.js"></script>
		<!-- morris charts -->
		<script src="/assets/adminAssets/charts/js/raphael-min.js"></script>
		<script src="/assets/adminAssets/charts/js/morris.min.js"></script>
		<script src="/assets/adminAssets/js/custom-morris.js"></script>
		<!-- jvectormap -->
		<script src="/assets/adminAssets/js/jquery-jvectormap.min.js"></script>
		<script src="/assets/adminAssets/js/jquery-jvectormap-world-mill.js"></script>
		<script src="/assets/adminAssets/js/custom-vector.js"></script>
		<!-- Custom Script-->
		<script src="/assets/adminAssets/js/custom.js"></script>
    </form>
</body>
</html>
