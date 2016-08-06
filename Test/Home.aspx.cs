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

public partial class Home : System.Web.UI.Page
{
    void bal()
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cooki = Request.Cookies["chat"];
        if (cooki!= null&&Session["user"]==null)
        {
            Session["user"] = cooki["username"];
        }
        if (Session["user"] == null)
        {
            Response.Redirect("Signin.aspx");

        }
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();

            String S = Session["user"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE username = '" + S + "' ", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (drd.Read())
            {

                Label1.Text = drd["fname"] + "  " + drd["lname"];
                name.Text = Label1.Text;
                bdate.Text = drd["age"].ToString();
                email.Text = drd["email"].ToString();
                gender.Text = drd["gender"].ToString();
            }
            cn.Close();
        }
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();

            String S = Session["user"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE username = '" + S + "' ", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (drd.Read())
            {

                Label1.Text = drd["fname"] + "  " + drd["lname"];
            }

            cn.Close();
        }
        // Manually register the event-handling method for the 
        // ItemCommand event.
        FriendList.ItemDataBound += new DataListItemEventHandler(this.Item_Bound);

        // Load sample data only once, when the page is first loaded.
        if (!IsPostBack)
        {
            FriendList.DataSource = CreateDataSource();
            FriendList.DataBind();
        }

    }
    protected void sign_out_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        HttpCookie cooki = new HttpCookie("chat");
        cooki.Expires = DateTime.Now.AddMilliseconds(-100);
        Response.Cookies.Add(cooki);
        Response.Redirect("Signin.aspx");

    }

    ICollection CreateDataSource()
    {

        // Create sample data for the DataList control.
        DataTable dt = new DataTable();
        DataRow dr;

        // Define the columns of the table.
        dt.Columns.Add(new DataColumn("name", typeof(String)));
        dt.Columns.Add(new DataColumn("username", typeof(String)));

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
            SqlCommand cmd = new SqlCommand("SELECT friend1,friend2 FROM Friend", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (drd.Read())
            {
                

                if (drd[0].ToString()==Session["user"].ToString())
                {
                 
                    dr = dt.NewRow();
                    dr[0] = drd[1].ToString();
                    dr[1] = drd[1].ToString();
                    dt.Rows.Add(dr);
                }

            }

        }
        DataView dv = new DataView(dt);
        return dv;
    }
    void Item_Bound(Object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {


        }

    }


}