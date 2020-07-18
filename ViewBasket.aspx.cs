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
using System.Drawing;

namespace WebAppSuper4U
{
    public partial class ViewBasket : System.Web.UI.Page
    {
        // sql commands that are used to connect the database to the website 
        // searches through the database for correct information required
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString);

        SqlCommand cmd;
        SqlCommand cmd1;
        string str;
        int count;

        protected void Page_Load(object sender, EventArgs e)
        {
            // labels + textbox are set to not show on the page 
            itemDeletion.Visible = false;
            emptyBasket.Visible = false;
            NoPurchase.Visible = false;
            basketID.Visible = false;
            emptyConfirm.Visible = false;

          


            string connectionString = ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            cmd1 = new SqlCommand("SELECT MAX(BasketId) FROM Basket", conn);

            conn.Open();
            count = Convert.ToInt32(cmd1.ExecuteScalar());
            conn.Close();

            basketID.Text = count.ToString();


        }




        protected void purchaseBasket_Click(object sender, EventArgs e)
        {
            // if basket is empty, cannot proceed with their order
            if (BasketGridView.Rows.Count == 0)
            {
                emptyBasket.Visible = true;
         
            }
            else
            // if basket is not empty
            {
               
                // redirects user to confirmOrder page
                Response.Redirect("confirmOrder.aspx");
            }
        }

       // if the basket grid view row is not selected, it will cause an error
        protected void deleteBasket_Click(object sender, EventArgs e)
        {
            if (BasketGridView.Rows.Count == 0)
            {
                // when basket is completly deleted, the order is set as not purchased
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE Basket SET Purchased = '" + NoPurchase.SelectedItem.ToString() + "' WHERE BasketId = '" + basketID.Text + "'";
                cmd.ExecuteNonQuery();

                con.Close();

                Response.Redirect("ViewBasket.aspx");
                emptyConfirm.Visible = true;
            }
            else

            {
                SuperDBEntities db = new SuperDBEntities();
                var itemBasket = db.ItemBaskets.Find(BasketGridView.SelectedValue);
                db.Entry(itemBasket).State = System.Data.Entity.EntityState.Deleted;

                db.SaveChanges();

                Response.Redirect("ViewBasket.aspx");
                //var basket = db.Baskets.Find(basketID.Text);
                //basket.Purchased = NoPurchase.SelectedItem.ToString();

                //db.SaveChanges();
                //Response.Redirect("ViewBasket.aspx");
                //itemDeletion.Visible = true;




            }

        }
        // row must be selected before clicking the delete button
        protected void BasketGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            BasketGridView.Rows[BasketGridView.SelectedIndex].BackColor = Color.ForestGreen;
        }
    }
}