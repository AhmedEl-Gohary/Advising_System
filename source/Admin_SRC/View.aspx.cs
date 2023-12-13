using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Admin_SRC
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void BindGridView(string viewName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string query = $"SELECT * FROM {viewName}";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Bind data to the GridView
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
        private string GetViewName(string selectedValue)
        {
            switch (selectedValue)
            {
                case "1":
                    return "Student_Payment";
                case "2":
                    return "adasdas";
                case "3":
                    return "Semster_offered_Courses";
                case "4":
                    return "Students_Courses_transcript";
                case "5":
                    return "Student_Payment";
                case "6":
                    return "Semster_offered_Courses";
                case "7":
                    return "Students_Courses_transcript";
                case "8":
                    return "Student_Payment";
                case "9":
                    return "Semster_offered_Courses";
                case "10":
                    return "Semster_offered_Courses";
                default:
                    return "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        { 
            string selectedValue = list.SelectedValue;
            string viewName = GetViewName(selectedValue);
            if (viewName == "")
            {
                msg.Text = "Balabizak Ya user";
                return;
            }
            msg.Text = " ";
            BindGridView(viewName);
        }
	}
}