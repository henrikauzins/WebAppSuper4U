using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Collections;
using System.IO;
namespace WebAppSuper4U
{
    public partial class login : System.Web.UI.Page
    {
        // sql commands that are used to connect the database to the website
        // searches through the database for correct information
        string conString = ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter sqlDA;
        DataTable dt;
        int rowCount;
        string str, userName, pw;
        protected void Page_Load(object sender, EventArgs e)
        {
            // error message will not show unless incorrect details are entered
            error.Visible = false;
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);

            // opens connection to the database
            con.Open();
            //selects all data from database table
            str = "SELECT * FROM Users";
            cmd = new SqlCommand(str);
            sqlDA = new SqlDataAdapter(cmd.CommandText, con);
            dt = new DataTable();
            sqlDA.Fill(dt);
            rowCount = dt.Rows.Count;

            for (int i = 0; i < rowCount; i++)
            {
                userName = dt.Rows[i]["Username"].ToString();
                pw = dt.Rows[i]["Password"].ToString();

                // conditional statements that determine whether user is an admin or employee
                if (userName == uname.Text && pw == password.Text)
                {
                    Session["Username"] = userName;
                    if (dt.Rows[i]["Usertype"].ToString() == "Admin")
                    {
                        // redirects user to admin page if the usertype is admin
                        Response.Redirect("admin.aspx");
                    }
                    else if (dt.Rows[i]["Usertype"].ToString() == "Customer")
                    {
                        // redirects user to employee page if the usertype is customer
                        Response.Redirect("index.aspx");
                    }
                }
                else if (userName != uname.Text && pw != password.Text)
                {
                    // runs if user details are not correct
                    error.Visible = true;
                }

            }
        }

        // takes users to registration page
        protected void regButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/register.aspx");
        }


    }
}