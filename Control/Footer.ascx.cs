using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_Footer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        HttpCookie cooki = new HttpCookie("chat");
        cooki.Expires = DateTime.Now.AddMilliseconds(-100);
        Response.Cookies.Add(cooki);
        Response.Redirect("Signin.aspx");

    }
}