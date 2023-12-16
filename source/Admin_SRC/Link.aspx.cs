using source.Student_SRC.Courses;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Admin_SRC
{
    public partial class Link : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int adminID;
            if (Session == null || Session["adminID"] == null)
            {
                Response.Redirect("~/Error_Page.aspx");
            }
            else
            {
                adminID = int.Parse(Session["adminID"].ToString());
            }
        }

		protected void itemType_SelectedIndexChanged(object sender, EventArgs e)
		{
			UpdateForm();
		}

		
		private void AddInputField(string labelText)
		{
			LiteralControl label = new LiteralControl("<label for='" + labelText + "'>" + labelText + ":</label>");
			TextBox textBox = new TextBox { ID = labelText, TextMode = TextBoxMode.SingleLine };


			dynamicFields.Controls.Add(label);
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
			dynamicFields.Controls.Add(textBox);
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string itemTypeValue = itemType.SelectedValue;
			if (itemTypeValue == "balabizo")
			{
				msg.Text = "Please select  Items you want to link first!";
				return;
			}

			msg.Text = " ";
			msg.ForeColor = System.Drawing.Color.Red;
			string warning = " ";
			if (itemTypeValue == "instructorToCourse")
			{
				int instructorID, courseID, slotID;
				try
				{
					warning = "Invalid instructor ID! Instructor ID should be positive integer.";
					 instructorID= Int16.Parse(Request.Form["Instructor ID"]);
					if (instructorID < 1)
						throw new InvalidDataException();

					warning = "Invalid course ID! Course ID should be positive integer.";
					 courseID = Int16.Parse(Request.Form["Course ID"]);
					if (courseID < 1)
						throw new InvalidDataException();

					warning = "Invalid slot ID! Slot ID should be positive integer.";
					 slotID = Int16.Parse(Request.Form["Slot ID"]);
					if (slotID< 1)
						throw new InvalidDataException();
				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}

				LinkInstructorToCourse(instructorID, courseID, slotID);
			}
			else if (itemTypeValue == "studentToAdvisor")
			{
				int studentID, advisorID;
				try
				{
					warning = "Invalid student ID! Student ID should be positive integer.";
					studentID = Int16.Parse(Request.Form["Student ID"]);
					if (studentID < 1)
						throw new InvalidDataException();

					warning = "Invalid advisor ID! Advisor ID should be positive integer.";
					advisorID = Int16.Parse(Request.Form["Advisor ID"]);
					if (advisorID < 1)
						throw new InvalidDataException();
				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}

				LinkStudentToAdvisor( studentID,  advisorID);
			}
			else if (itemTypeValue == "studentToCourseAndInstructor")
			{
				int studentID, courseID, instructorID;
				string semesterCode;

				try
				{

					warning = "Invalid student ID! Student ID should be positive integer.";
					studentID = Int16.Parse(Request.Form["Student ID"]);
					if (studentID < 1)
						throw new InvalidDataException();

					warning = "Invalid course ID! Course ID should be positive integer.";
					courseID = Int16.Parse(Request.Form["Course ID"]);
					if (courseID < 1)
						throw new InvalidDataException();

					warning = "Invalid instructor ID! Instructor ID should be positive integer.";
					instructorID = Int16.Parse(Request.Form["Course ID"]);
					if (instructorID < 1)
						throw new InvalidDataException();
					warning = "Invalid semester code! Semester code can't be empty.";
					semesterCode = Request.Form["Course ID"];
					if (semesterCode == "")
						throw new InvalidDataException();

				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}

				LinkStudentToCourseAndInstructor(studentID, courseID, instructorID, semesterCode);
			}
			UpdateForm();

		}

		private void UpdateForm()
		{
			string itemTypeValue = itemType.SelectedValue;
			dynamicFields.Controls.Clear(); // Clear previous dynamic fields

			// Add input fields based on the selected item type
			if (itemTypeValue == "instructorToCourse")
			{
				//Input: InstructorId int, courseId int, and slotID int
				AddInputField("Instructor ID");
				AddInputField("Course ID");
				AddInputField("Slot ID");
			}
			else if (itemTypeValue == "studentToAdvisor")
			{
				//Input: studentID int, advisorID int
				AddInputField("Student ID");
				AddInputField("Advisor ID");

			}
			else if (itemTypeValue == "studentToCourseAndInstructor")
			{
				//Input: Instructor Id int, student ID int, course ID, and semester code varchar(40)
				AddInputField("Student ID");
				AddInputField("Course ID");
				AddInputField("Instructor ID");
				AddInputField("Semester Code");
			}

			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
		}

		private void LinkInstructorToCourse(int instructorID,int  courseID, int slotID)
		{
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC Procedures_AdminLinkInstructor @cours_id, @instructor_id, @slot_id";
				using (SqlCommand command = new SqlCommand(query, connection))
				{

					command.Parameters.AddWithValue("@cours_id", courseID);
					command.Parameters.AddWithValue("@instructor_id", instructorID);
					command.Parameters.AddWithValue("@slot_id", slotID);
					try
					{
						int affectedRows = command.ExecuteNonQuery();
						if (affectedRows == 0)
							throw new InvalidDataException();
					}
					catch
					{
						msg.Text = "Link can't happen! either the specified instructor, course, or slot do not exist try again.";
						return;
					}

					msg.ForeColor = System.Drawing.Color.Green;
					msg.Text = "Instructor linked to course in the specified slot successfully ;-)";
				}
			}
		}

		private void LinkStudentToAdvisor(int studentID, int advisorID)
		{
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC Procedures_AdminLinkStudentToAdvisor @studentID, @advisorID";
				using (SqlCommand command = new SqlCommand(query, connection))
				{

					command.Parameters.AddWithValue("@studentID", studentID);
					command.Parameters.AddWithValue("@advisorID", advisorID);
					try
					{
						int affectedRows = command.ExecuteNonQuery();
						if (affectedRows == 0)
							throw new InvalidDataException();
					}
					catch
					{
						msg.Text = "Link can't happen! either the specified student or advisor do not exist try again.";
						return;
					}

					msg.ForeColor = System.Drawing.Color.Green;
					msg.Text = "Student linked to and advisor successfully ;-)";
				}
			}
		}

		private void LinkStudentToCourseAndInstructor(int studentID, int courseID, int instructorID, string semesterCode)
		{
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC Procedures_AdminLinkStudent @cours_id, @instructor_id, @studentID, @semester_code";
				using (SqlCommand command = new SqlCommand(query, connection))
				{
					command.Parameters.AddWithValue("@cours_id",courseID );
					command.Parameters.AddWithValue("@studentID", studentID);
					command.Parameters.AddWithValue("@instructor_id",instructorID );
					command.Parameters.AddWithValue("@semester_code",semesterCode );
					try
					{
						int affectedRows = command.ExecuteNonQuery();
						if (affectedRows == 0)
							throw new InvalidDataException();
					}
					catch
					{
						msg.Text = "Link can't happen! either the specified student, course, instructor or semester do not exist try again.";
						return;
					}

					msg.ForeColor = System.Drawing.Color.Green;
					msg.Text = "Student linked to a course with a specific instructor successfully ;-)";
				}
			}
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Admin_Page.aspx");
		}
	}
}