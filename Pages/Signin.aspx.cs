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
public partial class Pages_Signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signin_Click(object sender, EventArgs e)
    {
        
            using(SqlConnection cn= new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("SELECT username,password FROM Users", cn);
                SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while(drd.Read())
                {
                   
                    if(username.Text==drd[0].ToString()&&password.Text==drd[1].ToString())
                    {
                        string onl = "Online";
                        if(rem.Checked==true)
                        {

                            HttpCookie cooki;
                            cooki = new HttpCookie("chat");
                            cooki["username"] = username.Text;
                            cooki["password"] = password.Text;
                            cooki["to"] = "";
                            cooki.Expires = DateTime.Now.AddDays(7);
                            Response.Cookies.Add(cooki);
                        }
                        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
                        {
                            cnn.Open();
                            SqlCommand cm = new SqlCommand("UPDATE Users SET flag='" + onl + "' WHERE username='" + username.Text + "'", cnn);
                            SqlDataReader dr = cm.ExecuteReader(CommandBehavior.CloseConnection);
                            cnn.Close();
                        }
                            
                            Session["to"] = "";
                        Session["user"] = username.Text;
                        Response.Redirect("home.aspx");
                       
                    }
                }

        }
    }


    protected void sign_up_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sign_up.aspx");
    }
}