using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Show login panel if admin is not logged in
                pnlLogin.Visible = Session["AdminLoggedIn"] == null;

                LoadAbout();
                LoadSkills();
                LoadProjects();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim(); // For production, use hashed password

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Admins WHERE Username=@Username AND PasswordHash=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int count = (int)cmd.ExecuteScalar();
                    if (count == 1)
                    {
                        Session["AdminLoggedIn"] = true;
                        pnlLogin.Visible = false;
                        lblError.Text = "";
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password!";
                    }
                }
            }
        }

        private void LoadAbout()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT TOP 1 * FROM About";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblFullName.Text = reader["FullName"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                    imgProfile.ImageUrl = reader["ProfileImage"].ToString();
                }
            }
        }

        private void LoadSkills()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM Skills";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSkills.DataSource = dt;
                rptSkills.DataBind();
            }
        }

        private void LoadProjects()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM Projects";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }
    }
}
