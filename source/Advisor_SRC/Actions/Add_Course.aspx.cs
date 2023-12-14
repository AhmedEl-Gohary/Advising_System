using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Advisor_SRC.Actions
{
    public partial class Add_Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string itemTypeValue = itemType.SelectedValue;

            if (itemTypeValue == "addCourse")
            {
                try
                {
                    int studentID = int.Parse(Request.Form["Student ID"]);
                    string semesterCode = Request.Form["Semester Code"];
                    string courseName = Request.Form["Course Name"];

                    InsertCourseData(studentID, semesterCode, courseName);

                    msg.Text = "Add Course was successful!";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    msg.Text = "Error adding course: " + ex.Message;
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (itemTypeValue == "addGraduationPlan")
            {
                try
                {
                    string semesterCode = Request.Form["Semester Code"];
                    DateTime expectedGraduationDate = DateTime.Parse(Request.Form["Expected Graduation Date"]);
                    int semCreditHours = int.Parse(Request.Form["Semester Credit Hours"]);
                    int advisorID = int.Parse(Request.Form["Advisor ID"]);
                    int studentID = int.Parse(Request.Form["Student ID"]);

                    InsertGraduationPlanData(semesterCode, expectedGraduationDate, semCreditHours,
                                                                        advisorID, studentID);


                    msg.Text = "Add Graduation Plan was successful!";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    msg.Text = "Error adding graduation plan: " + ex.Message;
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (itemTypeValue == "updateGraduationPlan")
            {
                try
                {
                    DateTime expectedGradDate = DateTime.Parse(Request.Form["Expected Graduation Date"]);
                    int studentID = int.Parse(Request.Form["Student ID"]);

                    UpdateGraduationPlanData(expectedGradDate, studentID);

                    msg.Text = "Update Graduation Plan was successful!";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    msg.Text = "Error updating graduation plan: " + ex.Message;
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
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
                AddInputField("Advisor ID");
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
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "[Procedures_AdvisorAddCourseGP]";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@student_id", studentID);
                        command.Parameters.AddWithValue("@Semester_code", semesterCode);
                        command.Parameters.AddWithValue("@course_name", courseName);

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = "Error adding course: " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void InsertGraduationPlanData(string semesterCode, DateTime expectedGraduationDate, int semCreditHours, int advisorID, int studentID)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "[Procedures_AdvisorCreateGP]";
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
            }
            catch (Exception ex)
            {
                msg.Text = "Error adding graduation plan: " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void UpdateGraduationPlanData(DateTime expectedGradDate, int studentID)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "[Procedures_AdvisorUpdateGP]";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@expected_grad_date", expectedGradDate);
                        command.Parameters.AddWithValue("@studentID", studentID);

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = "Error updating graduation plan: " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}