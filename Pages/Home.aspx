<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
     <link href="../Style/Main.css" rel="stylesheet" />
    <link href="../Style/fonts.css" rel="stylesheet" />
    <script src="../Javascript/ajax.js"></script>
    <style type="text/css">
         .auto-style2 {
            width: 80%;
            text-align:right;
            margin:100px 0px 0px 0px;
        }
 
    </style>

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
                                    Request 
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

                  <tr>
                   
                     <td style="text-align:right;color:wheat;width:50%" >
                           <input class="o_button" type="button" value='<%# DataBinder.Eval(Container.DataItem, "name") %>' style="color:black" onclick="openchat(this.value)" />
                      
                           </td>
                      <td style="text-align:left;color:wheat">
                            <%# DataBinder.Eval(Container.DataItem, "flag") %>
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

        <div class="chatbox" id="chatbox"  >
           <div class="chatmenu" >
               <div class="chatname"><asp:Label ID="chatname" runat="server" Text="Label" style="color:white;font-size:25px;margin-left:40px;margin-top:50px"></asp:Label>
            </div>
               <input class="r_button" type="button" value="Refresh" onclick="Refresh()" />
                <input type="button" class="c_button" value="Exit" onclick="chatclose()"/>
                </div>

                <div id="content" class="chat_content">
                   
                    
                </div>
                 <div class="input_bar">
                     <textarea id="chatarea" class="chat_area"  ></textarea>
                 <input type="button" class="send_button"  value=" Send " onclick="send(this.value)" />
                 </div>
                 </div>
        
       <script type="text/javascript">
          
           try
           {
               
               var ses = '<%=Session["to"].ToString() %>';
           }
           catch(err)
           {
               
           }
           
           if (ses != "")
           {
               document.getElementById("chatname").innerHTML = ses;
               document.getElementById("content").innerHTML = ses;
               chatbox.style.display = "block";
           }
           
       </script>
    </form>
    
</body>
</html>
