using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSuper4U
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                // message that will output to the user when they are bought to the Index page
                // shows that user is authenticated to use the online shop service
                LoggedIn.Text = "You have successfully logged in as a verified Customer " + Session["Username"];
            }


            else
            {
                Response.Redirect("login.aspx");

            }

            // logs user out of the application
            
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}