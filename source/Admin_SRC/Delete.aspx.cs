using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Admin_SRC
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public int Count_Rows(string table)
        {
            int count = 0;
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string query = $"SELECT * from {table}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                count = dataTable.Rows.Count;
                conn.Close();
            }
            return count;
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            string itemTypeValue = itemType.SelectedValue;
            if (itemTypeValue == "balabizo")
            {
                msg.Text = "Please, select an Item To delete.";
                return;
            }
            UpdateForm();

            msg.Text = " ";
            if (itemTypeValue == "Course")
            {
                int Course_Id;
                try
                {
                    Course_Id = int.Parse(Request.Form["Course_id"]);
                    if (Course_Id < 0)
                        throw new InvalidDataException();
                }
                catch
                {
                    msg.Text = "Invalid course ID! Course ID is a positive integer.";
                    UpdateForm();
                    return;
                }
                msg.Text = " ";
                int oldcnt = Count_Rows("Course");
                DeleteCourse(Course_Id);
                int newcnt = Count_Rows("Course");
                if (oldcnt == newcnt)
                {
                    msg.Text = "Course ID does not exist!";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    msg.Text = "Course deleted Successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                UpdateForm();
            }
            else 
            {
                string Semster_code = Request.Form["Current Semster Code"];
                int oldcnt = Count_Rows("Slot");
                DeleteSlot(Semster_code);
                int newcnt = Count_Rows("Course");
                if (oldcnt == newcnt)
                {
                    msg.Text = "No slots were deleted! this semester do not have slots assigned to unoffered courses.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    msg.Text = "Slots deleted Successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                UpdateForm();

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
            if (itemTypeValue == "Course")
            {
                AddInputField("Course_id");
            }
            else
            {
                AddInputField("Current Semster Code");
            }
           
        }


        private void AddInputField(string labelText)
        {
            LiteralControl label = new LiteralControl("<label for='" + labelText + "'>" + labelText + ":</label>");
            TextBox textBox = new TextBox { ID = labelText, TextMode = TextBoxMode.SingleLine };
            dynamicFields.Controls.Add(label);
            dynamicFields.Controls.Add(textBox);
            dynamicFields.Controls.Add(new LiteralControl("<br/>"));
        }



        private void DeleteCourse(int course)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "EXEC Procedures_AdminDeleteCourse @courseID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@courseID", course);
                    command.ExecuteNonQuery();
                }
            }
        }
        private void DeleteSlot(string Current_Semster)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "EXEC Procedures_AdminDeleteSlots @current_semester";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@current_semester", Current_Semster);
                    command.ExecuteNonQuery();
                }
            }
        }
       
        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Page.aspx");
        }
    }
}