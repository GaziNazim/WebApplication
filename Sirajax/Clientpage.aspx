<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clientpage.aspx.cs" Inherits="Sirajax_Clientpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function refresh(str)
        {
            if(str.length==0)
            {
                document.getElementById("s").innerHTML = "No Suggetion"
                return;
            }
            var xmlhttp;
            if(window.XMLHttpRequest)
            {
                xmlhttp = new XMLHttpRequest();
            }
            else
            {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if(xmlhttp.readyState==4&&xmlhttp.status==200)
                {
                    document.getElementById("s").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "serverpage.aspx?p=" + str, true)
            xmlhttp.send();
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" size="50" onkeyup="refresh(this.value)" />
      <span id="s"></span>

    </div>
    </form>
</body>
</html>
