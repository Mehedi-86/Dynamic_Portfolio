<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="My_Portrfolio_86.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mehedi Hasan Portfolio</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
        .login-container { max-width: 300px; margin: 50px auto; padding: 20px; background: #222; border-radius: 10px; color: #fff; }
        input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: none; }
        input[type="submit"] { background: #ffbd39; color: #000; font-weight: bold; cursor: pointer; }
        input[type="submit"]:hover { background: #fff; }
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Panel ID="pnlLogin" runat="server" Visible="false">
            <div class="login-container">
                <h2>Admin Login</h2>
                <asp:Label ID="lblError" runat="server" CssClass="error" />
                <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </asp:Panel>

        <!-- Navbar -->
        <nav class="navbar">
            <a href="#home">Home</a>
            <a href="#about">About</a>
            <a href="#skills">Skills</a>
            <a href="#projects">Projects</a>
        </nav>

        <!-- About Section -->
<section id="about">
    <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic" />
    <h1><asp:Label ID="lblFullName" runat="server" /></h1>
    <p><asp:Label ID="lblDescription" runat="server" /></p>

    <%-- Admin Controls for About --%>
    <asp:Panel ID="pnlAdminAbout" runat="server" Visible="false">
        <a href="EditAbout.aspx?Id=<%# Eval("Id") %>" class="add-new">Edit About</a>
    </asp:Panel>
</section>


        <!-- Skills Section -->
<section id="skills">
    <h2>Skills</h2>
    <asp:Repeater ID="rptSkills" runat="server">
        <HeaderTemplate>
            <div>
                <%-- Admin Add Button --%>
                <asp:Panel ID="pnlAdminSkills" runat="server" Visible="false">
                    <a href="AddSkill.aspx" class="add-new">+ Add New Skill</a>
                </asp:Panel>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="skill-bar">
                <span><%# Eval("SkillName") %></span>
                <div class="progress">
                    <div class="progress-fill" style="width:<%# Eval("Percentage") %>%"></div>
                </div>

                <%-- Admin Edit/Delete Buttons --%>
                <asp:Panel ID="pnlAdminSkillButtons" runat="server" Visible="false">
                    <a href='EditSkill.aspx?Id=<%# Eval("Id") %>'>Edit</a> |
                    <a href='DeleteSkill.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure?');">Delete</a>
                </asp:Panel>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>


        <!-- Projects Section -->
<section id="projects">
    <h2>Projects</h2>
    <%-- Admin Add Button --%>
    <asp:Panel ID="pnlAdminProjectsAdd" runat="server" Visible="false">
        <a href="AddProject.aspx" class="add-new">+ Add New Project</a>
    </asp:Panel>

    <asp:Repeater ID="rptProjects" runat="server">
        <ItemTemplate>
            <div class="project-card">
                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                <h3><%# Eval("Title") %></h3>
                <p><%# Eval("Description") %></p>
                <a href='<%# Eval("ProjectLink") %>' target="_blank">View Project</a>

                <%-- Admin Edit/Delete Buttons --%>
                <asp:Panel ID="pnlAdminProjectButtons" runat="server" Visible="false">
                    <a href='EditProject.aspx?Id=<%# Eval("Id") %>'>Edit</a> |
                    <a href='DeleteProject.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure?');">Delete</a>
                </asp:Panel>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>


    </form>
</body>
</html>
