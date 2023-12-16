using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Grad_Plan
{
    public partial class Plan : System.Web.UI.Page
    {
        int studentId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("../../Error_Page.aspx");
            }
            else
            {
                studentId = int.Parse(Session["studentID"].ToString());
            }
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection conn = new SqlConnection(connstr))
            {
                conn.Open();
                string table = $"dbo.FN_StudentViewGP({studentId})";
                string query = $"SELECT Student_name , expected_grad_date , semester_code , course_id , name FROM {table}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                if(dataTable.Rows.Count == 0)
                {
                    Label1.Text = "You don't have Graduation Plan Yet!";
                }
                conn.Close();
            }
        }
        protected void Go_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Student_Page.aspx");
        }
    }
}