<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="My_Portrfolio_86.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        /* ===== Modern Dashboard CSS ===== */
       /* ===== Modern Dashboard CSS ===== */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #1e1e2f;
    margin: 0;
    padding: 0;
    color: #f0f0f0;
}

.dashboard {
    max-width: 1100px;
    margin: 50px auto;
    padding: 20px;
    background: #2a2a3d;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.5);
}

.dashboard h2 {
    color: #ffffff; /* white text */
    margin-bottom: 20px;
    font-size: 28px;
    border-bottom: 2px solid #444;
    padding-bottom: 10px;
}

.dashboard-header {
    display: flex;
    justify-content: space-between; /* h2 left, button right */
    align-items: center;           /* vertically align */
    padding: 10px 20px;            /* optional spacing */
    background-color: #2a2a3d;     
    border-radius: 8px;            /* optional styling */
}

.logout {
    float: right;
    background: #ff4d4d;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s;
}

.logout:hover {
    background: #ff1a1a;
}

.section {
    margin-bottom: 40px;
}

.section h3 {
    color: #ffbd39;
    margin-bottom: 10px;
    font-size: 22px;
}

.add-new {
    display: inline-block;
    margin-bottom: 15px;
    background: #ffbd39;
    color: #1e1e2f;
    font-weight: bold;
    padding: 6px 14px;
    border-radius: 6px;
    text-decoration: none;
    transition: 0.3s;
}

.add-new:hover {
    background: #fff;
    color: #000;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    background: #1e1e2f;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #444;
}

th {
    background: #2a2a3d;
    color: #ffbd39;
    text-transform: uppercase;
    font-size: 14px;
    letter-spacing: 0.5px;
}

tr:hover {
    background: #33334d;
}

a {
    color: #ffbd39;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

a:hover {
    color: #fff;
    text-decoration: underline;
}

img {
    border-radius: 6px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.4);
    max-width: 100px;
    height: auto;
}

/* Container to align buttons horizontally */
.action-buttons {
    display: flex;
    gap: 10px; /* space between buttons */
    flex-wrap: wrap; /* if cell is too small, wrap to next line */
}

/* Buttons styles */
.btn-edit, .btn-view {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: bold;
    color: #111;
    background: #ffbd39;
    text-decoration: none;
    transition: 0.3s;
}

.btn-edit:hover, .btn-view:hover {
    background: #fff;
    color: #000;
}

.btn-delete {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background: #ff4d4d;
    text-decoration: none;
    transition: 0.3s;
}

.btn-delete:hover {
    background: #ff1a1a;
}

@media screen and (max-width: 768px) {
    .dashboard {
        padding: 15px;
        margin: 20px;
    }

    th, td {
        padding: 8px;
    }

    .logout {
        float: none;
        width: 100%;
        margin-bottom: 15px;
    }
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="dashboard">
           <div class="dashboard-header">
            <h2>Admin Dashboard</h2>
            <asp:Button 
                ID="btnLogout" 
                runat="server" 
                Text="Logout" 
                CssClass="logout" 
                OnClientClick="return confirm('Are you sure you want to logout?');" 
                OnClick="btnLogout_Click" />
        </div>
           <h3 style="text-align:center;">Welcome, <asp:Label ID="lblAdminUser" runat="server" CssClass="admin-user"></asp:Label> 👋</h3>

            <!-- About Section -->
            <div class="section">
                <h3>About Section</h3>
                <asp:Repeater ID="rptAbout" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Full Name</th>
                                <th>Description</th>
                                <th>Profile Image</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FullName") %></td>
                            <td><%# Eval("Description") %></td>
                            <td>
                                <img src='<%# ResolveUrl(Eval("ProfileImage").ToString()) %>' alt="Profile Image" />
                            </td>
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
                            <tr>
                                <th>Skill Name</th>
                                <th>Percentage</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                               <td><%# Eval("SkillName") %></td>
                               <td><%# Eval("Percentage") %>%</td>
                               <td>
                                  <a class="btn-edit" href='EditSkill.aspx?Id=<%# Eval("Id") %>'>Edit</a>
                                  <a class="btn-delete" href='DeleteSkill.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
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
                            <tr>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Link</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                           <td><%# Eval("Title") %></td>
                           <td><%# Eval("Description") %></td>
                           <td><img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt="Project Image" /></td>
                           <td><a href='<%# Eval("ProjectLink") %>' target="_blank" class="btn-view">View</a></td>
                        <td>
                            <div class="action-buttons">
                                <a class="btn-edit" href='EditProject.aspx?Id=<%# Eval("Id") %>'>Edit</a>
                                <a class="btn-delete" href='DeleteProject.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
                            </div>
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
