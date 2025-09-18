using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Working_Ajax
{
    public partial class Employees : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadEmployees();
            }
        }

        private void LoadDepartments()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT DeptId, DeptName FROM Departments", conn);
                conn.Open();
                ddlDepartment.DataSource = cmd.ExecuteReader();
                ddlDepartment.DataTextField = "DeptName";
                ddlDepartment.DataValueField = "DeptId";
                ddlDepartment.DataBind();
                conn.Close();
            }
        }

        private void LoadEmployees()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT e.EmpId, e.Name, e.Email, d.DeptName 
                                 FROM Employeees e
                                 INNER JOIN Departments d ON e.DeptId = d.DeptId";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Employeees (Name, Email, DeptId) VALUES (@Name, @Email, @DeptId)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@DeptId", ddlDepartment.SelectedValue);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadEmployees();
            txtName.Text = "";
            txtEmail.Text = "";
        }

        protected void gvEmployees_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvEmployees.EditIndex = e.NewEditIndex;
            LoadEmployees();
        }

        protected void gvEmployees_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvEmployees.EditIndex = -1;
            LoadEmployees();
        }

        protected void gvEmployees_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int empId = Convert.ToInt32(gvEmployees.DataKeys[e.RowIndex].Value);
            string name = ((System.Web.UI.WebControls.TextBox)gvEmployees.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string email = ((System.Web.UI.WebControls.TextBox)gvEmployees.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Employeees SET Name=@Name, Email=@Email WHERE EmpId=@EmpId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@EmpId", empId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            gvEmployees.EditIndex = -1;
            LoadEmployees();
        }

        protected void gvEmployees_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int empId = Convert.ToInt32(gvEmployees.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Employeees WHERE EmpId=@EmpId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmpId", empId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadEmployees();
        }
    }
}
