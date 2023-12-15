using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace source.Admin_SRC
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enter(object sender, EventArgs e)
        {
            int id;
            try
            {
                id = int.Parse(TextBox1.Text);
                if (id < 1)
                    throw new InvalidDataException();
            }
            catch
            {
                msg.Text = "You Should enter a positive integer!";
                return;
            }
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
				conn.Open();
				using (SqlCommand upd = new SqlCommand("Procedure_AdminUpdateStudentStatus", conn))
                {
					upd.CommandType = CommandType.StoredProcedure;
					upd.Parameters.AddWithValue("@student_id", id);
					upd.ExecuteNonQuery();
					if (Existence_Check("Student", "student_id", id))
					{
						msg.Text = "Financial Status Updated Successfully";
						msg.ForeColor = System.Drawing.Color.Green;
					}
					else
					{
						msg.Text = "Student Id not valid! ID does not exist.";
						msg.ForeColor = System.Drawing.Color.Red;
					}
				}
			}
               
        }
        private bool Existence_Check<T>(string table, string column, T columnValue)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string query = $"SELECT * from {table} WHERE {column} = \'{columnValue}\'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count == 0)
                {
                    return false;
                }
                conn.Close();
            }
            return true;
        }
        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Page.aspx");
        }
    }
}