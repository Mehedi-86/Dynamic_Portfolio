using System;
using System.Data.SqlClient;
using System.Configuration;

namespace My_Portrfolio_86
{
    public partial class DeleteSkill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("AdminLogin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out int skillId))
                Response.Redirect("AdminDashboard.aspx");

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Skills WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", skillId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
