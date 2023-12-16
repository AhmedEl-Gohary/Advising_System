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
        int advisorId;
        protected void Page_Load(object sender, EventArgs e)
        {
            msg.Text = " ";
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
            int requestID = 0; 
            string semesterCode = Request.Form["Semester Code"];

            try
            {
                requestID = int.Parse(Request.Form["Request ID"]);
            }
            catch 
            {
                msg.Text = "Request id must be a Number!";
                msg.ForeColor = System.Drawing.Color.Red;
                goto lastLine;
            }

            if (!Existence_Check<int>("Request", "request_id", requestID))
            {
                msg.Text = "Request id doesn't exist";
                msg.ForeColor = System.Drawing.Color.Red;
                goto lastLine;
            }
            else if (!Existence_Check<string>("Semester", "semester_code", semesterCode))
            {
                msg.Text = "Semester Code doesn't exist";
                msg.ForeColor = System.Drawing.Color.Red;
                goto lastLine;
            }

            if (itemTypeValue == "HandleCreditHoursRequests")
            {
                try
                {
                    HandleCreditHoursRequest(requestID, semesterCode);
                }
                catch (SqlException ex)
                {
                    if (ex.Message == "Invalid Type")
                    {
                        msg.Text = "This request is not a credit-hours request!";
                    }
                    else if (ex.Message == "Invalid Status")
                    {
                        msg.Text = "This request is already handled!";
                    }
                    else
                    {
                        msg.Text = "Error took Place: " + ex.Message;
                    }
                    msg.ForeColor = System.Drawing.Color.Red;
                    goto lastLine;
                }

                msg.Text = "Credit hour request was handled successfully";
                msg.ForeColor = System.Drawing.Color.Green;
            }

            else if (itemTypeValue == "HandleCourseRequests")
            {
                try
                {
                    HandleCourseRequest(requestID, semesterCode);
                }
                catch (SqlException ex)
                {
                    if (ex.Message == "Invalid Type")
                    {
                        msg.Text = "This request is not a course request!";
                    }
                    else if (ex.Message == "Invalid Status")
                    {
                        msg.Text = "This request is already handled!";
                    }
                    else
                    {
                        msg.Text = "The Student is already taking this course in this semester!";
                    }
                    msg.ForeColor = System.Drawing.Color.Red;
                    goto lastLine;
                }

                msg.Text = "Course request was handled successfully";
                msg.ForeColor = System.Drawing.Color.Green;
            }
            lastLine:  UpdateForm();
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
            UpdateForm();
        }

        private void HandleCourseRequest(int requestID, string semesterCode)
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
                    command.Parameters.AddWithValue("@current_semester_code", semesterCode);
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