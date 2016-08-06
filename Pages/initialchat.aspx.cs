using System;
using System.Collections.Generic;
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
public partial class Pages_initialchat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string se = Session["user"].ToString();
        string to = Page.Request.QueryString["p"];
        HttpCookie cooki;
        cooki = new HttpCookie("chat");
        cooki["username"] = se;
        cooki["to"] = to;
        cooki.Expires = DateTime.Now.AddDays(7);
        Response.Cookies.Add(cooki);
        Session.Remove("to");
        Session["to"] = to;
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();

            String S = Session["user"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Chat ORDER BY id ", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Response.Write("<table>");
            while (drd.Read())
            {
                if (drd[0].ToString() == Session["user"].ToString() && drd[1].ToString() == Session["to"].ToString())
                {

                    Response.Write("<tr><td style='' class='user'>");
                    Response.Write(Session["user"].ToString() + ":  " + drd[2]);
                    Response.Write("</td></tr>");
                }
                if (drd[0].ToString() == Session["to"].ToString() && drd[1].ToString() == Session["user"].ToString())
                {

                    Response.Write("<tr><td class='to'>");
                    Response.Write(Session["to"].ToString() + ":  " + drd[2]);
                    Response.Write("</td></tr>");
                }
              
                
            }
            Response.Write("</table>");
            cn.Close();
        }

        
        
    }
}