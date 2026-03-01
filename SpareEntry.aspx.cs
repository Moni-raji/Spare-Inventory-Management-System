using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class SpareEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateNomenclatureDropDown();
        }
    }
    protected void PopulateNomenclatureDropDown()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        con.Open();
        SqlCommand query = new SqlCommand("select distinct SparePartNumber from spareentry ", con);
        SqlDataReader reader = query.ExecuteReader();
        SparePartNumber1.DataSource = reader;
        SparePartNumber1.DataTextField = "PartNumber";
        SparePartNumber1.DataBind();

        SparePartNumber1.Items.Insert(0, new ListItem("Select a Spare Part", "0"));
        SparePartNumber1.Items.Add(new ListItem("New", "new"));
    }
    protected void SparePartNumber1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedValue = SparePartNumber1.SelectedValue.ToString();
        string selectedText = SparePartNumber1.SelectedItem.Text;
        if (selectedValue == "new")
        {
            NewSparePartTextBox.Style["display"] = "inline";
        }
        else
        {
            SparePartNumber12_TextChanged();
        }

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
                    selectCommand.Parameters.AddWithValue("@PartNumber", SparePartNumber1.Text);

                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            RackNo1.Text = reader["RackNumber"].ToString();
                            RowNumber1.Text = reader["RowNumber"].ToString();
                            Nomenclature1.Text = reader["Nomenclature"].ToString();
                        }
                        else
                        {
                            RackNo1.Text = "";
                            RowNumber1.Text = "";
                            Nomenclature1.Text = "";
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            errorMessage.Text = "An error occurred: " + ex.Message;
        }
    }
    protected void EntryButton(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string insertQuery = "INSERT INTO spareentry (DateOfEntry, SparePartNumber, EntryQuantity, Nomenclature, RackNumber, RowNumber, EnteredBy) " +
                                 "VALUES (@DateOfEntry, @SparePartNumber, @EntryQuantity, @Nomenclature, @RackNumber, @RowNumber, @EnteredBy)";

            using (SqlCommand insertCommand = new SqlCommand(insertQuery, con))
            {
                insertCommand.Parameters.AddWithValue("@DateOfEntry", EntryDate1.Text);
                if (SparePartNumber1.SelectedItem.Text.Equals("New"))
                {
                    insertCommand.Parameters.AddWithValue("@SparePartNumber", NewSparePartTextBox.Text);
                }
                else
                {
                    insertCommand.Parameters.AddWithValue("@SparePartNumber", SparePartNumber1.Text);
                }
                insertCommand.Parameters.AddWithValue("@EntryQuantity", Quantity1.Text);
                insertCommand.Parameters.AddWithValue("@Nomenclature", Nomenclature1.Text);
                insertCommand.Parameters.AddWithValue("@RackNumber", RackNo1.Text);
                insertCommand.Parameters.AddWithValue("@RowNumber", RowNumber1.Text);
                insertCommand.Parameters.AddWithValue("@EnteredBy", EnteredBy1.Text);

                int rowsInserted = insertCommand.ExecuteNonQuery();

                if (rowsInserted > 0)
                {
                    errorMessage.Text = "Entry added successfully";
                }
                else
                {
                    errorMessage.Text = "Failed to add entry";
                }
            }
            string selectQuery = "SELECT COUNT(*) FROM MasterTable WHERE SparePartNumber = @SparePartNumber";
            int count = 0;

            using (SqlCommand selectCommand = new SqlCommand(selectQuery, con))
            {
                if (SparePartNumber1.SelectedItem.Text.Equals("New"))
                {
                    selectCommand.Parameters.AddWithValue("@SparePartNumber", NewSparePartTextBox.Text);
                    count = Convert.ToInt32(selectCommand.ExecuteScalar());
                }
                else
                {
                    selectCommand.Parameters.AddWithValue("@SparePartNumber", SparePartNumber1.Text);
                    count = Convert.ToInt32(selectCommand.ExecuteScalar());
                }
            }

            if (count > 0)
            {
                string updateQuery = "UPDATE MasterTable SET Quantity = Quantity + @EntryQuantity WHERE SparePartNumber = @SparePartNumber";

                using (SqlCommand updateCommand = new SqlCommand(updateQuery, con))
                {
                    updateCommand.Parameters.AddWithValue("@EntryQuantity", Quantity1.Text);
                    updateCommand.Parameters.AddWithValue("@SparePartNumber", SparePartNumber1.Text);

                    int rowsUpdated = updateCommand.ExecuteNonQuery();
                    if (rowsUpdated > 0)
                    {
                        errorMessage.Text += "<br />Quantity updated in MasterTable";
                    }
                    else
                    {
                        errorMessage.Text += "<br />Failed to update quantity in MasterTable";
                    }
                }
            }
            else
            {
                string insertMasterQuery = "INSERT INTO MasterTable (SparePartNumber, Quantity, Nomenclature, RackNumber, RowNumber) " +
                                           "VALUES (@SparePartNumber, @Quantity, @Nomenclature, @RackNumber, @RowNumber)";

                using (SqlCommand insertMasterCommand = new SqlCommand(insertMasterQuery, con))
                {
                    if (SparePartNumber1.SelectedItem.Text.Equals("New"))
                    {
                        insertMasterCommand.Parameters.AddWithValue("@SparePartNumber", NewSparePartTextBox.Text);
                    }
                    else
                    {
                        insertMasterCommand.Parameters.AddWithValue("@SparePartNumber", SparePartNumber1.Text);
                    }

                    insertMasterCommand.Parameters.AddWithValue("@Quantity", Quantity1.Text);
                    insertMasterCommand.Parameters.AddWithValue("@Nomenclature", Nomenclature1.Text);
                    insertMasterCommand.Parameters.AddWithValue("@RackNumber", RackNo1.Text);
                    insertMasterCommand.Parameters.AddWithValue("@RowNumber", RowNumber1.Text);

                    int rowsInsertedMaster = insertMasterCommand.ExecuteNonQuery();
                    if (rowsInsertedMaster > 0)
                    {
                        errorMessage.Text += "<br />Inserted into MasterTable";
                    }
                    else
                    {
                        errorMessage.Text += "<br />Failed to insert into MasterTable";
                    }
                }
            }
        }
    }
}