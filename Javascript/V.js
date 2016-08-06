function validate_form(thisform) {

    with (thisform) {
     
        var Fname, Pass, Gender, Conpass, Email, Email;

        Fname = document.getElementById("fname").value;
        var Lname = document.getElementById("lname").value;
        var Age = document.getElementById("age").value;
        Gender = document.getElementById("gender").value;
        Pass = document.getElementById("password").value;
        Conpass = document.getElementById("TextBox1").value;
        Email = document.getElementById("email").value;
        var User = document.getElementById("username").value;
        document.getElementById("fnamelabel").innerHTML = "";
        document.getElementById("lnamelabel").innerHTML = "";
        document.getElementById("passlabel").innerHTML = "";
        document.getElementById("cpasslabel").innerHTML = "";
        document.getElementById("emaillabel").innerHTML = "";
        document.getElementById("agelabel").innerHTML = "";
        document.getElementById("userlabel").innerHTML = "";
        emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        if (Fname == "" && Lname == "" && User=='' && Gender == null && Pass == "" && Conpass == "" && Email == "" && Age == "") {
            alert("Enter All Fields");
            return false;
        }
        if (Fname == '')
        {
           // alert("Please Enter First Name");
            document.getElementById("fnamelabel").innerHTML = "Please Enter First Name.";
          //  return false;
        }
        if (Lname == '') {
           // alert("Please Enter Last Name");
            document.getElementById("lnamelabel").innerHTML = "Please Enter Last Name.";
           // return false;
        }
       /* if (Gender == null) {
           // alert("Please Select gender");
            document.getElementById("genderlabel").innerHTML="Please Select gender.";
           // return false;
        }*/
        if (Age == "")
        {
            document.getElementById("agelabel").innerHTML = "Please Enter DirthDate";
        }
        if (Pass == '') {
            //alert("Please Enter Password");
            document.getElementById("passlabel").innerHTML = "Please Enter Password.";
           // return false;
        }
        if ( Conpass == '') {
            document.getElementById("cpasslabel").innerHTML = "Please Confirme Password.";
            //alert("Please Confirm Password");
           // return false;
        }
        if (Pass != Conpass) {
            document.getElementById("passlabel").innerHTML = "Password Does not Match.";
           // alert("Password not match");
            //return false;
        }
        if (Email == '') {
            document.getElementById("emaillabel").innerHTML = "Please Enter Email.";
           // alert("Email Id Is Required");
           // return false;
        }
        if (User == '')
        {
            document.getElementById("userlabel").innerHTML = "Please Enter Username";
        }
        if (Email != '') {
            if (!Email.match(emailExp)) {
                document.getElementById("emaillabel").innerHTML = "Enter Valid Email.";
                //alert("Invalid Email Id");
               // return false;
            }
        }
        if (Fname == "" || User=='' || Lname == "" || Pass == "" || Conpass == "" || Email == "" || Age == "") {
         
            return false;
        }

        return true;
    }
    
}
