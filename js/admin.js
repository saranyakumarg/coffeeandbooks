
document.getElementById('createMenuForm').addEventListener('submit', function(event) {
    // Get the file input element and the selected file
    var fileInput = document.getElementById('imageContent');
    var file = fileInput.files[0];

    // If no file is selected, allow form submission
    if (!file) return;

    // Create an image object to read the dimensions of the file
    var img = new Image();

    // Set up a file reader to load the image and check its dimensions
    var reader = new FileReader();
    reader.onload = function(e) {
        img.onload = function() {
            var imgWidth = img.width;
            var imgHeight = img.height;
            var maxWidth = 1800; // Maximum allowed width in pixels
            var maxHeight = 1100; // Maximum allowed height in pixels

            // Check if the image exceeds the maximum dimensions
            if (imgWidth > maxWidth || imgHeight > maxHeight) {
                // Prevent form submission if image is too large
                event.preventDefault();

                // Show the error message
                alert('Image dimensions are too large. Maximum allowed size is ' + maxWidth + 'x' + maxHeight + ' pixels.');
            }
        };
        img.src = e.target.result; // Set the source of the image to the data URL of the file
    };
    
    reader.readAsDataURL(file); // Read the file as a Data URL
});
