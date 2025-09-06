<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="My_Portrfolio_86.AdminRegister" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Register</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .form-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: #222;
            border-radius: 10px;
            color: #fff;
        }
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: none; }
        input[type="submit"] { background: #ffbd39; color: #000; font-weight: bold; cursor: pointer; }
        input[type="submit"]:hover { background: #fff; }
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Register New Admin</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm Password" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <br />
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="AdminLogin.aspx">Back to Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>
