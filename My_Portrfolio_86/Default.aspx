<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="My_Portrfolio_86.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
#skills {
    background: #000;
    color: #fff;
    padding: 80px 20px;
    text-align: center;
}

#skills h2 {
    font-size: 36px;
    color: #ffbd39;
    font-weight: bold;
    margin-bottom: 40px;
}

/* Skill Bar Container */
.skill-bar {
    max-width: 700px;      /* make bar longer */
    margin: 20px auto;
    text-align: left;
}

/* Skill Name */
.skill-bar span {
    display: inline-block;
    font-weight: bold;
    font-size: 18px;       /* slightly bigger */
    margin-bottom: 5px;
}

/* Progress Container */
.progress {
    width: 100%;           /* full length */
    background: #222;
    height: 18px;           /* slightly taller */
    border-radius: 10px;
    overflow: hidden;
    position: relative;
}

/* Progress Fill */
.progress-fill {
    height: 100%;
    background: #ffbd39;
    border-radius: 10px;
    transition: width 1s ease-in-out;
    position: relative;
}

/* Percentage Text Inside Bar */
.progress-fill::after {
    content: attr(data-percentage) '%';
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #000;
    font-weight: bold;
}

/* Admin Buttons */
.skill-bar a {
    margin-left: 10px;
    color: #ffbd39;
    text-decoration: none;
    font-size: 14px;
}

.skill-bar a:hover {
    color: #fff;
}

