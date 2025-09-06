using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "All fields are required!";
                return;
            }

            if (password != confirmPassword)
            {
                lblError.Text = "Passwords do not match!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if username exists
                string checkUser = "SELECT COUNT(*) FROM Admins WHERE Username=@Username";
                using (SqlCommand cmd = new SqlCommand(checkUser, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    int exists = (int)cmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        lblError.Text = "Username already exists!";
                        return;
                    }
                }

                // Insert new admin
                string query = "INSERT INTO Admins (Username, PasswordHash) VALUES (@Username, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // ⚠️ In production: hash this!

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("AdminLogin.aspx");
        }
    }
}
