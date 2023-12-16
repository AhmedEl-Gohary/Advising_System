using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC
{
    public partial class Student_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int studentId = 0;
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("../Error_Page.aspx");
            }
            else
            {
                studentId = int.Parse(Session["studentID"].ToString());
            }
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string table = "Student";
                string query = $"SELECT student_id as 'ID', f_name + ' ' + l_name as 'Full Name', GPA, email," +
                    $" major, semester, acquired_hours as 'Acquired Hours', assigned_hours as 'Assigned Hours', " +
                    $"advisor_id as 'Advisor ID' FROM {table} WHERE student_id = {studentId}";
                SqlDataAdapter adapter = new SqlDataAdapter(query , conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                conn.Close();
            }
        }

        protected void SelectedNodeChanged(object sender, EventArgs e)
        {
            string selectedNodeValue = List.SelectedValue as string;
            switch (selectedNodeValue)
            {
                case "View Courses":
                    Response.Redirect("Courses/View.aspx");
                    break;
                case "View Prerequisites":
                    Response.Redirect("Courses/Prerequisites.aspx");
                    break;
                case "Choose Instructor":
                    Response.Redirect("Courses/Instructor.aspx");
                    break;
                case "Upcoming Installment":
                    Response.Redirect("Financial/Installments.aspx");
                    break;
                case "View Plan":
                    Response.Redirect("Grad_Plan/Plan.aspx");
                    break;
                case "View Exams":
                    Response.Redirect("Makeup_Exams/View.aspx");
                    break;
                case "Registeration":
                    Response.Redirect("Makeup_Exams/Register.aspx");
                    break;
                case "Send Request":
                    Response.Redirect("Requests/Send.aspx");
                    break;
                case "Contacts":
                    Response.Redirect("Main/Contacts.aspx");
                    break;
            }
        }
    }
}