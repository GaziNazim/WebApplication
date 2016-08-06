using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sirajax_serverpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Session.Abandon();
        HttpCookie cooki = new HttpCookie("chat");
        cooki.Expires = DateTime.Now.AddMilliseconds(-100);
        Response.Cookies.Add(cooki);
        Response.Redirect("Signin.aspx");*/
        string[] a =
    {"aaa","Anna",
                "Brittany",
                "Cinderella",
                "Diana",
                "Eva",
                "Fiona",
                "Gunda",
                "Hege",
                "Inga",
                "Johanna",
                "Kitty",
                "Linda",
                "Nina",
                "Ophelia",
                "Petunia",
                "Amanda",
                "Raquel",
                "Cindy",
                "Doris",
                "Eve",
                "Evita",
                "Sunniva",
                "Tove",
                "Unni",
                "Violet",
                "Liza",
                "Elizabeth",
                "Ellen",
                "Wenche",
                "Vicky"
        
    };

        string q = Page.Request.QueryString["p"];
        string hint = "";
        if (q.Length > 0)
        {
            for (int i = 0; i < a.Length; i++)
            {
                if (string.Compare(q.ToLower(), a[i].Substring(0, q.Length).ToLower()) == 0)
                {
                    hint = hint + "," + a[i];
                }
            }
        }
        Response.Write(hint);
    }
}