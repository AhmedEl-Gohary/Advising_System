using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace source.Advisor_SRC
{
    public partial class Advisor_Register_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            string advisorName = name.Text;
            string advisorOffice = office.Text;
            string mail = email.Text;
            string pass = password.Text;


            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand register = new SqlCommand("[Procedures_AdvisorRegistration]", conn);
            register.CommandType = CommandType.StoredProcedure;

            register.Parameters.AddWithValue("@advisor_name", advisorName);
            register.Parameters.AddWithValue("@office", advisorOffice);
            register.Parameters.AddWithValue("@password", pass);
            register.Parameters.AddWithValue("@email", mail);

            SqlParameter studentID = register.Parameters.Add("@Advisor_id", SqlDbType.Int);


            studentID.Direction = ParameterDirection.Output;

            conn.Open();
            register.ExecuteNonQuery();
            registerSuccesslabel.Text = "Registered Succesfully! Your ID is " + studentID.Value.ToString();
            conn.Close();
        }

        protected void Login(object sender, EventArgs e)
        {
            Response.Redirect("../Login_Page.aspx");
        }
    }
}