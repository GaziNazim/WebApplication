
 

        function openchat(to)
        {
            
            var xmlhttp;
            document.getElementById("chatname").innerHTML = to;
            document.getElementById("chatarea").value = "";
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("content").innerHTML = xmlhttp.responseText;
                    chatbox.style.display = "block";
                }
            }
            xmlhttp.open("GET", "initialchat.aspx?p=" + to, true);
            xmlhttp.send();

        }

function Refresh()
{
    var xmlhttp;
    setTimeout('xmlhttpPost("script.php")', 5000);
    document.getElementById("chatarea").value = "";
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("content").innerHTML = xmlhttp.responseText;
            
        }
    }
    xmlhttp.open("GET", "chatrefresh.aspx", true);
    xmlhttp.send();
}
function send(str) {
    var text = document.getElementById("chatarea").value;
           
    var xmlhttp;
    if (text.length == 0) {
        return 0;
    }
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("content").innerHTML = xmlhttp.responseText;
            document.getElementById("chatarea").value = "";
        }
    }
    xmlhttp.open("GET", "chatserver.aspx?p=" + text, true);
    xmlhttp.send();
}


function chatclose()
{
    //chatbox.style.display = "none";
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {
        xmlhttp=new ActiveXObject("microsoft.XMLHTTP")
    }
    xmlhttp.onreadystatechange = function()
    {
        if(xmlhttp.readyState==4 && xmlhttp.status == 200)
        {
           // document.getElementById("content").innerHTML = xmlhttp.responseText;
            //document.getElementById("chatname").innerHTML = xmlhttp.responseText;
            chatbox.style.display = "none";
        }
    }
    xmlhttp.open("GET","chatclose.aspx",true);
    xmlhttp.send();
}

