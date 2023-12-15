using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Courses
{
    public partial class Instructor : System.Web.UI.Page
    {
        int studentId = 0;
        int instructorID = 0;
        int courseID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("../Error_Page.aspx");
            }
            else
            {
                studentId = int.Parse(Session["studentID"].ToString());
            }
            msg.Text = " ";
        }

        protected void Choose(object sender, EventArgs e)
        {
            if (!Input_Handle())
            {
                return;
            }
            string currSemCode = semCode.Text.ToString();

            DataTable dataTable = new DataTable();
            GridView1.DataSource = dataTable;
            GridView1.DataBind();

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                SqlCommand proc = new SqlCommand(
                    "Procedures_ChooseInstructor"
                    , conn);
                proc.CommandType = CommandType.StoredProcedure;
                proc.Parameters.AddWithValue("@StudentID",studentId);
                proc.Parameters.AddWithValue("@instrucorID",instructorID);
                proc.Parameters.AddWithValue("@CourseID",courseID);
                proc.Parameters.AddWithValue("@current_semester_code", currSemCode);
                proc.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void Show(object sender, EventArgs e)
        {
            msg.Text = " ";
            if (!Input_Handle())
            {
                return;
            }

            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string table = $"dbo.FN_StudentViewSlot({courseID},{instructorID})";
                string query = $"SELECT * FROM {table}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                if (dataTable.Rows.Count == 0)
                {
                    msg.Text = $"There Are no Slots that are taught by Instructor: {instructorID}";
                }
                conn.Close();
            }
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int selectValue = int.Parse(DropDownList1.SelectedValue);
            bool visiblity = selectValue != 1;
            Button2.Visible = visiblity;
            semCode.Visible = visiblity;
            Label3.Visible = visiblity;
            Button1.Visible = !visiblity;
        }

        private bool Input_Handle()
        {
            try
            {
                instructorID = int.Parse(Ins.Text.ToString());

            }
            catch
            {
                msg.Text = "InstructorID should be a Number!";
                return false;
            }

            try
            {
                courseID = int.Parse(Course.Text.ToString());
            }
            catch
            {
                msg.Text = "courseID should be a Number!";
                return false;
            }
            if(!Existence_Check<int> ("Instructor" , "instructor_id" , instructorID))
            {
                msg.Text = "There is no Instructor with that given ID! Please check the ID and try again";
                return false;
            }
            if(!Existence_Check<int> ("Course" , "course_id" , courseID))
            {
                msg.Text = "There is no Course with that given ID! Please check the ID and try again";
                return false;
            }
            msg.Text = " ";
            return true;
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