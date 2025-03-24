var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");    
var modal = document.getElementById("GeneralModal");
var span = document.getElementsByClassName("close")[0];

$(document).ready(function () {
    $('#eventsTable').DataTable({
        "processing": true, 
        "serverSide": true,  
        "ajax": baseURL + "controller/admin/eventsAPI.cfm",  
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "description" },
            { "data": "time" },
            { "data": "actions", "orderable": false }  // Disable sorting on actions column
        ]
    });
});

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

function searchEvents() {
    let searchQuery = document.getElementById("searchQuery").value.trim();
    fetch(baseURL + "controller/admin/eventsAction.cfm?searchQuery=" + encodeURIComponent(searchQuery))
        .then(response => response.text())
        .then(data => {
            console.log(data);
            document.getElementById("eventsTableBody").innerHTML = data;
        })
        .catch(error => console.error("Error:", error));

}