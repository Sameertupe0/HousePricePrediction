function validateRegisterForm() {

    var name = document.forms["registerForm"]["name"].value;
    var email = document.forms["registerForm"]["email"].value;
    var password = document.forms["registerForm"]["password"].value;
    var role = document.forms["registerForm"]["role"].value;

    var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    // Name validation
    if (name.trim() === "") {
        alert("Name is required");
        return false;
    }

    if (name.length < 3) {
        alert("Name must be at least 3 characters");
        return false;
    }

    // Email validation
    if (email === "") {
        alert("Email is required");
        return false;
    }

    if (!email.match(emailPattern)) {
        alert("Please enter a valid email");
        return false;
    }

    // Password validation
    if (password === "") {
        alert("Password is required");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }

    // Role validation
    if (role !== "USER" && role !== "ADMIN") {
        alert("Role must be USER or ADMIN");
        return false;
    }

    return true;
}