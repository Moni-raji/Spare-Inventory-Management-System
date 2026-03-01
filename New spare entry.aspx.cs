using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class New_spare_entry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateNomenclatureDropDown();
            string loggedInUser = Session["LoggedInUser"].ToString();
            enteredby.Text = loggedInUser; 
            enteredby.ReadOnly = true;
            BindGrid();
        }
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string insertQuery = "INSERT INTO spareentry (DateOfEntry, PartNumber, RackNumber, RowNumber, EnteredBy ,Quantity ,Nomenclature) " +
                                 "VALUES (@DateOfEntry, @PartNumber, @RackNumber, @RowNumber, @EnteredBy ,@Quantity ,@Nomenclature)";

            using (SqlCommand insertCommand = new SqlCommand(insertQuery, con))
            {
                insertCommand.Parameters.AddWithValue("@DateOfEntry", dateofentry.Text);
                if (partno.SelectedItem.Text.Equals("New"))
                {
                    insertCommand.Parameters.AddWithValue("@PartNumber", newsparepart.Text);
                }
                else
                {
                    insertCommand.Parameters.AddWithValue("@PartNumber", partno.Text);
                }
                
                insertCommand.Parameters.AddWithValue("@RackNumber", rackno.Text);
                insertCommand.Parameters.AddWithValue("@RowNumber", rowno.Text);
                insertCommand.Parameters.AddWithValue("@EnteredBy", enteredby.Text);
                insertCommand.Parameters.AddWithValue("@Quantity", quantity.Text);
                insertCommand.Parameters.AddWithValue("@Nomenclature", nomenclature.Text);

                int rowsInserted = insertCommand.ExecuteNonQuery();

                if (rowsInserted== 0)
                {
                    errormessage.Text = "Failed to add entry";
                }
            }
            string selectQuery = "SELECT COUNT(*) FROM mastertable WHERE PartNumber = @PartNumber";
            int count = 0;

            using (SqlCommand selectCommand = new SqlCommand(selectQuery, con))
            {
                if (partno.SelectedItem.Text.Equals("New"))
                {
                    selectCommand.Parameters.AddWithValue("@PartNumber", newsparepart.Text);
                    count = Convert.ToInt32(selectCommand.ExecuteScalar());
                }
                else
                {
                    selectCommand.Parameters.AddWithValue("@PartNumber", partno.Text);
                    count = Convert.ToInt32(selectCommand.ExecuteScalar());
                }
            }

            if (count > 0)
            {
                string updateQuery = "UPDATE mastertable SET Balance = Balance + @Quantity WHERE PartNumber = @PartNumber";

                using (SqlCommand updateCommand = new SqlCommand(updateQuery, con))
                {
                    updateCommand.Parameters.AddWithValue("@Quantity", quantity.Text);
                    updateCommand.Parameters.AddWithValue("@PartNumber", partno.Text);

                    int rowsUpdated = updateCommand.ExecuteNonQuery();
                    if (rowsUpdated == 0)
                    {
                        errormessage.Text += "<br />Failed to update quantity in MasterTable";
                    }
                }
            }
            else
            {
                string insertMasterQuery = "INSERT INTO mastertable (PartNumber, Nomenclature ,Balance, RackNumber, RowNumber) " +
                                           "VALUES (@PartNumber, @Nomenclature, @Quantity, @RackNumber, @RowNumber)";

                using (SqlCommand insertMasterCommand = new SqlCommand(insertMasterQuery, con))
                {
                    if (partno.SelectedItem.Text.Equals("New"))
                    {
                        insertMasterCommand.Parameters.AddWithValue("@PartNumber", newsparepart.Text);
                    }
                    else
                    {
                        insertMasterCommand.Parameters.AddWithValue("@PartNumber", partno.Text);
                    }

                    insertMasterCommand.Parameters.AddWithValue("@Quantity", quantity.Text);
                    insertMasterCommand.Parameters.AddWithValue("@Nomenclature", nomenclature.Text);
                    insertMasterCommand.Parameters.AddWithValue("@RackNumber", rackno.Text);
                    insertMasterCommand.Parameters.AddWithValue("@RowNumber", rowno.Text);

                    int rowsInsertedMaster = insertMasterCommand.ExecuteNonQuery();
                    if (rowsInsertedMaster == 0)
                    {
                        errormessage.Text += "<br />Failed to insert into MasterTable";
                    }
                }
            }
        }
        BindGrid();
    }
 

    protected void SparePartNumber12_TextChanged()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string selectQuery = "SELECT RackNumber, RowNumber, Nomenclature FROM mastertable WHERE PartNumber = @PartNumber";
                using (SqlCommand selectCommand = new SqlCommand(selectQuery, con))
                {
                    selectCommand.Parameters.AddWithValue("@PartNumber", partno.Text);

                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            rackno.Text = reader["RackNumber"].ToString();
                            rowno.Text = reader["RowNumber"].ToString();
                            nomenclature.Text = reader["Nomenclature"].ToString();
                        }
                        else
                        {
                            rackno.Text = "";
                            rowno.Text = "";
                            nomenclature.Text = "";
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            errormessage.Text = "An error occurred: " + ex.Message;
        }
    }



    protected void partno_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedValue = partno.SelectedValue.ToString();
        string selectedText = partno.SelectedItem.Text;
        if (selectedValue == "new")
        {
            newsparepart.Style["display"] = "inline";
            rackno.Text = "";
            rowno.Text = "";
            nomenclature.Text = "";
            quantity.Text = "";
        }
        else
        {
            newsparepart.Style["display"] = "none";
            SparePartNumber12_TextChanged();
        }
    }

    protected void PopulateNomenclatureDropDown()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        con.Open();
        SqlCommand query = new SqlCommand("select distinct PartNumber from spareentry ", con);
        SqlDataReader reader = query.ExecuteReader();
        partno.DataSource = reader;
        partno.DataTextField = "PartNumber";
        partno.DataBind();

        partno.Items.Insert(0, new ListItem("Select a Spare Part", "0"));
        partno.Items.Add(new ListItem("New", "new"));
    }

    protected void HomeButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Menu.aspx");
    }

    private void BindGrid()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM spareentry", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    

   
}
    