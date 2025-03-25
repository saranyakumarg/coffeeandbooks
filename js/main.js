    // Access the data attribute from the HTML element
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");    
    var role = document.getElementById("appConfig").getAttribute("data-role");    
    var modal = document.getElementById("adminLoginModal");
    var btn = document.getElementById("adminLoginBtn");
    var span = document.getElementsByClassName("close")[0];

    if(btn){
        btn.onclick = function() {
            modal.style.display = "block";
        }
    }
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    $(document).ready(function () {

        $("#registerLink").click(function () {
            $("#adminLoginModal").hide();
            $("#registerModal").show();
        });
    
        $(".close").click(function () {
            $(this).closest(".modal").hide();
        });
    
    });


    function registerFormSubmit(event){
        event.preventDefault();
        var form = $("#registerForm")[0];
        var formData = new FormData(form);
        if(formData.get("newPassword") !== formData.get("confirmPassword")) {
            $("#registerResponse").text("Passwords don't match.").css("color", "red");
            return;
        }
        $("#registerResponse").text("Processing registration...").css("color", "blue");

        $.ajax({
            url: baseURL + "controller/loginAction.cfm?register=true", 
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                try {
                    var jsonResponse = JSON.parse(response); 
        
                    if (jsonResponse.status === "success") {
                        $("#registerResponse").text(jsonResponse.message).css("color", "green");
        
                        setTimeout(function () {
                            window.location.href = baseURL + "?page=user-dashboard";
                        }, 2000); 
                    } else {
                        $("#registerResponse").text(jsonResponse.message).css("color", "red");
                    }
                } catch (error) {
                    $("#registerResponse").text("Unexpected response from server.").css("color", "red");
                    console.error("Response Parsing Error:", error);
                }
            },
            error: function (xhr, status, error) {
                $("#registerResponse").text("Registration failed. Please try again.").css("color", "red");
                console.error("AJAX Error:", status, error);
            }
        });
        
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
        xhr.open("POST", baseURL + "controller/loginAction.cfm", true);
        xhr.onload = function() {
            submitButton.disabled = false;
            submitButton.innerHTML = "login";
            if(xhr.status == 200) {
                span.innerHTML = "login successful";
                span.classList.add("success-message");
                var response = JSON.parse(xhr.responseText.trim());
                if(response.ROLE == 1) {
                    window.location.href = baseURL + "?page=dashboard"; 
                } else if(response.ROLE == 2) {
                    window.location.href = baseURL + "?page=user-dashboard"; 
                }
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
        xhr.open("GET", baseURL + "controller/loginAction.cfm?logout=true", true);
        xhr.onload = function() {
            if (xhr.status == 200) {
                window.location.href = baseURL;
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

    function deleteMenuItem(itemId) {
        if (confirm("Are you sure you want to delete this item?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", baseURL + "controller/admin/menuAction.cfm?action=delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var data = "id=" + encodeURIComponent(itemId);
            xhr.onload = function () {
                if (xhr.status == 200) {
                    if (xhr.responseText.trim() === "success") {
                        alert("Item deleted successfully.");
                        window.location.href = baseURL + "?page=admin-menu&currentPage=1"; 
                    } else if (xhr.responseText.trim() === "error") {
                        alert("There was an error deleting the item.");
                    } else {
                        alert("Unexpected response: " + xhr.responseText);
                    }
                } else {
                    alert("HTTP Error: " + xhr.status);
                }
            };
            xhr.send(data);
        }
    }

    function deleteBook(bookId) {
        if (confirm("Are you sure you want to delete this book?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", baseURL + "controller/admin/booksAction.cfm?action=delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var data = "id=" + encodeURIComponent(bookId);
            
            xhr.onload = function () {
                if (xhr.status == 200) {
                    try {
                        var response = JSON.parse(xhr.responseText);
                        if (response.SUCCESS) {
                            alert(response.MESSAGE);
                            window.location.href = baseURL + "?page=admin-books&currentPage=1"; 
                        } else {
                            alert(response.MESSAGE);
                        }
                    } catch (e) {
                        alert("Error parsing response: " + e.message);
                    }
                } else {
                    alert("HTTP Error: " + xhr.status);
                }
            };
            
            xhr.send(data);
        }
    }
    


    

