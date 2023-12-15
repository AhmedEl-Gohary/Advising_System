using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Advisor_SRC.Actions
{
    public partial class Handle_Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
            string itemTypeValue = itemType.SelectedValue;

            if (itemTypeValue == "HandleCreditHoursRequests")
            {
                try
                {
                    int requestID = int.Parse(Request.Form["Request ID"]);
                    string semesterCode = Request.Form["Semester Code"];
                    
                    if (!Existence_Check<int>("Request", "request_id", requestID))
                    {
                        msg.Text = "Request id doesn't exist";
                        msg.ForeColor = System.Drawing.Color.Red;

                    } 
                    else if (!Existence_Check<string>("Semester", "semester_code", semesterCode))
                    {
                        msg.Text = "Semester Code doesn't exist";
                        msg.ForeColor = System.Drawing.Color.Red;
                        
                    } 
                    else
                    {
                        HandleCreditHoursRequest(requestID, semesterCode);

                        msg.Text = "Credit hour request was handled successfully";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    msg.Text = "Error handling credit hour request: " + ex.Message;
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (itemTypeValue == "HandleCourseRequests")
            {

                try
                {
                    int requestID = int.Parse(Request.Form["Request ID"]);
                    string semesterCode = Request.Form["Semester Code"];

                    if (!Existence_Check<int>("Request", "request_id", requestID))
                    {
                        msg.Text = "Request id doesn't exist";
                        msg.ForeColor = System.Drawing.Color.Red;

                    }
                    else if (!Existence_Check<string>("Semester", "semester_code", semesterCode))
                    {
                        msg.Text = "Semester Code doesn't exist";
                        msg.ForeColor = System.Drawing.Color.Red;

                    }
                    else
                    {
                        HandleCourseRequest(requestID, semesterCode);

                        msg.Text = "Course request was handled successfully";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    msg.Text = "Error handling credit hour request: " + ex.Message;
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            UpdateForm();
        }


        protected void itemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateForm();
        }

        private void UpdateForm()
        {
            string itemTypeValue = itemType.SelectedValue;
            dynamicFields.Controls.Clear();

            AddInputField("Request ID");
            AddInputField("Semester Code");

            dynamicFields.Style["display"] = (itemTypeValue != "default") ? "block" : "none"; // Update visibility here
        }

        private void AddInputField(string labelText)
        {
            LiteralControl label = new LiteralControl("<label for='" + labelText + "'>" + labelText + ":</label>");
            TextBox textBox = new TextBox { ID = labelText, TextMode = TextBoxMode.SingleLine };

            textBox.Style["margin-bottom"] = "10px";
            dynamicFields.Controls.Add(label);
            dynamicFields.Controls.Add(new LiteralControl("&nbsp;"));
            dynamicFields.Controls.Add(textBox);
            dynamicFields.Controls.Add(new LiteralControl("<br/>"));
        }

        private void HandleCreditHoursRequest(int requestID, string semesterCode)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "Procedures_AdvisorApproveRejectCHRequest";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@requestID", requestID);
                        command.Parameters.AddWithValue("@current_sem_code", semesterCode);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = "Error adding course: " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
            }
            UpdateForm();
        }

        private void HandleCourseRequest(int requestID, string semesterCode)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "Procedures_AdvisorApproveRejectCourseRequest";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@requestID", requestID);
                        command.Parameters.AddWithValue("@current_sem_code", semesterCode);
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = "Error adding course: " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
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

    }
}