﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace source
{
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["Advising_System"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            int id;
            int adminuserid = 123456;
            string adminpass = "1234";
            try
            {
                id = int.Parse(userName.Text);
            }
            catch
            {
                msg.Text = "UserName Should be a Number!";
                return;
            }
            string pass = password.Text;
            int selectedItem = int.Parse(list.SelectedValue.ToString());
            if (selectedItem == -1)
            {
                msg.Text = "You Should Select Your Role!";
                return;
            }
            conn.Open();
            // student
            if (selectedItem == 1)
            {
                SqlCommand FN_StudentLogin = new SqlCommand("SELECT dbo.FN_StudentLogin(@Student_id , @password)", conn);
                FN_StudentLogin.Parameters.AddWithValue("@Student_id", id);
                FN_StudentLogin.Parameters.AddWithValue("@password", pass);

                bool canLogin = canLogin = Boolean.Parse(FN_StudentLogin.ExecuteScalar().ToString());
                if (!Existence_Check<int>("Student" , "student_id" , id))
                {
                    msg.Text = "There is no student with this userName!";
                    return;
                }
                if (canLogin)
                {
                    Session["studentID"] = id;
                    Response.Redirect("Student_SRC/Student_Page.aspx");
                }
                else
                {
                    msg.Text = "Invalid Password/Blocked due to financial problem!";
                }
            }
            // advisor
            else if (selectedItem == 2)
            {
                SqlCommand FN_AdvisorLogin = new SqlCommand("SELECT dbo.FN_AdvisorLogin(@advisor_Id , @password)", conn);
                FN_AdvisorLogin.Parameters.AddWithValue("@advisor_Id", id);
                FN_AdvisorLogin.Parameters.AddWithValue("@password", pass);
                bool canLogin = Boolean.Parse(FN_AdvisorLogin.ExecuteScalar().ToString());
                if (canLogin)
                {
                    Session["advisorId"] = id;
                    Response.Redirect("Advisor_SRC/Advisor_Page.aspx");
                }
                else
                {
                    msg.Text = "Invalid ID/Password";
                }
            }
            // admin
            else
            {
                if (id == adminuserid && pass == adminpass)
                {
                    Response.Redirect("Admin_SRC/Admin_Page.aspx");
                }
                else
                {
                    msg.Text = "Invalid ID/Password";
                }
            }
            conn.Close();
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

        protected void Register(object sender, EventArgs e)
        {
            Response.Redirect("Registeration_Page.aspx");
        }
    }
}