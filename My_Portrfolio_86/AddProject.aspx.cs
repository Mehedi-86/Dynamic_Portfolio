using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("AdminLogin.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string imageUrl = txtImageUrl.Text.Trim();
            string projectLink = txtProjectLink.Text.Trim();

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description))
            {
                lblError.Text = "Title and Description are required!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Projects (Title, Description, ImageUrl, ProjectLink) VALUES (@Title, @Description, @ImageUrl, @ProjectLink)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@ProjectLink", projectLink);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
