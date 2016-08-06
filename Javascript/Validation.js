


function validation(thisform)
{ 
    alert("OK");
    document.getElementById("Label1").innerHTML="djhf";
    with(thisform)
    {
        var Name, pass, gender, conpass, EmailId, emailExp;
      
        Fname = document.getElementById("fname").value;
        var Lname = document.getElementById("lname").value;
        var Age = document.getElementById("age").value;
        Gender = document.getElementById("gender").value;
        Pass = document.getElementById("password").value;
        Conpass = document.getElementById("TextBox1").value;
        Email = document.getElementById("email").value;
        emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
 
        if (Fname == '' && Lname == '' && Gender == 0 && Pass == '' && Conpass == '' && Email == '' && Age =='') {
            alert("Enter All Fields");
            return false;
        }
        if (Name == '') {
            alert("Please Enter Login ID");
            return false;
        }
        if (gender == 0) {
            alert("Please Select gender");
            return false;
        }
        if (pass == '')
        {
            alert("Please Enter Password");
            return false;
        }
        if (pass != '' && conpass == '')
        {
            alert("Please Confirm Password");
            return false;
        }
        if (pass != conpass)
        {
            alert("Password not match");
            return false;
        }
        if (EmailId == '')
        {
            alert("Email Id Is Required");
            return false;
        }
        if (EmailId != '')
        {
            if (!EmailId.match(emailExp))
            {
                alert("Invalid Email Id");
                return false;
            }
        }
        return true;
    }
    }