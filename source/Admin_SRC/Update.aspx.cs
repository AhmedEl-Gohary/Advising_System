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
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enter(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            int id;
            try
            {
                id = int.Parse(TextBox1.Text);
            }
            catch
            {
                msg.Text = "You Should enter a Number!";
                return;
            }
            SqlCommand upd = new SqlCommand("Procedure_AdminUpdateStudentStatus", conn);
            upd.CommandType = CommandType.StoredProcedure;
            upd.Parameters.Add(new SqlParameter("@student_id", id));
            conn.Open();
            upd.ExecuteNonQuery();   
            conn.Close();
        }

        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Page.aspx");
        }
    }
}