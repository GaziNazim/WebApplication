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

public partial class Pages_Sign_up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void done_Click(object sender, EventArgs e)
    {

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();
            string fl="1";
            string t = age.Text.ToString();
            try
            {
                SqlCommand cmd1 = new SqlCommand("INSERT INTO Users values('" + username.Text + "','" + password.Text + "','" + fname.Text + "','" + lname.Text + "','" + email.Text + "','" + gender.Text + "','" + t + "','"+fl+"')", cn);
                SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                Session["to"] = "";
                Session["user"] = username.Text;
                Response.Redirect("Home.aspx");
            }
            catch
            {
               euser.Text="Duplicate Value";
            }
            finally
            {
                
            }
            cn.Close();
        }
       


      




      
      

    }



    protected void User_TextChanged(object sender, EventArgs e)
    {
        //avail.Visible = true;
        avail.Text = " Available!";
        string connectionString = ConfigurationManager.ConnectionStrings["bdcon"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        SqlCommand comm = new SqlCommand("Select * FROM Users WHERE username = '" + username.Text + "'", conn);
        SqlDataReader reader = comm.ExecuteReader();

        try
        {
            reader.Read();
            string s = reader["username"].ToString();
            avail.Visible = true;
            avail.Text = username.Text + " Already exists!";
        }
        catch
        {
            avail.Visible = true;
            avail.Text = username.Text + " Available!";
        }

        reader.Close();
        conn.Close();

    }
}