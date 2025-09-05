<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProject.aspx.cs" Inherits="My_Portrfolio_86.EditProject" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Project</title>
    <link rel="stylesheet" href="Styles/site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Edit Project</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtTitle" runat="server" Placeholder="Project Title" />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Project Description" />
            <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Image URL" />
            <asp:TextBox ID="txtProjectLink" runat="server" Placeholder="Project Link" />
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
