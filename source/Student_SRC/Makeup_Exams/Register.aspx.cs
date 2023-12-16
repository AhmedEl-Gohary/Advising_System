using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using source.Student_SRC.Courses;

namespace source.Student_SRC.Makeup_Exams
{
    public partial class Register : System.Web.UI.Page
    {
        int studentID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (msg.Text != "Registered successfully!")
            {
                msg.ForeColor = System.Drawing.Color.Red;
            }
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("../../Error_Page.aspx");
            }
            else
            {
                studentID = int.Parse(Session["studentID"].ToString());
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            int selectedValue = int.Parse(list.SelectedValue.ToString());
            if (-1 == selectedValue)
            {
                msg.Text = "Please select the exam type!";
                return;
            }
            int courseId = 0;
            string semestercode = semesterCode.Text.ToString();
            try
            {
                courseId = int.Parse(courseID.Text.ToString());
            }
            catch
            {
                msg.Text = "CourseID must be a Number!";
                return;
            }

            if(!Existence_Check <int> ("Course" , "course_id" , courseId))
            {
                msg.Text = $"there is no course with ID = {courseId}";
                return;
            }
            if (!Existence_Check <string> ("Semester" , "semester_code" , semestercode))
            {
                msg.Text = $"there is no semester with code = {semestercode}" +
                    " Semester Code must be of the form Character followed by the Year e.g W23";
                return;
            }
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string type = selectedValue == 1 ? "First" : "Second";
                string query = $"Procedures_StudentRegister{type}Makeup";
                SqlCommand proc = new SqlCommand(query,conn);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.AddWithValue("@StudentID",studentID);
                proc.Parameters.AddWithValue("@courseID", courseId);
                proc.Parameters.AddWithValue("@studentCurr_sem", semestercode);

                try { 
                    int rowsAffecteed = proc.ExecuteNonQuery();
                    if (rowsAffecteed > 0)
                    {
                        msg.Text = "Registered successfully!";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        msg.Text = "You can't register for a Makeup Exam! it is either that you don't" +
                            " take the course currently or you already succeeded!";
                    }
                } 
                catch (SqlException sqlException)
                {
                    if (sqlException.Message ==
                        "Cannot insert the value NULL into column 'exam_id', table 'Advising_System.dbo.Exam_Student'; column does not allow nulls. INSERT fails. The statement has been terminated.")
                    {
                        msg.Text = $"The Course with ID= {courseID} doesn't have a{type.ToLower()} makeup exam yet!";
                    }
                    else if (sqlException.Message ==
                        "Your are not eligible to take 2nd makeup")
                    {
                        msg.Text = sqlException.Message;
                    }
                    else
                    {
                        msg.Text = "You have Already Regitered for a makeup exam for this course before!";
                    }

                    return;
                }
                conn.Close();
            }
            
        }

        private bool Existence_Check<T> (string table , string column ,  T columnValue) 
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