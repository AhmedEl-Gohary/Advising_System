using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC
{
    public partial class Student_Register_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            Response.Redirect("../Login_Page.aspx");
        }

        protected void Register(object sender, EventArgs e)
        {
            string firstName = fname.Text;
            string lastName = lname.Text;
            string facultyName = faculty.Text;
            string majorName = major.Text;
            string pass = password.Text;
            string mail = email.Text;
            int currSemester;
            try
            {
                currSemester = int.Parse(semester.Text);
            }
            catch
            {
                msg.Text = "semester is a number indicating your current semester!";
                return;
            }
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand register = new SqlCommand("[Procedures_StudentRegistration]", conn);
            register.CommandType = CommandType.StoredProcedure;
            register.Parameters.AddWithValue("@first_name", firstName);
            register.Parameters.AddWithValue("@last_name", lastName);
            register.Parameters.AddWithValue("@password", pass);
            register.Parameters.AddWithValue("@faculty", facultyName);
            register.Parameters.AddWithValue("@email", mail);
            register.Parameters.AddWithValue("@major", majorName);
            register.Parameters.AddWithValue("@Semester", currSemester);
            SqlParameter studentID = register.Parameters.Add("@Student_id", SqlDbType.Int);
            studentID.Direction = ParameterDirection.Output;
            if (!Existence_Check<string>("Student","email", mail))
            {
                msg.Text = "This email already exists!";
                return;
            }
            conn.Open();
            register.ExecuteNonQuery();
            registerSuccesslabel.Text = "Registered Succesfully! Your ID is " + studentID.Value.ToString();
            conn.Close();
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