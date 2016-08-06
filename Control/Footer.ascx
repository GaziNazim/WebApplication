<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Control_Footer" %>
<style>
    .footer
    {
        width:1200px;
        padding:0px;
        background-color:#A696CF;
        color:white;
        opacity:0.8;
      text-align:center;
    }
   
   .footer a
   {
       color:white;
   }
    .auto-style1 {
        width: 50%;
        margin:0px auto;
    }
</style>
<div class="footer">
   
    <br />

    <table class="auto-style1">
        <tr>
            <td><a href="Home.aspx">Home</a></td>
            <td><a href="About.aspx">About</a></td>
            <td><a href="Friends.aspx">Friends</a></td>
            <td><a href="#">Chat</a></td>
            <td><a href="Contact.aspx">Help</a></td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Sign out</asp:LinkButton>

            </td>
        </tr>
    </table>

    <asp:Label ID="Label1" runat="server" Text="GAZI &copy 2014"></asp:Label>
    <br />
    
</div>