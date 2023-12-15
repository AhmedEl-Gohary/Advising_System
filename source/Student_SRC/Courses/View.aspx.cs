using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Courses
{
    public partial class View : System.Web.UI.Page
    {
        int studentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("~/Error_Page.aspx");
            }
            else
            {
                studentID = int.Parse(Session["studentID"].ToString());
            }
            string selectedValue = List.SelectedValue;
            SemesterCode.Enabled = !(selectedValue == "-1" 
                || selectedValue == "1" || selectedValue == "5");
            if (!SemesterCode.Enabled)
            {
                SemesterCode.Text = "";
            }
            msg.Text = " ";
        }

        private void BindGridView(string procName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command;
                string query;
                string CurrentSemesterCode = SemesterCode.Text;
                if(procName == "Courses_Slots_Instructor")
                {
                    query = $"Select * From {procName}";
                    command = new SqlCommand(query, connection);
                }
                else if (procName == "SemsterAvailableCourses")
                {
                    query = $"Select * From dbo.FN_{procName}(@semestercode)";
                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@semestercode", CurrentSemesterCode);
                }
                else
                {
                    query = $"Procedures_{procName}";
                    command = new SqlCommand(query, connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@studentID", studentID);
                    if(procName != "ViewMS")
                    {
                        command.Parameters.AddWithValue("@current_semester_code", CurrentSemesterCode);
                    }
                }
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                connection.Open();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }




        private string GetProcName(string selectedValue)
        {
            switch (selectedValue)
            {
                case "1":
                    return "Courses_Slots_Instructor";
                case "2":
                    return "SemsterAvailableCourses";
                case "3":
                    return "ViewRequiredCourses";
                case "4":
                    return "ViewOptionalCourse";
                case "5":
                    return "ViewMS";
                default:
                    return "";
            }
        }

        private string GetMessage(string selectedValue)
        {
            switch (selectedValue)
            {
                case "1":
                    return "No Courses Yet";
                case "2":
                    return "No Available Courses in this Semester";
                case "3":
                    return "No Required Courses in this Semester";
                case "4":
                    return "No Optional Courses in this Semester";
                case "5":
                    return "No Missing Courses";
                default:
                    return "";
            }
        }

        protected void Show(object sender, EventArgs e)
        {
            msg.Text = " ";
            string selectedValue = List.SelectedValue;
            string procName = GetProcName(selectedValue);
            if (procName == "")
            {
                msg.Text = "Please specify the type!";
                return;
            }
            if(SemesterCode.Enabled && SemesterCode.Text == "")
            {
                msg.Text = "Please Enter Semester Code!";
                return;
            }
            if(SemesterCode.Enabled && !Existence_Check<string>("Semester", "semester_code", SemesterCode.Text))
            {
                msg.Text = "Please Enter Valid Semester Code!";
                return;
            }
            BindGridView(procName);
            if (GridView1.Rows.Count == 0)
            {
                msg.Text = GetMessage(selectedValue);
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

        protected void Go_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Student_Page.aspx");
        }
    }
}