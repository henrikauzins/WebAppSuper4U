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
    public partial class confirmOrder : System.Web.UI.Page
    {
        // sql commands that are used to connect the database to the website 
        // searches through the database for correct information required
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString);

        SqlCommand cmd;

        int count;
        SqlCommand cmd1;

        // loads up the basketId from the basket table and hides the text box and dropdown list on screen
        protected void Page_Load(object sender, EventArgs e)
        {
            Purchased.Visible = false;
            basketIdentity.Visible = false;

           
            // gets last inserted BasketId from the basket table
            string connectionString = ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            // selects recently inserted BasketId from Basket table
            cmd1 = new SqlCommand("SELECT MAX(BasketId) FROM Basket", conn);

            conn.Open();
            count = Convert.ToInt32(cmd1.ExecuteScalar());
            conn.Close();
            // shows retrived id in hidden textbox
            basketIdentity.Text = count.ToString();
        }

        // purchase order button
        protected void confirmPurchase_Click(object sender, EventArgs e)
        {
            // updates status of basket to that it was purchased by customer.
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE Basket SET Purchased = '" + Purchased.SelectedItem.ToString() + "' WHERE BasketId = '" + basketIdentity.Text + "'";
            cmd.ExecuteNonQuery();
            
            con.Close();
            Purchased.Items.Clear();
            //once order has been placed by customer, the contents of the item basket table are deleted
            string str = "DELETE FROM ItemBasket";

            try
            {
                con.Open();
                cmd = new SqlCommand(str, con);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {

                con.Close();
            }
            // after the itembasket contents have been deleted, the page is refreshed

            Response.Redirect("CompletedOrder.aspx");
        }

     
    }
}