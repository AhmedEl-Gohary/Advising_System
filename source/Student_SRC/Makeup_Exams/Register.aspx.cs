using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Makeup_Exams
{
    public partial class Register : System.Web.UI.Page
    {
        int studentID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("../Error_Page.aspx");
            }
            else
            {
                studentID = int.Parse(Session["studentID"].ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int selectedValue = int.Parse(list.SelectedValue.ToString());
            if (-1 == selectedValue)
            {
                msg.Text = "Please select the exam type!";
                return;
            }
            int courseId = 0;
            try
            {
                courseId = int.Parse(courseID.Text.ToString());
            }
            catch
            {
                msg.Text = "not Valid CourseID";
                return;
            }
            string semestercode = semesterCode.Text.ToString();

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
                proc.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(
                    $"SELECT * from Student_Instructor_Course_Take WHERE " +
                    $"student_id = {studentID} AND course_id = {courseId} AND " +
                    $"semester_code = \'{semestercode}\' AND exam_type = \'{type}_Makeup\' " +
                    $"AND grade IS NULL"
                    , conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if(dataTable.Rows.Count > 0)
                {
                    msg.Text = "You have Registered Successfully!";
                }
                else
                {
                    msg.Text = "Registeration Failed!";
                }
                conn.Close();
            }
        }
    }
}