<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="My_Portrfolio_86.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mehedi Hasan Portfolio</title>
    <link rel="stylesheet" href="Styles/site.css" />
    <style>
       /* ===== General Styles ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #000; /* Black background */
    color: #fff;
}

/* ===== Navbar ===== */
.navbar {
    display: flex;
    justify-content: center;
    gap: 20px;
    padding: 15px;
    background: #111;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
}

.navbar a {
    color: #fff;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

.navbar a:hover {
    color: #ffbd39;
}

/* ===== Section Styling ===== */
section {
    padding: 100px 20px 60px 20px;
    text-align: center; /* Center content by default */
}

h1, h2, h3 {
    color: #ffbd39;
}

p {
    max-width: 700px;
    margin: 10px auto;
    line-height: 1.6;
    color: #ccc;
}
.profile-pic {
    border-radius: 50%;       /* keeps it perfectly circular */
    width: 300px;             /* increase size */
    height: 300px;            /* increase size */
    object-fit: cover;
    margin-bottom: 20px;
    border: 3px solid #ffbd39; /* keep border same */
    box-shadow: 0 4px 15px rgba(255, 189, 57, 0.5);
}



/* ===== Skills Section ===== */
.skill-bar {
    margin: 15px 0;
    text-align: left; /* Skills text can remain left-aligned */
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
}

.progress {
    width: 100%;
    background: #222;
    height: 10px;
    border-radius: 5px;
    overflow: hidden;
}

.progress-fill {
    height: 10px;
    background: #ffbd39;
    border-radius: 5px;
}

/* ===== Projects Section ===== */
#projects {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* center align all project cards */
    gap: 30px; /* more space between cards */
    margin-top: 40px; /* spacing from previous section */
}

#projects h2 {
    width: 100%; /* take full width so header is above cards */
    text-align: center;
    margin-bottom: 30px; /* space between header and cards */
}

.project-card {
    background: #111;
    padding: 20px;
    border-radius: 10px;
    width: 300px;
    text-align: center;
    box-shadow: 0 4px 20px rgba(255, 189, 57, 0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}

html {
    scroll-behavior: smooth;
}


.project-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 8px;
    margin-bottom: 15px;
}

.project-card h3 {
    margin: 10px 0;
    font-size: 20px;
}

.project-card p {
    font-size: 14px;
    color: #ccc;
}

.project-card a {
    display: inline-block;
    margin-top: 10px;
    background: #ffbd39;
    color: #111;
    padding: 6px 14px;
    border-radius: 6px;
    font-weight: bold;
    text-decoration: none;
    transition: 0.3s;
}

.project-card a:hover {
    background: #fff;
    color: #000;
}

/* ===== Admin Controls ===== */
.add-new, .project-card a, .btn-edit, .btn-delete {
    cursor: pointer;
}

.add-new {
    display: inline-block;
    margin: 10px auto;
    background: #ffbd39;
    color: #111;
    font-weight: bold;
    padding: 6px 12px;
    border-radius: 6px;
    text-decoration: none;
    transition: 0.3s;
}

.add-new:hover {
    background: #fff;
    color: #000;
}

/* ===== Responsive ===== */
@media screen and (max-width: 768px) {
    section {
        padding: 80px 15px 40px 15px;
    }

    .project-card {
        width: 90%;
    }

    .skill-bar {
        width: 90%;
    }

    .navbar {
        flex-direction: column;
        gap: 10px;
    }
}

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar">
            <a href="#home">Home</a>
            <a href="#about">About</a>
            <a href="#skills">Skills</a>
            <a href="#projects">Projects</a>
            <a href="AdminLogin.aspx">Login</a>
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
                       <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("Title") %>' />
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
