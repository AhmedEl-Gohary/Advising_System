using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Main
{
    public partial class Contacts : System.Web.UI.Page
    {
        int studentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["studentID"] == null)
            {
                Response.Redirect("~/Error_Page.aspx");
            }
            else
            {
                studentID = int.Parse(Session["studentID"].ToString());
            }
            Load_Contacts();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (Phone.Text == "")
            {
                msg.Text = "Please Enter Phone Number!";
                return;
            }
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "Procedures_StudentaddMobile";
                SqlCommand command = new SqlCommand(query, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                string phone = Phone.Text;
                command.Parameters.AddWithValue("@StudentID", studentID);
                command.Parameters.AddWithValue("@mobile_number", phone);
                connection.Open();
                try { 
                    command.ExecuteNonQuery(); 
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 2627)
                    {
                        msg.Text = "This Phone Number Already Exists!";
                        return;
                    }
                    if (ex.Number == 515)
                    {
                        msg.Text = "Please Enter Valid Phone Number!";
                        return;
                    }
                    msg.Text = ex.Message;
                    return;
                }
            }
            msg.Text = "Phone Number Added Successfully!";
            Load_Contacts();
            Phone.Text = "";
        }

        protected void Go_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Student_Page.aspx");
        }

        private void Load_Contacts()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = $"SELECT phone_number FROM Student_Phone WHERE student_id = {studentID}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                connection.Open();
                adapter.Fill(dataTable);
                connection.Close();
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

    }
}