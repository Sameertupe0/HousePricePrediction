function validateForm() {

    var email = document.forms["loginForm"]["email"].value;
    var password = document.forms["loginForm"]["password"].value;

    var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if (email == "") {
        alert("Email is required");
        return false;
    }

    if (!email.match(emailPattern)) {
        alert("Please enter a valid email");
        return false;
    }

    if (password == "") {
        alert("Password is required");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }

    return true;
}