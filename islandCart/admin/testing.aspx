<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="islandCart.admin.testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>

 <script>
     $.noConflict();
     jQuery(document).ready(function ($) {
         $("#<%=txtStart.ClientID%>").datepicker({
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true
        });
    }); // Added closing parentheses for the ready function
 </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox runat="server" ID="txtStart" />
    </form>
</body>
</html>
