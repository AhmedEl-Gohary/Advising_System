using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO.IsolatedStorage;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Requests
{
    public partial class Send : System.Web.UI.Page
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
        }

        protected void Go_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Student_Page.aspx");
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "-1")
            {
                msg.Text = "Please select a request type";
                msg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string type = (DropDownList1.SelectedValue == "1") ? "credit hours" : "course";
            string queryName = (DropDownList1.SelectedValue == "1") ? "CH" : "Course";
            string attribute = (DropDownList1.SelectedValue == "1") ? "credit_hours" : "courseID";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"Procedures_StudentSending{queryName}Request";
                SqlCommand command = new SqlCommand(query, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                string comment = Comment_Text.Text;
                command.Parameters.AddWithValue("@StudentID", studentID);
                command.Parameters.AddWithValue("@comment", comment);
                command.Parameters.AddWithValue("@type", type);
                try {                    
                    int value = int.Parse(TextBox1.Text);
                    if (value <= 0 && type == "credit hours")
                    {
                        throw new Exception();
                    }
                    command.Parameters.AddWithValue($"@{attribute}", value);
                 }
                catch
                {
                    msg.Text = $"Please Enter Valid {Label1.Text}!";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                connection.Open();
                try
                {
                    command.ExecuteNonQuery();
                    msg.Text = "Request Sent Successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                    Reset_Text();
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 515)
                    {
                        msg.Text = $"Please Enter Valid {Label1.Text}!";
                        msg.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                    msg.Text = "Error Sending Request!";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            Load_Requests(type);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedValue == "-1")
            {
                Set_Visible(false);
                DataTable dataTable = new DataTable();
                Requests.DataSource = dataTable;
                Requests.DataBind();
            }
            else
            {
                Set_Visible(true);
                Label1.Text = (DropDownList1.SelectedValue == "1") 
                    ? "Credit Hours" : "Course ID";
                string type = (DropDownList1.SelectedValue == "1")
                    ? "credit hours" : "course";
                Load_Requests(type);
            }
            msg.Text = "";
        }

        private void Load_Requests(string type)
        {

            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string col = (type == "credit hours") ? "credit_hours" : "course_id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"SELECT request_id, {col}, status, comment FROM Request" +
                    $" WHERE student_id = {studentID} and type = \'{type}\'" +
                    $" ORDER BY status ASC";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                connection.Open();
                adapter.Fill(dataTable);
                Requests.DataSource = dataTable;
                Requests.DataBind();
            }
        }

        private void Set_Visible(bool Is_Visible)
        {
            Label1.Visible = Is_Visible;
            TextBox1.Visible = Is_Visible;
            Comment_Label.Visible = Is_Visible;
            Comment_Text.Visible = Is_Visible;
            Send_Button.Visible = Is_Visible;
            msg.Visible = Is_Visible;
            Requests.Visible = Is_Visible;
        }

        private void Reset_Text()
        {
            TextBox1.Text = "";
            Comment_Text.Text = "";
        }
    }
}