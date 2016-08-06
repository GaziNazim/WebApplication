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
       /* Session.Abandon();
        HttpCookie cooki = new HttpCookie("chat");
        cooki.Expires = DateTime.Now.AddMilliseconds(-100);
        Response.Cookies.Add(cooki);
       */
        string text = Page.Request.QueryString["p"];
        if(text.Length>0)
        {
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
            {
                cn.Open();
               
                try
                {
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO Chat values('" + Session["user"].ToString() + "','" + text + "','" + text + "','" + DateTime.Now.ToString() + "')", cn);
                    SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                    Response.Write("yes");
                 
                }
                catch
                {
                    Response.Write("no");
                }
                finally
                {

                }
                cn.Close();
            }



        }
    }
}