<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="My_Portrfolio_86.AddProject" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Project</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .form-container {
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
        <div class="form-container">
            <h2>Add Project</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtTitle" runat="server" Placeholder="Project Title" />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Project Description" />
            <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Image URL" />
            <asp:TextBox ID="txtProjectLink" runat="server" Placeholder="Project Link" />
            <asp:Button ID="btnSave" runat="server" Text="Add Project" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
