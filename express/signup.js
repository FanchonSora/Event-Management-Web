function signup(e) {
    event.preventDefault();
    // For user name
    var userName = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var loginName = document.getElementById("loginname").value;
    var password = document.getElementById("password").value;

    var member = {
        userName : userName,
        email : email,
        phone : phone,
        loginName : loginName,
        password : password,
    }
    var Json = JSON.stringify(member);
    localStorage.setItem(userName, Json);
    alert("Sign up success");
}

function login(e) {
    event.preventDefault();
    var loginName = document.getElementById("loginname").value;
    var password = document.getElementById("password").value;
    var user = localStorage.getItem(loginName);
    var data = JSON.parse(user);
    if(user == null) {
        alert("Please re-enter your information")
    }
    else if(loginName == data.loginName && password == data.password) {
        alert("Sign in success");
        //window.location.
        // Change the screen interface
    }
    else {
        alert("Wrong password or wrong user name");
    }
}