using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace My_Portrfolio_86
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();  // For production, hash this

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Username and password are required!";
                return;
            }

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
                        // ✅ Session
                        Session["AdminLoggedIn"] = true;
                        Session["AdminUsername"] = username;

                        // ✅ Cookie (7 days)
                        HttpCookie adminCookie = new HttpCookie("AdminUser");
                        adminCookie.Value = username;
                        adminCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(adminCookie);

                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password!";
                    }
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminRegister.aspx");
        }
    }
}
