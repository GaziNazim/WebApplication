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

public partial class Pages_People : System.Web.UI.Page
{
   
      protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cooki = Request.Cookies["chat"];
        if (cooki != null && Session["user"] == null)
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
          
           String  S = Session["user"].ToString();
             SqlCommand cmd = new SqlCommand("SELECT fname,lname FROM Users WHERE username = '" + S + "' ", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (drd.Read())
            {
               
                Label1.Text = drd[0]+"  "+ drd[1];
            }
                cn.Close();
        }

        // Manually register the event-handling method for the 
        // ItemCommand event.
        ItemsList.ItemDataBound += new DataListItemEventHandler(this.Item_Bound);

        // Load sample data only once, when the page is first loaded.
        if (!IsPostBack)
        {
            ItemsList.DataSource = CreateDataSource("show");
            ItemsList.DataBind();
        }
        FriendList.ItemDataBound += new DataListItemEventHandler(this.Item_Bound);

        // Load sample data only once, when the page is first loaded.
        if (!IsPostBack)
        {
            FriendList.DataSource = CreateDataSource();
            FriendList.DataBind();
        }

    }
      ICollection CreateDataSource()
      {

          // Create sample data for the DataList control.
          DataTable dt = new DataTable();
          DataRow dr;

          // Define the columns of the table.
          dt.Columns.Add(new DataColumn("name", typeof(String)));
          dt.Columns.Add(new DataColumn("username", typeof(String)));
          dt.Columns.Add(new DataColumn("flag", typeof(String)));

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
              SqlCommand cmd = new SqlCommand("SELECT friend1,friend2,flag FROM Friend", cn);
              SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
              while (drd.Read())
              {


                  if ((drd[0].ToString() == Session["user"].ToString()) && drd[2].ToString() != "pending")
                  {


                      dr = dt.NewRow();
                      dr[0] = drd[1].ToString();
                      dr[1] = drd[1].ToString();
                      using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
                      {
                          cnn.Open();
                          SqlCommand cm = new SqlCommand("SELECT flag FROM Users WHERE username='" + drd[1] + "'", cnn);
                          SqlDataReader drr = cm.ExecuteReader(CommandBehavior.CloseConnection);
                          while (drr.Read())
                          {
                              dr[2] = drr[0].ToString();
                          }
                          cnn.Close();
                      }
                      dt.Rows.Add(dr);
                  }

              }

          }
          DataView dv = new DataView(dt);
          return dv;
      }
      protected void sign_out_Click(object sender, EventArgs e)
      {
          string onl = "Offline";
          using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
          {
              cnn.Open();
              SqlCommand cm = new SqlCommand("UPDATE Users SET flag='" + onl + "' WHERE username='" + Session["user"].ToString() + "'", cnn);
              SqlDataReader dr = cm.ExecuteReader(CommandBehavior.CloseConnection);
              cnn.Close();
          }

          Session.Abandon();
          HttpCookie cooki = new HttpCookie("chat");
          cooki.Expires = DateTime.Now.AddMilliseconds(-100);
          Response.Cookies.Add(cooki);
          Response.Redirect("Signin.aspx");

      }

    ICollection CreateDataSource(string s)
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
            SqlCommand cmd = new SqlCommand("SELECT fname,lname,username FROM Users", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (drd.Read())
            {
                bool i = true;

                using (SqlConnection fn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
                {
                    fn.Open();
                    SqlCommand fncmd = new SqlCommand("SELECT friend1,friend2 FROM Friend", fn);
                    SqlDataReader fndrd = fncmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (fndrd.Read())
                    {
                       // Response.Write("<p style=\"color:red\">" + fndrd[0] + "</p>");
                        if ((Session["user"].ToString()==drd[2].ToString())||((Session["user"].ToString()==fndrd[0].ToString()) &&(fndrd[1].ToString() == drd[2].ToString())))
                        {
                            i = false;
                            break;

                        }
                        

                    }
                    fn.Close();

                }
                if(i)
                {
                    dr = dt.NewRow();
                    dr[0] = drd[0].ToString() + " " + drd[1].ToString();
                    dr[1] = drd[2].ToString();
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
        Response.Redirect("People.aspx");
    }




}