   
    var baseURL = document.getElementById("appConfig").getAttribute("data-baseurl");    
    var modal = document.getElementById("GeneralModal");
    var span = document.getElementsByClassName("close")[0];

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    $("#success-modal").hide();  
    $("#next-button").click(function() {
        window.location.href = baseURL + "?page=menu";
    });

    function getBook(bookId) {
        var bookName = $('#book_name_'+bookId).html();
        $('#popup-heading').html( 'Confirm booking');
        $('#popup-content').html('Have a happy time reading the book '+  bookName.toUpperCase());
        $('#confirm_id').val(bookId);
        modal.style.display = "block";
    }

    function confirmBooking() {
        var confirm_id  = $('#confirm_id').val();
        var urlParams = new URLSearchParams(window.location.search);
        var page= urlParams.get('page');
        if(page == 'books') {
            var url = baseURL + "controller/user/booksAction.cfm?action=confirm";
        }
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var data = "id=" + confirm_id;
        xhr.onload = function() {
            if(xhr.status == 200) {
                $("#confirm-modal").hide();  
                $("#success-modal").show();  
                var response = JSON.parse(xhr.responseText.trim());
                if (response.SUCCESS) {
                    $('#success-content').html('Your booking has been confirmed, Please collect the book. In the mean time you can explore our coffee menu!!');
                } else {
                    $('#success-content').html(response.MESSAGE);
                }
            } else {
                span.classList.add("failure-message");
                span.innerHTML = "Error occurred.";
            }
        }
        xhr.onerror = function() {
            alert('A network error occurred.');
        };
        xhr.send(data);
    }
    


    

