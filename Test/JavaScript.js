function writee()
{
    //document.write("I am\"Nazim\"");
    var s = document.getElementById("p").innerHTML;
    s = s.replace("Nazim", "Oni");
    document.getElementById("p").innerHTML = s;
}
function validate_form(thisform)
{
    with (thisform) {
        if (document.getElementById("TextBox1").value == "")
        {
            alert("false");
            return false;
            
        }
        else
        {
            alert("True");
            return true;
        }
            
    }
}
function re()
{

}