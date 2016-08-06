<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Bipu_Start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style type="text/css">
        .auto-style4 {
            width: 100%;
            height: 2px;
        }

        .auto-style5 {
            width: 100px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="Home_style.css" />
    <link href="css/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="js/ninja-slider.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">


            <div class="wraper">
                <UC1:banner runat="server"></UC1:banner>

                <div class="content">



                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style3" style="padding-top: 0px; height: 100px">
                                <div>
                                    <ul>
                                        <li>
                                            <div><a href="Start.aspx">Home</a></div>
                                        </li>
                                        <li>
                                            <div><a href="Information.aspx">Information</a></div>
                                            <ul>
                                                <li>
                                                    <div><a href="History.aspx">History</a></div>
                                                </li>
                                                <li>
                                                    <div><a href="location.aspx">Location</a></div>
                                                </li>
                                                <li>
                                                    <div><a href="message from head.aspx">Message</a></div>
                                                </li>
                                                <li>
                                                    <div><a href="why cse @ kuet.aspx">Why CSE</a></div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <div><a href="admission.aspx">Addmision</a></div>
                                            <ul>
                                                <li>
                                                    <div><a href="undergraduate%20admission.aspx">Undergraduate</a></div>
                                                </li>
                                                <li>
                                                    <div><a href="graduate admission.aspx">Graduate</a></div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <div><a href="research.aspx">Research</a></div>
                                        </li>

                                        <li>
                                            <div><a href="activities.aspx">Activities</a></div>
                                        </li>
                                        <li>
                                            <div><a href="Faculty.aspx">Faculty</a></div>
                                        </li>
                                        <li>
                                            <div><a href="staffs.aspx">Staffs</a></div>
                                        </li>

                                        <li>
                                            <div><a href="routine10.aspx">Class Routine</a></div>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td>
                             
                       
                                    <div id="ninja-slider" style="width:600px; height:400px">
                                         <ul>
                                              <li><div data-image="Image/t.JPG"></div></li>
                                              <li><div data-image="Image/t.JPG"></div></li>
                                              <li><div data-image="Image/3.jpg" ></div></li>
                                             <li><div data-image="Image/4.jpg" ></div></li>
                                             <li><div data-image="Image/5.jpg" ></div></li>
                                         </ul>
                                    </div>

                                <div style="margin-top: 50px">

                                    <table class="auto-style4">
                                        <tr>
                                            <td>
                                                <table class="auto-style4">
                                                    <tr>
                                                        <td class="auto-style5"><span style="font-style: italic; color: #990000; font-size: 25px">#CSE features</span>
                                                            <br />
                                                            <br />
                                                            <img src="Image/f.jpg" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style5"><span style="font-style: italic; color: #990000; font-size: 25px">#Prospect of cse</span>

                                                            <br />
                                                            <br />
                                                            This document was prepared as a project<br />
                                                            for the internet programming lab of 2nd year 2nd semister organized<br />
                                                            by Ashiq Mahmood
                                                            <br />
                                                            Department os CSE 2K11,KUET. The project show was held on march 23, 2014 at the Software Lab.

                                        
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td>

                                                <table class="auto-style4">
                                                    <tr>
                                                        <td><span style="font-style: italic; color: #990000; font-size: 25px">#CSE news</span>
                                                            <br />
                                                            <br />
                                                            <span><a href="">10/02/2014</a>1st submision date of Project of 2.2.</span>

                                                            <br />
                                                            <br />
                                                            <span><a href="">23/03/2014</a> last submision date of Project of 2.2.</span>

                                                            <br />
                                                            <br />
                                                            <span><a href="">08/04/2014</a> central viva of 2.2.</span>
                                                            <br />
                                                            <br />
                                                            <span><a href="">21/04/2014</a>  1.2,2.2 & 3.2 examination wiil be held on.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>

                                </div>

                            </td>
                        </tr>
                    </table>



                </div>

              

            </div>

        </div>
    </form>
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
</body>
</html>
