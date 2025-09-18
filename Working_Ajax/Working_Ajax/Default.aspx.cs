using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI; 

namespace Working_Ajax
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {}

        [WebMethod]
        public static string ValidateUser(string username, string password)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Email=@Email AND Password=@Password";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    conn.Close();
                    if (count > 0)
                    {
                        // ✅ Store session
                        HttpContext.Current.Session["User"] = username;
                        return "success";
                    }
                    else
                        return "Invalid email or password";
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
    }
}