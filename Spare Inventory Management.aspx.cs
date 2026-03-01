using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Spare_Inventory_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void buttonclickdb(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        con.Open();
        SqlCommand command1 = new SqlCommand("select username,password from users where username= @username and password=@password", con);
        command1.Parameters.AddWithValue("@username", username.Text);
        command1.Parameters.AddWithValue("@password", password.Text);
        SqlDataAdapter adap = new SqlDataAdapter(command1);
        DataTable data = new DataTable();
        adap.Fill(data);
        if (data.Rows.Count > 0)
        {
            Session["LoggedInUser"] = username.Text;
            Response.Redirect("~/Menu.aspx");
        }
        else
        {
            Label1.Text = "Invalid";
        }
    }
   
}