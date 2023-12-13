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
        }

        protected void Show(object sender, EventArgs e)
        {
            msg.Text = " ";
            int instructorID = 0;
            int courseID = 0;
            string currSemCode = semCode.Text.ToString();
            try
            {
                instructorID = int.Parse(Ins.Text.ToString());
            }
            catch 
            {
                msg.Text = "InstructorID is not valid";
                return;
            }
            
            try
            {
                courseID = int.Parse(Course.Text.ToString());
            }
            catch
            {
                msg.Text = "courseID is not valid";
                return;
            }

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

        protected void Choose(object sender, EventArgs e)
        {
            int instructorID = int.Parse(Ins.Text.ToString());
            int courseID = int.Parse(Course.Text.ToString());

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
                conn.Close();
            }
        }
    }
}