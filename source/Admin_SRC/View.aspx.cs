using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Admin_SRC
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindGridView(string type, string name)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string query;
            if (type == "View")
            {
                // For views
                query = $"SELECT * FROM {name}";
            }
            else
            {
                // For stored procedures
                query = $"EXEC {name}";
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Bind data to the GridView
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
        private (string type, string name) GetViewName(string selectedValue)
        {
            switch (selectedValue)
            {
                case "1":
                    return ("Stored_Procedure", "Procedures_AdminListAdvisors");
                case "2":
                    return ("Stored_Procedure", "AdminListStudentsWithAdvisors");
                case "3":
                    return ("View", "all_Pending_Requests");
                case "4":
                    return ("View", "Instructors_AssignedCourses");
                case "5":
                    return ("View", "Semster_offered_Courses");
                case "6":
                    return ("View", "Student_Payment");
                case "7":
                    return ("View", "view_Students");
                case "8":
                    return ("View", "Advisors_Graduation_Plan");
                case "9":
                    return ("View", "Students_Courses_transcript");
                default:
                    return ("", "");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectedValue = list.SelectedValue;
            string type, name;
            (type, name) = GetViewName(selectedValue);

            if (type == "")
            {
                msg.Text = "Balabizak Ya user";
                return;
            }
            msg.Text = " ";
            BindGridView(type, name);
        }


		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Admin_Page.aspx");
		}
	}


}