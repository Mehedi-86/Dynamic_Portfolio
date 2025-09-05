<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAbout.aspx.cs" Inherits="My_Portrfolio_86.EditAbout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit About</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .edit-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 20px;
            background: #222;
            border-radius: 10px;
            color: #fff;
        }
        input, textarea { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: none; }
        input[type="submit"] { background: #ffbd39; color: #000; font-weight: bold; cursor: pointer; }
        input[type="submit"]:hover { background: #fff; }
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <h2>Edit About</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtFullName" runat="server" Placeholder="Full Name" />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Description" />
            <asp:TextBox ID="txtProfileImage" runat="server" Placeholder="Profile Image URL" />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
