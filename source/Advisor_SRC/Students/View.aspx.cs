using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace source.Advisor_SRC.Students
{
    public partial class View : System.Web.UI.Page
    {
        int advisorID;
        string major = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                advisorID = int.Parse(Session["advisorID"].ToString());

            }
            catch
            {
                advisorID = 0;
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            string selectedValue = list.SelectedValue;

            msg.Text = " "; 
            msg.ForeColor = System.Drawing.Color.Black; 

            if (selectedValue == "-1")
            {
                msg.ForeColor = System.Drawing.Color.Red;
                msg.Text = "Please select a role.";
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string query = "";

            if (selectedValue == "1")
            {
                query = $"SELECT * FROM Student WHERE advisor_id = {advisorID}";
            }
            else if (selectedValue == "2")
            {
                major = txtMajor.Text;

                if (string.IsNullOrWhiteSpace(major))
                {
                    msg.ForeColor = System.Drawing.Color.Red;
                    msg.Text = "You must enter a major.";
                    return;
                }

                query = "EXEC Procedures_AdvisorViewAssignedStudents @AdvisorID, @major";
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    if (selectedValue == "2")
                    {
                        adapter.SelectCommand.Parameters.AddWithValue("@AdvisorID", advisorID);
                        adapter.SelectCommand.Parameters.AddWithValue("@major", major);
                    }

                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                }
            }
        }

        protected void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMajor.Visible = (list.SelectedValue == "2");
            msg.Text = " "; 
        }

        protected void txtMajor_TextChanged(object sender, EventArgs e)
        {
            major = txtMajor.Text;
            msg.Text = " ";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
