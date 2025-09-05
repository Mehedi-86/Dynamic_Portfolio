using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class DeleteProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("AdminLogin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out int projectId))
                Response.Redirect("AdminDashboard.aspx");

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Projects WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", projectId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
