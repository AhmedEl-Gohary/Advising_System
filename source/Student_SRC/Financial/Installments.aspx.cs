using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Student_SRC.Financial
{
    public partial class Installments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int studentId = 0;
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
                string query = $"Select top 1 * from Installment inner join Payment" +
                    $"  on Payment.payment_id = Installment.payment_id and " +
                    $"Payment.student_id = @student_ID and " +
                    $"Installment.status=\'notpaid\'  " +
                    $"where Installment.deadline > CURRENT_TIMESTAMP" +
                    $"  Order by Installment.deadline ASC";
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