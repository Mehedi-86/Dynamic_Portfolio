using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class EditAbout : System.Web.UI.Page
    {
        int aboutId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("AdminLogin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out aboutId))
            {
                Response.Redirect("AdminDashboard.aspx");
            }

            if (!IsPostBack)
            {
                LoadAbout();
            }
        }

        private void LoadAbout()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM About WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", aboutId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtFullName.Text = reader["FullName"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtProfileImage.Text = reader["ProfileImage"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string profileImage = txtProfileImage.Text.Trim();

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(description))
            {
                lblError.Text = "Full Name and Description are required!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE About SET FullName=@FullName, Description=@Description, ProfileImage=@ProfileImage WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ProfileImage", profileImage);
                cmd.Parameters.AddWithValue("@Id", aboutId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
