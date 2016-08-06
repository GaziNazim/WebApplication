<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="Pages_Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signin</title>
    <link href="../Style/Main.css" rel="stylesheet" />
       <link href="css/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="js/ninja-slider.js" type="text/javascript"></script>
    

</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
          <UC1:banner runat="server" />
            <div></div>
        <div class="signin">
            <div id="in">
                <div style="width:750px; height:500px;float:left">
                  <div id="ninja-slider" style="width:600px; height:400px;margin-top:50px">
                                         <ul>
                                              <li><div data-image="Image/1.JPG"></div></li>
                                              <li><div data-image="Image/t.jpg"></div></li>
                                              <li><div data-image="Image/s.jpg" ></div></li>
                                             <li><div data-image="Image/so.jpg" ></div></li>
                                             <li><div data-image="Image/1.jpg" ></div></li>
                                         </ul>
                                    </div>

                </div>
                <div style="margin: 200px 3px; width: 326px; height: 156px; float:left">
                     <asp:Label ID="Label1" runat="server" Text="Username: " style=" font-size:25px;margin-left:0px"></asp:Label>
                <asp:TextBox ID="username" runat="server" Width="149px"></asp:TextBox>
                     <br />
                    <asp:Label ID="Label2" runat="server" Text="Password: " style=" font-size:25px ;margin-left:0px"></asp:Label>
                    <asp:TextBox ID="password" TextMode="Password" runat="server" style="margin-left: 5px"></asp:TextBox>

                     <br />

                     <br />

                    <asp:CheckBox ID="rem" runat="server" Text="Remember me" />
                    <asp:LinkButton ID="signin" runat="server" Style="margin-left:30px" OnClick="signin_Click">Sign in</asp:LinkButton>
                    <asp:LinkButton ID="sign_up" runat="server" style="margin-left:30px" OnClick="sign_up_Click">Sign up</asp:LinkButton>
                </div>
               

            </div>
            
        </div>
    
    </div>
    </form>
      <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
   
</body>
</html>
