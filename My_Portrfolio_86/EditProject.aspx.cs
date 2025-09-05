using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class EditProject : System.Web.UI.Page
    {
        int projectId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("AdminLogin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out projectId))
                Response.Redirect("AdminDashboard.aspx");

            if (!IsPostBack)
                LoadProject();
        }

        private void LoadProject()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Projects WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", projectId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtTitle.Text = reader["Title"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtImageUrl.Text = reader["ImageUrl"].ToString();
                    txtProjectLink.Text = reader["ProjectLink"].ToString();
                }
            }
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
                string query = "UPDATE Projects SET Title=@Title, Description=@Description, ImageUrl=@ImageUrl, ProjectLink=@ProjectLink WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@ProjectLink", projectLink);
                cmd.Parameters.AddWithValue("@Id", projectId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
