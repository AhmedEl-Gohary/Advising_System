using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source.Advisor_SRC.Requests
{
    public partial class View : System.Web.UI.Page
    {
        int advisorID;

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

        protected void OnButtonCLick(object sender, EventArgs e)
        {
            string selectedValue = dropDownList.SelectedValue;

            if (selectedValue == "")
            {
                msg.Text = "You must choose a listing option.";
                return;
            }

            msg.Text = "";

            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            string query = "";

            switch (selectedValue)
            {
                case "All":
                    query = $"SELECT * FROM dbo.FN_Advisors_Requests({advisorID})";
                    break;

                case "Pending":
                    query = "Procedures_AdvisorViewPendingRequests";
                    break;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    if (selectedValue == "Pending")
                    {
                        adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adapter.SelectCommand.Parameters.AddWithValue("@Advisor_ID", advisorID);
                    }

                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    GridViewRequests.DataSource = dataTable;
                    GridViewRequests.DataBind();
                }
            }
        }
    }

}