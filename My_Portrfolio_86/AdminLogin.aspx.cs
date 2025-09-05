using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();  // For production, hash this

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
                        // Login successful
                        Session["AdminLoggedIn"] = true;
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password!";
                    }
                }
            }
        }
    }
}
