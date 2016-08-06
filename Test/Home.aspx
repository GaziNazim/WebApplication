<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="../Style/Main.css" rel="stylesheet" />
    <link href="../Style/fonts.css" rel="stylesheet" />
    <style type="text/css">
         .auto-style2 {
            width: 80%;
            text-align:right;
            margin:100px 0px 0px 0px;
        }
    </style>
    <script type="text/javascript">
        function send(str)
        {    
            var text = document.getElementById("chatarea").value;
            document.getElementById("chatname").innerHTML = text;
            var xmlhttp;
            if(text.length==0)
            {
                return;
            }
            if(window.XMLHttpRequest)
            {
                xmlhttp = new XMLHttpRequest();
            }
            else
            {
                xmlhttp = new ActiveXObject("microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if(xmlhttp.readyState==4&&xmlhttp.status==200)
                {
                    document.getElementById("content").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "chatserver.aspx?p=" + text, true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="main">
            <UC1:banner runat="server" />
         
            <div style="background:white; height:2px;"></div>
              
            <!-- Start mid portion -->
            <div class="mid">
             
                <!-- Left column start -->
            <div class="left_col">
                <!-- Start profile -->
                <div class="profile">
                   
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Picture/pro.jpg"  class="pro_pic" Height="315px" Width="296px" />
                   
                    <div class="pro_name">
                         <asp:Label ID="Label1" runat="server" Text="Nazim Gazi" style="font-weight: 700;font-size:30px; font-style: italic;"></asp:Label>
                    </div>

                   
                </div>
                <!-- End profile -->

                <!-- Start navigationbar -->
                <div class="nav" >
                    <ul>
                        <li>
                            <a href="Home.aspx" >
                             <div class="navli" style="background-color:white;color:black">
                                  Home
                             </div>
                                   
                               
                            </a>
                        </li>
                        <li>
                            <a href="About.aspx">
                                <div class="navli">
                                    About
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="Friends.aspx">
                                <div class="navli">
                                    Friends
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="Contact.aspx">
                                <div class="navli">
                                    Contact 
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="People.aspx">
                                <div class="navli">
                                    People 
                                </div>
                            </a>
                        </li>
                        <li>
                            <asp:LinkButton ID="sign_out" runat="server" OnClick="sign_out_Click"> 
                                <div class="navli">
                                    Sign out
                                </div>

                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <!-- End navigation bar -->

               

            </div>
            <!-- Left column End -->

             <!-- Mid column start -->
            <div class="mid_col">
               <asp:Label ID="Label3" runat="server" Text="Home" style="font-size:40px;margin:10px 235px "></asp:Label>
           <div style="width:inherit;height:1px;background:white;margin-top:18px"></div>
                  <table class="auto-style2">
                     <tr>
                         <td class="auto-style3"><span > Name :</span></td>
                         <td class="auto-style6">
                             <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3"><span >Birth date :</span></td>
                         <td class="auto-style6">
                             <asp:Label ID="bdate" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3"><span >Gender :</span></td>
                         <td class="auto-style6">
                             <asp:Label ID="gender" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3"><span > Email :</span></td>
                         <td class="auto-style6">
                             <asp:Label ID="email" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                 
                </table>
                 
           
                 </div>
            <!-- Mid column End -->

             <!-- Right column start -->
            <div class="right_col">
               <div class="friend_l">
                   <asp:Label ID="Label2" runat="server" Text="Friends" style="font-weight: 700;font-size:30px;"></asp:Label>
                    </div>
                             <asp:DataList id="FriendList" runat="server" style="width: 100%">
         <ItemTemplate >
              <table style="width:100%">

                  <tr style="text-align:center;color:wheat">
                      <td>
                          <asp:LinkButton Text=' <%# DataBinder.Eval(Container.DataItem, "name") %>' ID="Button1" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "username") %>' 
                   style="color:wheat"  runat="server" />
                      </td>

                  </tr>
        </table>
         </ItemTemplate>
      </asp:DataList>
            </div>
            <!-- Right column End -->

            </div>
            <!-- End mid portiion -->
            <br />
            <UC2:footer runat="server" />

        </div>
            <div class="chat" style="position: fixed;top: 342px;left: 523px;border: solid 1px black;background-color: wheat;width: 450px;height:300px;opacity:0.8" >
           <div style="width:501px; height:30px; top: 58px; left: 401px;background:black;padding:10px">
               <asp:Label ID="chatname" runat="server" Text="Label" style="color:white;font-size:25px;margin-left:40px;margin-top:50px"></asp:Label>
           <input type="button" style="margin-left:300px"/>
                </div>

                <div id="content" style="width:501px;height:200px;background-color:maroon;overflow:auto">
                   
                    
                </div>
                 <div style="width:501px;height:50px;overflow:auto;background-color:magenta">
                     <textarea id="chatarea" style="height:45px; width:341px;overflow:auto ; font-size:18px;float:left"  ></textarea>
                 <input type="button" style="margin-left:41px; height: 29px; margin-top: 13px;" value=" Send " onclick="send(this.value)" />
                 </div>
                 </div>
    </form>
</body>
</html>
