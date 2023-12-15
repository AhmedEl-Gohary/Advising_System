using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Admin_SRC
{
    public partial class Issue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enter(object sender, EventArgs e)
        {
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
			if (!Existence_Check("Payment", "payment_id", id))
			{
				msg.Text = "Invalid Payment ID";
				msg.ForeColor = System.Drawing.Color.Red;
                return;
			}

			string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
			using(SqlConnection conn = new SqlConnection(connstr))
            {
				conn.Open();
                using (SqlCommand issue = new SqlCommand("Procedures_AdminIssueInstallment", conn))
                {
					issue.CommandType = CommandType.StoredProcedure;
					issue.Parameters.Add(new SqlParameter("@payment_id", id));
					try
					{
						issue.ExecuteNonQuery();
					}
					catch
					{
						msg.Text = "This paymen is already issued!";
						msg.ForeColor = System.Drawing.Color.Red;
						return;
					}
				}
				conn.Close();
			}

			msg.Text = "Payment has been partitioned to Installments Successfully";
			msg.ForeColor = System.Drawing.Color.Green;
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
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Page.aspx");
        }
    }
}