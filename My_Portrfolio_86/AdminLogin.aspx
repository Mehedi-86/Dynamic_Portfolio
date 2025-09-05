<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="My_Portrfolio_86.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .login-container {
            max-width: 400px;
            margin: 150px auto;
            padding: 20px;
            background: #222;
            border-radius: 10px;
        }
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: none; }
        input[type="submit"] { background: #ffbd39; color: #000; font-weight: bold; cursor: pointer; }
        input[type="submit"]:hover { background: #fff; }
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Login</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
