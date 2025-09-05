<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="My_Portrfolio_86.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .dashboard { max-width: 1000px; margin: 50px auto; color: #fff; }
        .dashboard h2 { color: #ffbd39; }
        .logout { float: right; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #444; text-align: left; }
        a { color: #ffbd39; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .section { margin-bottom: 50px; }
        .add-new { margin-bottom: 10px; display: inline-block; background: #ffbd39; padding: 5px 10px; border-radius: 5px; color: #000; text-decoration: none; font-weight: bold; }
        .add-new:hover { background: #fff; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <h2>Admin Dashboard</h2>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" />

            <!-- About Section -->
            <div class="section">
                <h3>About Section</h3>
               
                <asp:Repeater ID="rptAbout" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr><th>Full Name</th><th>Description</th><th>Profile Image</th><th>Actions</th></tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FullName") %></td>
                            <td><%# Eval("Description") %></td>
                            <td><%# Eval("ProfileImage") %></td>
                            <td>
                                <a href='EditAbout.aspx?Id=<%# Eval("Id") %>'>Edit</a>  
                               
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <!-- Skills Section -->
            <div class="section">
                <h3>Skills Section</h3>
                <a href="AddSkill.aspx" class="add-new">+ Add New</a>
                <asp:Repeater ID="rptSkills" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr><th>Skill Name</th><th>Percentage</th><th>Actions</th></tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("SkillName") %></td>
                            <td><%# Eval("Percentage") %>%</td>
                            <td>
                                <a href='EditSkill.aspx?Id=<%# Eval("Id") %>'>Edit</a> | 
                                <a href='DeleteSkill.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <!-- Projects Section -->
            <div class="section">
                <h3>Projects Section</h3>
                <a href="AddProject.aspx" class="add-new">+ Add New</a>
                <asp:Repeater ID="rptProjects" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr><th>Title</th><th>Description</th><th>Image</th><th>Link</th><th>Actions</th></tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Title") %></td>
                            <td><%# Eval("Description") %></td>
                            <td><img src='<%# Eval("ImageUrl") %>' width="100" /></td>
                            <td><a href='<%# Eval("ProjectLink") %>' target="_blank">View</a></td>
                            <td>
                                <a href='EditProject.aspx?Id=<%# Eval("Id") %>'>Edit</a> | 
                                <a href='DeleteProject.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

        </div>
    </form>
</body>
</html>
