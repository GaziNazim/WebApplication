<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sign_up.aspx.cs" Inherits="Pages_Sign_up" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up</title>
    <script src="../Javascript/V.js"></script>
   
    <link href="../Style/Main.css" rel="stylesheet" />
   
 
    <style type="text/css">
        .auto-style1 {
            width: 9px;
            margin:20px 200px 20px 299px;
            color:white;
        }
        .auto-style2 {
            width: 553px;
        }
        .auto-style3 {
            width: 22px;
        }
        .auto-style4 {
            width: 25px;
          text-align:right;
        }
        .auto-style5 {
            width: 113px;
            color:red;
            text-align:left;
        }
        .auto-style7 {
            width: 22px;
            height: 40px;
        }
        .auto-style8 {
            width: 113px;
            color: red;
            text-align: left;
            height: 40px;
        }
        #error
        {
            color:red;
            margin:10px;
        }
    </style>
     <script src="../Javascript/Available.js"></script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validate_form(this)"  >
    <div class="main">
          <UC1:banner runat="server" />
            <div></div>
        <div class="signin">
            <div id="up">
               
              
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Give your Information" style="font-size:40px; font-style: italic; font-weight: 700; color: #FF3399;"></asp:Label>
                            <br />
                            <span id="error"> * Required</span>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                            :</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            *<asp:Label ID="fnamelabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
                            :</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">*<asp:Label ID="lnamelabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
                            :</td>
                        <td class="auto-style3">
                            
                       
                             <asp:RadioButtonList ID="gender" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Table" style="margin-left: 38px">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:RadioButtonList>   
                            
                             </td>
                        <td class="auto-style5">*<asp:Label ID="genderlabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label5" runat="server" Text="BirthDate:"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="age" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td class="auto-style5">*<asp:Label ID="agelabel" runat="server" Text=""></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label6" runat="server" Text="User Name:"></asp:Label>
                        </td>
                        <td class="auto-style7">
                     

                                   <asp:TextBox ID="username" runat="server" onkeyup="available(this.value)" ></asp:TextBox>
          <br /> 
                            <asp:Label ID="avail" runat="server" Text="" ></asp:Label>


                            

                            
                          
                        </td>
                        <td class="auto-style8">
                            *&nbsp;&nbsp;
                            <asp:Label ID="euser" runat="server" Text=""></asp:Label>
                            <asp:Label ID="userlabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label7" runat="server" Text="PassWord"></asp:Label>
                            :</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">*<asp:Label ID="passlabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                       <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label9" runat="server" Text="Confirm PassWord"></asp:Label>
                            :</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox1" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">*<asp:Label ID="cpasslabel" runat="server" Text=""></asp:Label>
                           </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                        </td>
                        <td class="auto-style5"> 
                            *
                                    
                              <asp:Label ID="emaillabel" runat="server" Text=""></asp:Label>
                                    
                              </td>
                    </tr>
                </table>
               
                        </td>
                    </tr>
                </table>
               
              
                <br />
               
                <br />
                <br />
                <br />
               
              <asp:Button ID="done" runat="server" Text="  Done  " style="margin-left: 349px" OnClick="done_Click" />
               
            </div>
            
        </div>
    
    </div>
    </form>
</body>
 
</html>
