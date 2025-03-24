
component rest="true" restpath="/booksService" {
    variables.app = getApplicationSettings();
    this.datasource = "#variables.app.datasource#"; 

    remote struct function getBooks() 
        httpmethod="GET" restpath="books" {
        var qryGetBook = "";
        query qryGetBook = "
            SELECT id, name, description, authorName, image_file_path
            FROM books";

        if (qryGetBook.recordcount EQ 0) {
            return { "error": "Books not found" };
        }

        return qryGetBook;
    }
}
