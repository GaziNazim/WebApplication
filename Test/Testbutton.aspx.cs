using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Collections;
public partial class Test_Testbutton : System.Web.UI.Page
{

    ICollection CreateDataSource()
    {

        // Create sample data for the DataList control.
        DataTable dt = new DataTable();
        DataRow dr;

        // Define the columns of the table.
        dt.Columns.Add(new DataColumn("name", typeof(String)));
        dt.Columns.Add(new DataColumn("username", typeof(String)));
        dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

        // Populate the table with sample values.
        /*for (int i = 0; i < 9; i++) 
        {
           dr = dt.NewRow();

           dr[0] = i;
           dr[1] = "Description for item " + i.ToString();
           dr[2] = 1.23 * (i + 1);

           dt.Rows.Add(dr);
        }*/
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT fname,lname,username FROM Users", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (drd.Read())
            {
                dr = dt.NewRow();
                int i = 90;
                dr[0] = drd[0].ToString() + " " + drd[1].ToString();
                dr[1] = "Description for item " + i.ToString();
                dr[2] = 1.23 * (i + 1);

                dt.Rows.Add(dr);
            }

        }
        DataView dv = new DataView(dt);
        return dv;
    }
    void Page_Load(Object sender, EventArgs e)
    {

        // Manually register the event-handling method for the 
        // ItemCommand event.
        ItemsList.ItemDataBound += new DataListItemEventHandler(this.Item_Bound);

        // Load sample data only once, when the page is first loaded.
        if (!IsPostBack)
        {
            ItemsList.DataSource = CreateDataSource();
            ItemsList.DataBind();
        }

    }

    void Item_Bound(Object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Double Price = Convert.ToDouble(
            ((DataRowView)e.Item.DataItem).Row.ItemArray[2].ToString());

        }

    }



    protected void btnAddFriend_Click(object sender, EventArgs e)
    {
        Button btnAddFriend = sender as Button;
        string userId = btnAddFriend.CommandArgument;
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();
            String S = Session["user"].ToString();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO Friend  values('" + Session["user"].ToString() + "','" + userId + "','pending')", cn);
            SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
            cn.Close();
        }
    }

}