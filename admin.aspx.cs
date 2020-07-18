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
    public partial class admin : System.Web.UI.Page
    {
        // connection to database
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SuperWebDB"].ConnectionString);

        SqlCommand cmd;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "You have successfully logged in as an administrator " + Session["Username"];

            // labels for confirmation of item change
            addConfirm.Visible = false;
            delConfirm.Visible = false;
            updConfirm.Visible = false;
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        // adds item to item table
        protected void AddItem_Click(object sender, EventArgs e)
        {
            SuperDBEntities db = new SuperDBEntities();
            var item = new Item();
            item.ItemName = FoodItemText.Text;
            item.FoodDept = DeptText.Text;
            db.Items.Add(item);
            db.SaveChanges();
            addConfirm.Visible = true;
        }

        protected void DeleteItem_Click(object sender, EventArgs e)
        {
            

            // deletes selected item on dropdown list from item table
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "DELETE FROM Items WHERE ItemName = '" + DDLItems.SelectedItem.ToString() + "'";
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("admin.aspx");
            delConfirm.Visible = true;
        }
        // updates selected item in dropdown list in item table
        protected void UpdateItem_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE Items SET ItemName='" + FoodItemText.Text + "', FoodDept='" + DeptText.Text + "' WHERE ItemName = '" + DDLItems.SelectedItem.ToString() + "'";
            cmd.ExecuteNonQuery();

            con.Close();

           
        }
        // when item value changes in dropdown list
        protected void DDLItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Items WHERE ItemName = '" + DDLItems.SelectedItem.ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            foreach (DataRow DR in dt.Rows)
            {
                // outputs item name and department
                FoodItemText.Text = DR["ItemName"].ToString();
                DeptText.Text = DR["FoodDept"].ToString();
            }

        }
    }
}