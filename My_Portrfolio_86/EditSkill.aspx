<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSkill.aspx.cs" Inherits="My_Portrfolio_86.EditSkill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Skill</title>
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
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: none; }
        input[type="submit"] { background: #ffbd39; color: #000; font-weight: bold; cursor: pointer; }
        input[type="submit"]:hover { background: #fff; }
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Edit Skill</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtSkillName" runat="server" Placeholder="Skill Name" />
            <asp:TextBox ID="txtPercentage" runat="server" Placeholder="Percentage (0-100)" />
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
