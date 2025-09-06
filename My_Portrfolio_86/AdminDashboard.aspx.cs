using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace My_Portrfolio_86
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ✅ Check session
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                // ✅ Check cookie if session is missing
                HttpCookie cookie = Request.Cookies["AdminUser"];
                if (cookie != null)
                {
                    Session["AdminLoggedIn"] = true;
                    Session["AdminUsername"] = cookie.Value;
                }
                else
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }

            if (!IsPostBack)
            {
                // Show logged-in admin username
                if (Session["AdminUsername"] != null)
                {
                    string username = Session["AdminUsername"].ToString();
                    lblAdminUser.Text = char.ToUpper(username[0]) + username.Substring(1);
                }

                LoadAbout();
                LoadSkills();
                LoadProjects();
            }
        }

        // Logout button click
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Clear cookie
            if (Request.Cookies["AdminUser"] != null)
            {
                HttpCookie cookie = new HttpCookie("AdminUser");
                cookie.Expires = DateTime.Now.AddDays(-1); // expired
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("Default.aspx");
        }

        // Load About section
        private void LoadAbout()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM About";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptAbout.DataSource = dt;
                rptAbout.DataBind();
            }
        }

        // Load Skills section
        private void LoadSkills()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Skills";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSkills.DataSource = dt;
                rptSkills.DataBind();
            }
        }

        // Load Projects section
        private void LoadProjects()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Projects";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }
    }
}
