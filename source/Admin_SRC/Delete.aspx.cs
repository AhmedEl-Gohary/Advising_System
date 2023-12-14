using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        protected void submitButton_Click(object sender, EventArgs e)
        {
            string itemTypeValue = itemType.SelectedValue;
            if (itemTypeValue == "balabizo")
            {
                msg.Text = "Please select an Item !";
                return;
            }

            msg.Text = " ";
            if (itemTypeValue == "Course")
            {
                int Course_Id;
                try
                {
                    Course_Id = int.Parse(Request.Form["Course_id"]);
                }
                catch
                {
                    msg.Text = "Invalid Course ID";
                    return;
                }


                msg.Text = " ";
                DeleteCourse(Course_Id);
            }
            else 
            {
                string Semster_code = Request.Form["Current Semster Code"];
                DeleteSlot(Semster_code);

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
    }
}