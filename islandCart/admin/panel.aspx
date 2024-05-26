<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="islandCart.admin.panel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<ol class="breadcrumb mt-2">
		  <li class="breadcrumb-item">
			  <a href="index.html">
				    <span class="ti-home"></span>
			  </a>
			</li>
			<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		<div class="container-fluid home">
			<div class="row">
					<div class="col-md-12">
						<h3 class="block-title">Quick Statistics</h3>
					</div>
			</div>
				<div class="row">
		<div class="col-md-3">
					<div class="widget-area lorvens-box-shadow color-green">
						<div class="widget-left">
							<span class="ti-shopping-cart"></span>
						</div>
						<div class="widget-right">
							<h4 class="wiget-title">Product</h4>
							<span class="numeric color-green">
            <asp:Label  runat="server" ID="lblProducts"/></span>
						</div>
					</div>
		</div>

		<div class="col-md-3">
			<div class="widget-area lorvens-box-shadow color-blue">
				<div class="widget-left">
						<span class="ti-user"></span>
				</div>
			<div class="widget-right">
				<h4 class="wiget-title">Customer</h4>
				<span class="numeric color-blue">
					<asp:Label runat="server" ID="lblCustomer"></asp:Label>
				</span>
			</div>
		</div>
		</div>
		<div class="col-md-3">
		<div class="widget-area lorvens-box-shadow color-yellow">
			<div class="widget-left">
					<span class="ti-thumb-up"></span>
			</div>
		<div class="widget-right">
			<h4 class="wiget-title">Positive Feedback</h4>
			<span class="numeric color-yellow">
				<asp:Label runat="server" ID="lblRating"></asp:Label>
			</span>
		</div>
		</div>
	</div>
		<div class="col-md-3">
	<div class="widget-area lorvens-box-shadow color-red">
		<div class="widget-left">
				<span class="ti-user"></span>
		</div>
	<div class="widget-right">
		<h4 class="wiget-title">Courier</h4>
		<span class="numeric color-red">
			<asp:Label runat="server" ID="lblCourier"></asp:Label>
		</span>
	</div>
	</div>
</div>
	</div>
		</div>
	
</asp:Content>
