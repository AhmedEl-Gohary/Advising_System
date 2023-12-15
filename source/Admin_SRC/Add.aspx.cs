using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace source.Admin_SRC
{
	public partial class Add : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void submitButton_Click(object sender, EventArgs e)
		{
			string itemTypeValue = itemType.SelectedValue;
			if (itemTypeValue == "balabizo")
			{
				msg.Text = "Please select an Item and insert its data first !";
				return;
			}

			msg.Text = " ";
			msg.ForeColor = System.Drawing.Color.Red;
			string warning = " ";
			if (itemTypeValue == "semester")
			{
				DateTime startDate , endDate ;
				string semesterCode;
				try
				{
					warning= "Invalid start date! Dates should be of the form (DD/MM/YY).";
					startDate = DateTime.Parse(Request.Form["Start Date"]);

					warning = "Invalid end date!Dates should be of the form (DD/MM/YY).";
					endDate = DateTime.Parse(Request.Form["End Date"]);

					warning = "Invalid semester code! Semester code can't be empty";
					semesterCode = Request.Form["Semester Code"];
					if (semesterCode == "")
						throw new InvalidDataException();
				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}
				 
				InsertSemesterData(startDate, endDate, semesterCode);	
			}
			else if (itemTypeValue == "course")
			{
				string major, courseName;
				bool offered;
				int semester, creditHours;
				try
				{
					warning = "Invalid major! Major can't be empty";
					major = Request.Form["Major"];
					if (major == "")
						throw new InvalidDataException();

					warning = "Invalid course name! Course name can't be empty.";
					courseName = Request.Form["Course Name"];
					if (courseName == "")
						throw new InvalidDataException();

					warning = "Invalid offered input! Offered should be True or False. ";
					offered = Boolean.Parse(Request.Form["Offered"]);

					warning = "Invalid semester number !Semester number should be in the range 1-10.";
					semester = Int16.Parse(Request.Form["Semester"]);
					if (semester < 1 || semester > 10)
						throw new InvalidDataException();

					warning = "Invalid credit hours number! Credit hours should be a positive integer.";
					creditHours = Convert.ToInt16(Request.Form["Credit Hours"]);
					if (creditHours < 1)
						throw new InvalidDataException();

				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}
				
				InsertCourseData(major, semester, creditHours, courseName, offered);
			}
			else if (itemTypeValue == "exam")
			{
				string type;
				int courseID;
				DateTime date;

				try
				{
					warning = "Invalid type! Type should not be an empty string.";
					type = Request.Form["Type"];
					if (type == "")
						throw new InvalidDataException();

					warning = "Invalid date! A date should be pf the form (DD/MM/YY).";
					date = DateTime.Parse(Request.Form["Date"]);

					warning = "Invalid course ID! Course id should be a positive integer.";
					courseID =Int16.Parse(Request.Form["Course ID"]) ;
					if (courseID < 1 )
						throw new InvalidDataException();
				}
				catch
				{
					msg.Text = warning;
					UpdateForm();
					return;
				}
				
				InsertExamData(type, date, courseID);
			}
			UpdateForm();

		}

		private void AddInputField(string labelText)
		{
			LiteralControl label = new LiteralControl("<label for='" + labelText + "'>" + labelText + ":</label>");
			TextBox textBox = new TextBox { ID = labelText, TextMode = TextBoxMode.SingleLine };
            if (labelText.ToLower().Contains("date"))
            {
                textBox.TextMode = TextBoxMode.Date;
            }

            dynamicFields.Controls.Add(label);
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
			dynamicFields.Controls.Add(textBox);
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
			
		}



		private void InsertSemesterData(DateTime startDate, DateTime endDate, string semesterCode)
		{
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC AdminAddingSemester @start_date, @end_date , @semester_code";
				using (SqlCommand command = new SqlCommand(query, connection))
				{
					
					command.Parameters.AddWithValue("@start_date", startDate);
					command.Parameters.AddWithValue("@end_date", endDate);
					command.Parameters.AddWithValue("@semester_code", semesterCode);
					try
					{
						command.ExecuteNonQuery();
					}
					catch
					{
						msg.Text = "Invalid semester insertion! the semester code already exists try again.";
						return;
					}

					msg.ForeColor = System.Drawing.Color.Green;
					msg.Text = "new semester add successfully ;-)";
				}
			}
		}

		private void InsertCourseData(string major ,int semester, int creditHours, string courseName, bool offered)
		{
			
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC Procedures_AdminAddingCourse  @major , @semester , @credit_hours, @name, @is_offered";
				using (SqlCommand command = new SqlCommand(query, connection))
				{

					command.Parameters.AddWithValue("@major", major);
					command.Parameters.AddWithValue("@semester", semester);
					command.Parameters.AddWithValue("@credit_hours", creditHours);
					command.Parameters.AddWithValue("@name", courseName);
					command.Parameters.AddWithValue("@is_offered", offered);
					command.ExecuteNonQuery();
				}
				msg.ForeColor = System.Drawing.Color.Green;
				msg.Text = "new course add successfully ;-)";
			}
		}

		private void InsertExamData(string type, DateTime date, int courseID)
		{
			string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "EXEC Procedures_AdminAddExam @Type , @date, @courseID ";
				using (SqlCommand command = new SqlCommand(query, connection))
				{

					command.Parameters.AddWithValue("@Type", type);
					command.Parameters.AddWithValue("@date", date);
					command.Parameters.AddWithValue("@courseID", courseID);
					try
					{
						command.ExecuteNonQuery();
					}
					catch
					{
						msg.Text = "Invalid makeup exam insertion! the course id	was not found try again.";
						return;
					}
					msg.ForeColor = System.Drawing.Color.Green;
					msg.Text = "new makeup exam add successfully ;-)"; 

				}
			}
		}


		private void UpdateForm()
		{
			string itemTypeValue = itemType.SelectedValue;
			dynamicFields.Controls.Clear(); // Clear previous dynamic fields

			// Add input fields based on the selected item type
			if (itemTypeValue == "semester")
			{
				//Input: start_date date, end_date date, and semester code
				AddInputField("Start Date");
				AddInputField("End Date");
				AddInputField("Semester Code");
			}
			else if (itemTypeValue == "course")
			{
				//Input: major varchar(40), semester int, credit hours int,
				//course name varchar(40), and offered bit
				AddInputField("Major");
				AddInputField("Semester");
				AddInputField("Credit Hours");
				AddInputField("Course Name");
				AddInputField("Offered");
			}
			else if (itemTypeValue == "exam")
			{
				//Input: Type varchar(40), date datetime, courseID int
				AddInputField("Type");
				AddInputField("Date");
				AddInputField("Course ID");
			}

			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
			dynamicFields.Controls.Add(new LiteralControl("<br/>"));
		}

		protected void itemType_SelectedIndexChanged(object sender, EventArgs e)
		{
			UpdateForm();
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Admin_Page.aspx");
		}
	}
}