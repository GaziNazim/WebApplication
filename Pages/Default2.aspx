<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Pages_Default2" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 109px">

        <%
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ToString()))
            {
                cn.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM Users", cn);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                Response.Write("<table>");
                while (rdr.Read())
                {
                    Response.Write("<tr>");
                    Response.Write("<td>" + rdr[0].ToString() + "</td><td>" + rdr[1].ToString() + "</td>" );
                    Response.Write("</tr>");
         %>
                    <asp:Label runat="server" Text="Label"></asp:Label>
        <%
                }
                Response.Write("</table>");
                cn.Close();
            }
            
             %>
    
    </div>
    </form>
</body>
</html>
