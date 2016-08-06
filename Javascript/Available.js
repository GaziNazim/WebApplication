function available(str)
{
    document.getElementById("avail").innerHTML = "No Suggetion"
    if (str.length == 0) {
       
        return;
    }
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("avail").innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "Available.aspx?p=" + str, true)
    xmlhttp.send();
}