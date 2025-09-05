<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAbout.aspx.cs" Inherits="My_Portrfolio_86.EditAbout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit About</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        body {
            background-color: #111;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .edit-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 30px 40px;
            background: #1c1c1c;
            border-radius: 12px;
            border: 1px solid #333;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
        }
        .edit-container h2 {
            text-align: center;
            color: #ffbd39;
            margin-bottom: 30px;
            font-size: 26px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #ffbd39;
        }
        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #555;
            border-radius: 8px;
            background-color: #222;
            color: #fff;
            font-size: 15px;
        }
        .current-image {
            display: block;
            margin-bottom: 20px;
            border: 2px solid #ffbd39;
            border-radius: 8px;
            max-width: 100%;
        }
        .btn-save {
            background: #ffbd39;
            color: #111;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: 0.3s ease;
        }
        .btn-save:hover {
            background: #e6ac2c;
            color: #fff;
        }
        .error {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <h2>Edit About</h2>

            <asp:Label ID="lblError" runat="server" CssClass="error" />

            <asp:TextBox ID="txtFullName" runat="server" Placeholder="Full Name" /><br />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Description" /><br />

            <label>Current Profile Image:</label>
            <asp:Image ID="imgCurrent" runat="server" CssClass="current-image" Width="200" /><br />

            <label>Upload New Image:</label>
            <asp:FileUpload ID="fuProfileImage" runat="server" /><br />

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn-save" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
