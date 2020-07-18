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
    public partial class createOrder : System.Web.UI.Page
    {
        // sql commands that are used to connect the database to the website 
        // searches through the database for correct information
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            addItemConfirm.Visible = false; // confirmation label when items are sucessfully added basket
        }

        protected void addItem_Click(object sender, EventArgs e) // add items to basket
        {

            SuperDBEntities db = new SuperDBEntities();


            var itemBasket = new ItemBasket();
            var bask = new Basket();
            var customer = new Customer();
            // //what items the customer is going to add to thier basket of items
            itemBasket.ItemId = Convert.ToInt32(ItemIDText.Text);
            itemBasket.BasketId = bask.BasketId;
            itemBasket.Quantity = Convert.ToInt32(ItemQuantity.SelectedValue);

            // adds to Basket

            bask.BasketId = bask.BasketId;
            bask.CustomerId = customer.CustomerId;
            bask.DateOrdered = Convert.ToDateTime(dateText.Text);


            // customer information 
            customer.CustomerName = customerName.Text;

            db.ItemBaskets.Add(itemBasket);
            db.Baskets.Add(bask);
            db.Customers.Add(customer);
          
           
           
            db.SaveChanges();
            addItemConfirm.Visible = true;

        }

        // when department name changes, items in the department will display in the dropdown list
        protected void ddlTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Items WHERE FoodDept = '" + ddlTest.SelectedItem.ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            foreach (DataRow DR in dt.Rows)
            {
                DropDownList2.Text = DR["ItemName"].ToString();
            }
            con.Close();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Items WHERE ItemName = '" + DropDownList2.SelectedItem.ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            foreach (DataRow DR in dt.Rows)
            {
                // when item is selected in the dropdown list, the textboxes update and put the name and food dept in
                
                ItemIDText.Text = DR["ItemId"].ToString();

            }
            con.Close();
        }
    }
}
