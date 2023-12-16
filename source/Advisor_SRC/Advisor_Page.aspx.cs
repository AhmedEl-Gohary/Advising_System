using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace source.Advisor_SRC
{
    public partial class Advisor_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int advisorID = 0;
            if (Session == null || Session["advisorID"] == null)
            {
                Response.Redirect("../Error_Page.aspx");
            }
            else
            {
                advisorID = int.Parse(Session["advisorID"].ToString());
            }
            string tmp = "hello";
        }

        protected void SelectedNodeChanged(object sender, EventArgs e)
        {
            string selectedNodeValue = Tree.SelectedValue as string;
            switch (selectedNodeValue)
            {
                case "Students":
                    Response.Redirect("Students/View.aspx");
                    break;
                case "View Requests":
                    Response.Redirect("Requests/View.aspx");
                    break;
                case "Actions":
                    Response.Redirect("Actions/Add_Course.aspx");
                    break;
                case "Handle Requests":
                    Response.Redirect("Actions/Handle_Requests.aspx");
                    break;
            }

        }
    }
}