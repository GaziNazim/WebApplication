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
public partial class Pages_Available : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string q = Page.Request.QueryString["p"];
        string hint = "Username Available";
        
        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
        {
            cn.Open();

            SqlCommand cmd = new SqlCommand("SELECT username FROM Users", cn);
            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (drd.Read())
            {
               
                if(q==drd[0].ToString())
                {
                    hint = "Username already exist!!";
                    break;
                }
                
            }

        }
        Response.Write(hint);
    }
}