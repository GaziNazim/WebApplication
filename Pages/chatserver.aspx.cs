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
public partial class Test_chatserver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cooki = Request.Cookies["chat"];
        if (cooki != null && (Session["user"] != null && Session["to"] == null))
        {
            
            Session["to"] = cooki["to"];
        }
       /* Session.Abandon();
        HttpCookie cooki = new HttpCookie("chat");
        cooki.Expires = DateTime.Now.AddMilliseconds(-100);
        Response.Cookies.Add(cooki);
       */
        string text = Page.Request.QueryString["p"];
        if(text.Length>0)
        {
            using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
            {
                cnn.Open();
               
                try
                {
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO Chat values('" + Session["user"].ToString() + "','" + Session["to"].ToString() + "','" + text + "','" + DateTime.Now.ToString() + "')", cnn);
                    SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

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
                catch
                {
                    Response.Write("no");
                }
                finally
                {

                }
                cnn.Close();
            }



        }
    }
}