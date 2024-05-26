<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="islandCart.client.test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .ratingStar, .filledRatingStar, .emptyRatingStar, .savedRatingStar {
            font-size: 30px;
            cursor: pointer;
        }
        .filledRatingStar {
            color: gold;
        }
        .emptyRatingStar {
            color: gray;
        }
        .savedRatingStar {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server">
     <Scripts>
         <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%> <%--Framework Scripts--%>
         <asp:ScriptReference Name="MsAjaxBundle" />
         <asp:ScriptReference Name="jquery" />
         <%--<asp:ScriptReference Name="bootstrap" />--%>
         <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
         <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
         <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
         <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
         <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
         <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
         <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
         <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
         <asp:ScriptReference Name="WebFormsBundle" />
         <%--Site Scripts--%>
     </Scripts>
 </asp:ScriptManager>
        <ajaxToolkit:Rating ID="Rating1" runat="server"
             CurrentRating="3"
            MaxRating="5"
            StarCssClass="ratingStar"
            WaitingStarCssClass="savedRatingStar"
            FilledStarCssClass="filledRatingStar"
            EmptyStarCssClass="emptyRatingStar"
            Width="50" 
            ></ajaxToolkit:Rating>
    </form>
</body>
</html>
