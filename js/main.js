
    var modal = document.getElementById("adminLoginModal");
    var btn = document.getElementById("adminLoginBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function loginFormSubmit(event) {
        event.preventDefault();
        var span = document.getElementById("loginResponse");
        var form = document.getElementById("adminLoginForm");
        var formData = new FormData(form);

        var submitButton = form.querySelector("button");
        submitButton.disabled = true;
        submitButton.innerHTML = "Submitting...";

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "action/login-action.cfm", true);
        xhr.onload = function() {
            submitButton.disabled = false;
            submitButton.innerHTML = "login";
            if(xhr.status == 200) {
                span.innerHTML = "login successful";
                span.classList.add("success-message");
                window.location.href = "dashboard.cfm"; 
            } else {
                span.classList.add("failure-message");
                span.innerHTML = "Invaild credentials";
            }
        }
        xhr.onerror = function() {
            alert('A network error occurred.');
        };
        xhr.send(formData);
    }

    function logout() {    
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "action/login-action.cfm?logout=true", true);
        xhr.onload = function() {
            if (xhr.status == 200) {
                window.location.href = "index.cfm";
            } else {
                span.classList.add("failure-message");
               alert('An error occurred during logout');
            }
        }
        xhr.onerror = function() {
            alert('A network error occurred.');
        };
        xhr.send();
    }
    

