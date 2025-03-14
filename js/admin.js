var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");    
var modal = document.getElementById("GeneralModal");
var span = document.getElementsByClassName("close")[0];

function BorrowConfirm(userBookId) {
    if (confirm("Are you sure you want to confirm this booking?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", baseURL + "controller/admin/booksAction.cfm?action=confirm-borrow", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var data = "id=" + encodeURIComponent(userBookId);
        
        xhr.onload = function () {
            if (xhr.status == 200) {
                try {
                    var response = JSON.parse(xhr.responseText);
                    if (response.SUCCESS) {
                        alert(response.MESSAGE);
                        window.location.reload();
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