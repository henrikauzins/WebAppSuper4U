using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSuper4U
{
    public partial class CompletedOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // returns customer to the index page
        protected void returnToIndex_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}