/* Responsive */
@media (max-width: 768px) {
    .skill-bar span {
        font-size: 16px;
    }

    .progress {
        height: 16px;
    }
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
    margin-bottom: 30px;
    font-size: 42px; /* increase size */
    color: #ffbd39;  /* yellow like headings */
    font-weight: bold;/* space between header and cards */
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

/* ===== Home Section ===== */
.home-section {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(to right, #000, #111);
  padding: 0 20px;
}

.home-container {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 50px;
  flex-wrap: wrap;
  text-align: center;
}

/* Profile Image */
.home-pic {
  width: 300px;
  height: 300px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #ffbd39;
  box-shadow: 0 4px 15px rgba(255, 189, 57, 0.5);
}

/* Text & Animation */
.subheading {
  font-size: 20px;
  color: #ffbd39;
}

.home-right h1 {
  font-size: 48px;
  margin-bottom: 15px;
  color: #fff;
}

.home-right h1 span {
  color: #ffbd39;
}

#typing-animation {
  display: block;
  font-size: 24px;
  font-weight: bold;
  color: #ffbd39;
  margin: 10px 0;
}

.tagline {
  font-size: 20px;
  color: #ccc;
  margin-bottom: 20px;
}

/* Buttons */
.btn-home {
  display: inline-block;
  margin: 10px 10px 0 0;
  padding: 10px 20px;
  border-radius: 6px;
  font-weight: bold;
  text-decoration: none;
  transition: 0.3s;
}

.btn-home.yellow {
  background: #ffbd39;
  color: #111;
}

.btn-home.yellow:hover {
  background: #fff;
  color: #000;
}

.btn-home.outline {
  border: 2px solid #ffbd39;
  color: #ffbd39;
}

.btn-home.outline:hover {
  background: #ffbd39;
  color: #111;
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

/* ===== About Section ===== */
.about-section {
    padding: 60px 20px;
    background: #000; /* Black background */
    color: #fff;
}

.about-container {
    display: flex;
    align-items: flex-start;
    justify-content: center;
    gap: 40px;
    max-width: 1100px;
    margin: 0 auto;
    flex-wrap: wrap;
}

/* Left Side (Image) */
.about-left {
    flex: 1;
    max-width: 350px;
}

.profile-pic {
    width: 100%;
    border-radius: 10px;
    box-shadow: 0px 4px 15px rgba(255, 189, 57, 0.5); /* subtle yellow glow */
}

/* Right Side (Text + Info) */
.about-right {
    flex: 2;
    min-width: 300px;
    color: #fff;
}

.about-heading {
    font-size: 32px;
    color: #ffbd39; /* yellow heading */
    margin-bottom: 20px;
    font-weight: bold;
}

.about-right h1 {
    font-size: 28px;
    margin-bottom: 15px;
    color: #fff;
}

.about-right p {
    font-size: 16px;
    line-height: 1.6;
    color: #ccc;
}

/* About Info Styling */
.about-info {
    margin-top: 20px;
}

.about-info p {
    font-size: 15px;
    margin-bottom: 10px;
    color: #fff;
}

.about-info .title-s {
    font-weight: 600;
    display: inline-block;
    width: 120px;
    color: #ffbd39; /* yellow labels */
}

/* Admin Edit Button */
.add-new {
    display: inline-block;
    margin-top: 15px;
    padding: 8px 15px;
    background: #ffbd39;
    color: #111;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    transition: 0.3s ease;
}

.add-new:hover {
    background: #fff;
    color: #000;
}

/* Responsive */
@media (max-width: 768px) {
    .about-container {
        flex-direction: column;
        text-align: center;
    }

    .about-info .title-s {
        width: auto;
        display: inline;
    }

    .about-left {
        max-width: 250px;
        margin: 0 auto 20px auto;
    }
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

/* ===== Resume Section ===== */
.resume-section {
    background: #000;
    color: #fff;
    padding: 80px 20px;
}

.resume-heading {
    text-align: center;
    margin-bottom: 50px;
}

.resume-big {
    font-size: 36px;
    color: #ffbd39;
    font-weight: bold;
}

.resume-title {
    font-size: 28px;
    color: #fff;
    margin-bottom: 15px;
}

.resume-heading p {
    max-width: 700px;
    margin: 0 auto;
    color: #ccc;
}

.resume-row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 40px;
}

.resume-item {
    background: #111;
    flex: 1 1 45%;
    padding: 25px 20px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(255, 189, 57, 0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}

.resume-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(255, 189, 57, 0.3);
}

.resume-item h3 {
    margin: 10px 0 5px 0;
    color: #ffbd39;
}

.resume-item .position {
    font-size: 14px;
    color: #ccc;
}

.resume-item .date {
    font-size: 13px;
    color: #ffbd39;
    font-weight: bold;
}

.resume-item ul {
    margin: 10px 0 0 20px;
    color: #ccc;
}

.resume-download {
    margin-top: 20px;
}

.btn-resume {
    display: inline-block;
    background: #ffbd39;
    color: #111;
    font-weight: bold;
    padding: 12px 25px;
    border-radius: 6px;
    text-decoration: none;
    transition: 0.3s ease;
}

.btn-resume:hover {
    background: #fff;
    color: #000;
}

.social-links .normal-txt {
    color: #fff;
    font-size: 16px;
    font-weight: bold; /* Make the text bold */
}


/* Responsive */
@media (max-width: 768px) {
    .resume-row {
        flex-direction: column;
    }
    
    .resume-item {
        flex: 1 1 100%;
    }

    .resume-big {
        font-size: 28px;
    }

    .resume-title {
        font-size: 22px;
    }
}


/* ===== Admin Controls ===== */
.add-new, .project-card a, .btn-edit, .btn-delete {
    cursor: pointer;
}

/* ===== Contact Section ===== */
.contact-section {
  background: #000;
  color: #fff;
  text-align: center;
  padding: 60px 20px;
}

.section-heading {
  font-size: 36px;
  color: #ffbd39;
  margin-bottom: 20px;
}

.contact-cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  margin: 30px 0;
}

.contact-card {
  background: #111;
  padding: 20px;
  border-radius: 10px;
  width: 200px;
  color: #fff;
}

.contact-card h3 {
  color: #ffbd39;
  margin-bottom: 10px;
}

.contact-card a {
  color: #ffbd39;
  text-decoration: none;
}

.contact-card a:hover {
  color: #fff;
}

.contact-btn {
  margin: 20px 0;
}

.btn-resume {
  background: #ffbd39;
  color: #111;
  padding: 10px 25px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: bold;
}

.btn-resume:hover {
  background: #fff;
  color: #000;
}

.social-links {
  display: flex;
  justify-content: center;
  gap: 15px;
  list-style: none;
  padding: 0;
  margin-top: 20px;
}

.social-links li a {
  color: #ffbd39;
  font-size: 20px;
}

.social-links li a:hover {
  color: #fff;
}

/* ===== Footer ===== */
.footer-section {
  background: #111;
  color: #fff;
  text-align: center;
  padding: 20px;
  font-size: 14px;
}

.footer-section .icon-heart {
  color: #ff0000;
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
            <a href="#resume">Resume</a>
            <a href="#skills">Skills</a>
            <a href="#projects">Projects</a>
            <a href="#contact">Contact</a>
            <a href="AdminLogin.aspx">Login</a>
        </nav>

        <!-- Home Section -->
<!-- Home Section -->
<section id="home" class="home-section">
  <div class="home-container">
    
    <!-- Text + Animation (Now on the left) -->
    <div class="home-right">
      <span class="subheading">Hello!</span>
      <h1 class="mb-4 mt-3">I'm <span>Mehedi Hasan</span></h1>

      <!-- Typing Animation -->
      <span id="typing-animation"></span>

      <h2 class="tagline">A Student of Computer Science</h2>

      <!-- Buttons -->
      <p>
        <a href="https://www.youtube.com/@amehedihasan2372" target="_blank" class="btn-home yellow">YouTube</a>
        <a href="https://github.com/Mehedi-86?tab=repositories" target="_blank" class="btn-home outline">My Works</a>
      </p>
    </div>

    <!-- Profile Image (Now on the right) -->
    <div class="home-left">
      <img src="Uploads/profilePhoto.jpg" alt="Mehedi Hasan" class="home-pic">
    </div>

  </div>
</section>


<!-- Typing Animation Script -->
<script>
    const typingAnimationElement = document.getElementById('typing-animation');

    const typingTexts = ['Student  ', 'Developer  ', 'Programmer   '];

    function playTypingAnimation(text) {
        for (let i = 0; i < text.length; i++) {
            setTimeout(() => {
                typingAnimationElement.textContent += text[i];
            }, i * 200);
        }

        setTimeout(() => {
            typingAnimationElement.textContent = '';
            playTypingAnimation(typingTexts[(typingTexts.indexOf(text) + 1) % typingTexts.length]);
        }, text.length * 200);
    }

    playTypingAnimation(typingTexts[0]);
</script>


        <!-- About Section -->
<section id="about" class="about-section">
    <div class="about-container">
        <!-- Left Side: Profile Image -->
        <div class="about-left">
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic" />
        </div>

        <!-- Right Side: Text & Info -->
        <div class="about-right">
            <h2 class="about-heading">About Me</h2>

            <h1><asp:Label ID="lblFullName" runat="server" /></h1>
            <p><asp:Label ID="lblDescription" runat="server" /></p>

            <!-- About Info -->
            <div class="about-info">
                <p><span class="title-s">Name: </span> <strong>Mehedi Hasan</strong></p>
                <p><span class="title-s">Job Role: </span> <strong>Student of CSE</strong></p>
                <p><span class="title-s">Experience: </span> <strong>In 3rd year</strong></p>
                <p><span class="title-s">Address: </span> <strong>Brahmanbaria, Bangladesh</strong></p>
            </div>

            <%-- Admin Controls for About --%>
            <asp:Panel ID="pnlAdminAbout" runat="server" Visible="false">
                <a href="EditAbout.aspx?Id=<%# Eval("Id") %>" class="add-new">Edit About</a>
            </asp:Panel>
        </div>
    </div>
</section>


        <!-- Resume Section -->
<section id="resume" class="resume-section">
    <div class="container">
        <!-- Heading -->
        <div class="resume-heading text-center">
            <h1 class="resume-big">My Resume</h1>
            <h2 class="resume-title">Resume</h2>
            <p>"Hands-on experience in software development, embedded systems, and research. Skilled in programming, problem-solving, and system design, with a strong passion for web development, IoT, and innovative tech solutions."</p>
        </div>

        <!-- Experience -->
        <div class="resume-row">
            <div class="resume-item">
                <span class="date">2025-Present</span>
                <h3>Senior Web Developer</h3>
                <span class="position">CSE 3100</span>
                <ul>
                    <li>Built dynamic web apps using HTML, CSS, JavaScript, PHP, and SQL.</li>
                    <li>Integrated SQL databases with server-side logic.</li>
                    <li>Optimized performance using MVC and Git version control.</li>
                </ul>
            </div>

            <div class="resume-item">
                <span class="date">2025-Present</span>
                <h3>Full-Stack OS Analyst</h3>
                <span class="position">CSE 3102</span>
                <ul>
                    <li>Designed OS components for process and memory management.</li>
                    <li>Developed CPU scheduling and synchronization algorithms.</li>
                    <li>Simulated OS tasks using C and assembly.</li>
                </ul>
            </div>
        </div>

        <!-- Education -->
        <div class="resume-row">
            <div class="resume-item">
                <span class="date">2023-Present</span>
                <h3>B.Sc. in Computer Science & Engineering</h3>
                <span class="position">KUET</span>
                <p>Grade: First class distinction.</p>
            </div>

            <div class="resume-item">
                <span class="date">2019-2021</span>
                <h3>HSC in Science</h3>
                <span class="position">Navi College, Dhaka</span>
                <p>Grade: A+ (GPA 5.00/5.00)</p>
            </div>
        </div>

        <!-- Download CV Button -->
        <div class="resume-download text-center">
            <a href="https://drive.google.com/uc?export=download&id=1y2AqGdUAdxFnP5M7lbFVY_pol564cMW0" class="btn-resume">Download CV</a>
        </div>
    </div>
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
                            <div class="progress-fill" style="width:<%# Eval("Percentage") %>%;" data-percentage='<%# Eval("Percentage") %>'></div>
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

        <!-- Contact Section -->
<section id="contact" class="contact-section">
  <div class="container">
    <h1 class="section-heading">Contact Me</h1>
    <p>Reach out via the following methods:</p>

    <div class="contact-cards">
      <div class="contact-card">
        <h3>Address</h3>
        <p>B-baria, Bangladesh</p>
      </div>
      <div class="contact-card">
        <h3>Phone</h3>
        <p><a href="tel://0101010101">+0 101 0101 101</a></p>
      </div>
      <div class="contact-card">
        <h3>Email</h3>
        <p><a href="mailto:rabby2107086@stud.kuet.ac.bd">rabby2107086@stud.kuet.ac.bd</a></p>
      </div>
      <div class="contact-card">
        <h3>Resume</h3>
        <p><a href="https://drive.google.com/uc?export=download&id=1y2AqGdUAdxFnP5M7lbFVY_pol564cMW0">Download CV</a></p>
      </div>
    </div>

   <div class="contact-btn">
      <a href="mailto:rabby2107086@stud.kuet.ac.bd" class="btn-resume">Email Me</a>
   </div>


   <!-- Social links -->
<ul class="social-links">
    <li class="normal-txt">Find me on</li>
    <li><a href="https://www.linkedin.com/in/mehedi-hasan86/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
    <li><a href="https://web.facebook.com/mehedi.hasan.kuet" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
    <li><a href="https://www.youtube.com/@amehedihasan2372" target="_blank"><i class="fab fa-youtube"></i></a></li>
    <li><a href="mailto:rabby2107086@stud.kuet.ac.bd"><i class="fas fa-envelope"></i></a></li>
</ul>

  </div>
</section>

<!-- Footer -->
<footer class="footer-section">
  <p>&copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="icon-heart"></i> by Mehedi Hasan</p>
</footer>


    </form>
</body>
</html>