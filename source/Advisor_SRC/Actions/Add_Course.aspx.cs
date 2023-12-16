using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Advisor_SRC.Actions
{
    public partial class Add_Course : System.Web.UI.Page
    {

        int advisorId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["advisorID"] == null)
            {
                Response.Redirect("~/Error_Page.aspx");
            } 
            else
            {
                advisorId = int.Parse(Session["advisorID"].ToString());
            }
        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
            string itemTypeValue = itemType.SelectedValue;
            int studentID;

            try
            {
                studentID = int.Parse(Request.Form["Student ID"]);
            }
            catch
            {
                msg.Text = "StudentID should be a Number!";
                msg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!Existence_Check<int>("Student", "student_id", studentID))
            {
                msg.Text = "Student id doesn't exist";
                msg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string query = $"SELECT COUNT(*) FROM Student WHERE student_id = {studentID} AND advisor_id = {advisorId}";
            int count = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    count = (int)command.ExecuteScalar();
                }
            }
            bool notMyStudent = (count == 0);

            if (notMyStudent)
            {
                msg.Text = "This student is not one of your assigned students";
                msg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (itemTypeValue == "addCourse")
            {
                string semesterCode = Request.Form["Semester Code"];
                string courseName = Request.Form["Course Name"];

                if (!Existence_Check<string>("Semester", "semester_code", semesterCode))
                {
                    msg.Text = "Semester Code doesn't exist";
                    msg.ForeColor = System.Drawing.Color.Red;

                }
                else if (!Existence_Check<string>("Course", "name", courseName))
                {
                    msg.Text = "Course name doesn't exist";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if (!Already_Have_A_GradPlan(studentID, semesterCode ,1))
                {
                    msg.Text = $"Student with ID = {studentID} doesn't have a graduation plan in " +
                        $"this semester!";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    try
                    {
                        InsertCourseData(studentID, semesterCode, courseName);
                    }
                    catch
                    {
                        msg.Text = $"Student with ID = {studentID} already has this course in his/her " +
                            $"graduation plan!";
                        msg.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                    msg.Text = "Adding Course was successful!";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
            }
            else if (itemTypeValue == "addGraduationPlan")
            {
                string semesterCode = Request.Form["Semester Code"];
                DateTime expectedGraduationDate = DateTime.Parse(Request.Form["Expected Graduation Date"]);
                int semCreditHours;
                try
                {
                    semCreditHours = int.Parse(Request.Form["Semester Credit Hours"]);
                }
                catch
                {
                    msg.Text = "Semester Credit Hours must be a Number!";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (Already_Have_A_GradPlan(studentID, semesterCode, 1))
                {
                    msg.Text = "A graduation plan alrady exists for this student in this semester!";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if (!Existence_Check<string>("Semester", "semester_code", semesterCode))
                {
                    msg.Text = "Semester Code doesn't exist";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    InsertGraduationPlanData(semesterCode, expectedGraduationDate, semCreditHours,
                                                                   advisorId, studentID);
                    if(Already_Have_A_GradPlan(studentID , semesterCode , 1))
                    {
                        msg.Text = "Graduation plan was successful";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        msg.Text = $"Insertion Failed: Student with ID = {studentID} doesn't have enough acquired hours";
                        msg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else if (itemTypeValue == "updateGraduationPlan")
            {
                DateTime expectedGradDate = DateTime.Parse(Request.Form["Expected Graduation Date"]);
                if(!Already_Have_A_GradPlan(studentID , "" , 2))
                {
                    msg.Text = "This Student doesn't have a Graduation Plan Yet!";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                UpdateGraduationPlanData(expectedGradDate, studentID);
                msg.Text = "Updating Graduation Plan was successful!";
                msg.ForeColor = System.Drawing.Color.Green;
            }
            UpdateForm();
        }

       
        private bool Already_Have_A_GradPlan(int studentID , string semesterCode , int type)
        {
            string query = $"SELECT COUNT(*) FROM Graduation_Plan WHERE student_id = {studentID}";
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            if(type == 1)
            {
                query += $" AND semester_code = \'{semesterCode}\'";
            }
            int count = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    count = (int) command.ExecuteScalar();
                }
            }
            return (count != 0);
        }

        protected void itemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateForm();
        }

        private void UpdateForm()
        {
            string itemTypeValue = itemType.SelectedValue;
            dynamicFields.Controls.Clear();

            if (itemTypeValue == "addCourse")
            {
                AddInputField("Student ID");
                AddInputField("Semester Code");
                AddInputField("Course Name");
            }
            else if (itemTypeValue == "addGraduationPlan")
            {
                AddInputField("Semester Code");
                AddInputField("Expected Graduation Date");
                AddInputField("Semester Credit Hours");
                AddInputField("Student ID");
            }
            else if (itemTypeValue == "updateGraduationPlan")
            {
                AddInputField("Expected Graduation Date");
                AddInputField("Student ID");
            }

            dynamicFields.Style["display"] = (itemTypeValue != "default") ? "block" : "none"; // Update visibility here
        }

        private void AddInputField(string labelText)
        {
            LiteralControl label = new LiteralControl("<label for='" + labelText + "'>" + labelText + ":</label>");
            TextBox textBox = new TextBox { ID = labelText, TextMode = TextBoxMode.SingleLine };


            if (labelText.ToLower().Contains("date"))
            {
                textBox.TextMode = TextBoxMode.Date;
            }

            textBox.Style["margin-bottom"] = "10px";
            dynamicFields.Controls.Add(label);
            dynamicFields.Controls.Add(new LiteralControl("&nbsp;"));
            dynamicFields.Controls.Add(textBox);
            dynamicFields.Controls.Add(new LiteralControl("<br/>"));
        }

        private void InsertCourseData(int studentID, string semesterCode, string courseName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "Procedures_AdvisorAddCourseGP";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@student_id", studentID);
                    command.Parameters.AddWithValue("@Semester_code", semesterCode);
                    command.Parameters.AddWithValue("@course_name", courseName);

                    command.ExecuteNonQuery();
                }
            }
            UpdateForm();
        }

        private void InsertGraduationPlanData(string semesterCode, DateTime expectedGraduationDate, int semCreditHours, int advisorID, int studentID)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "Procedures_AdvisorCreateGP";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@Semester_code", semesterCode);
                    command.Parameters.AddWithValue("@expected_graduation_date", expectedGraduationDate);
                    command.Parameters.AddWithValue("@sem_credit_hours", semCreditHours);
                    command.Parameters.AddWithValue("@advisor_id", advisorID);
                    command.Parameters.AddWithValue("@student_id", studentID);

                    command.ExecuteNonQuery();
                }
            }
            UpdateForm();
        }

        private void UpdateGraduationPlanData(DateTime expectedGradDate, int studentID)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "Procedures_AdvisorUpdateGP";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@expected_grad_date", expectedGradDate);
                    command.Parameters.AddWithValue("@studentID", studentID);

                    command.ExecuteNonQuery();
                }
            }
            UpdateForm();
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
        protected void GoBack(object sender, EventArgs e)
        {
            Response.Redirect("../Advisor_Page.aspx");
        }
    }


}