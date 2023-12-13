using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source
{
    public partial class Registeration_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            int selectedItem = int.Parse(list.SelectedValue.ToString());
            if (selectedItem == -1)
            {
                msg.Text = "You Should Select Your Role!";
            }
            else if (selectedItem == 1)
            {
                Response.Redirect("Student_SRC/Student_Register_Page.aspx");
            }
            else if (selectedItem == 2)
            {
                Response.Redirect("Advisor_SRC/Advisor_Register_Page.aspx");
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
        }
    }
}