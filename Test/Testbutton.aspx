<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testbutton.aspx.cs" Inherits="Test_Testbutton" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <script runat="server">

     

   </script>




    <title></title>
    <script type="text/javascript" src="JavaScript.js"></script>

        <script type="text/javascript">

            function second() {
                Response.Write("fdfjh");
                document.getElementById("p").innerHTML = Date();
                var s;
                s = "nazim";
                Response.Write(s);
            }

</script>
</head>
<body>
    <form id="form1" runat="server"   >
    <div>
      <asp:DataList id="ItemsList" runat="server" Width="452px">
         <ItemTemplate>
              <table class="auto-style1">
            <tr>
                <td style="text-align:right"> <%# DataBinder.Eval(Container.DataItem, "name") %> </td>
                <td style="text-align:right"><asp:Button Text="Add as friend" ID="btnAddFriend" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "username") %>' 
                    OnClick="btnAddFriend_Click" runat="server" /></tdtd></td>
            </tr>
        </table>
         </ItemTemplate>
      </asp:DataList>
        <div id="v" style="height:100px;width:100px;background:white">
           xvxv
       
        </div>
         <input type="button" onclick="show()" value="hide" />
            <input type="button" onclick="hid()" value="show"/>
            <script type="text/javascript">
                function show() {
                    document.getElementById("v").innerHTML = "djfdf";
                    document.getElementById("v").style.display = "none";
                }
                function hid() {
                    document.getElementById("v").style.display = "block";
                }
            </script>
    </div>
    </form>
</body>
</html>
