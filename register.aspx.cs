using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSuper4U
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            regConfirm.Visible = false; // confirms user registration
        }

        protected void regUser_Click(object sender, EventArgs e)
        {
            
            SuperDBEntities db = new SuperDBEntities();
            var user = new User();
            user.Username = uname1.Text;
            user.Password = password1.Text;
            user.Usertype = ddlUserType.Text;
            db.Users.Add(user);
            db.SaveChanges();
            regConfirm.Visible = true;

        }
        // returns user to login page
        protected void returnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}