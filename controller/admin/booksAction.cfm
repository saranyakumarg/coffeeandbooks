<cfif structKeyExists( URL, "action") AND URL.action == 'delete'> 
    <cfsetting enablecfoutputonly="true">
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    if(!structKeyExists(session, "loggedInUser")) {
        location(url = "#application.baseURL#index.cfm");
    }

    variables.book = createObject("component", application.baseURL & "model.admin.book");

    /* Create Book */
    if (structKeyExists(URL, "page") && URL.page == "create-book") {
        variable.message = "";
        variable.singleBook = [];
        variable.itemID = 0;
        variable.ename ="";
        variable.edescription = "";
        variable.eauthor = "";
        variable.eimage_file_path = "";
        if (structKeyExists(URL, "id") && URL.id > 0) {
            variable.singleBook = book.getAllBooks(url.id);
            variable.itemID = url.id;
            variable.ename = variable.singleBook.items.name;
            variable.edescription = variable.singleBook.items.description;
            variable.eauthor = variable.singleBook.items.authorName;
            variable.eimage_file_path = variable.singleBook.items.image_file_path;
        }

        if (structKeyExists(form, "createBook")) {
            variable.imagePath = "";

            if (isDefined("Form.imageContent") && len(Form.imageContent)) {
                variable.saveDir = expandPath("uploads/");
                cffile(action = "upload", fileField = "Form.imageContent", destination = variable.saveDir, accept = "image/*", nameConflict = "MakeUnique");
                variable.imageName = cffile.serverFile;
                variable.imagePath = 'uploads/' & variable.imageName;
            }

            result = book.createBook(variable.itemID, form.name, form.description, form.author, variable.imagePath);
            if (result) {
                variable.message = '<span class="success-message">Book added/updated successfully!</span>';
                redirectURL = application.baseURL & "?page=admin-books";
                location(url = redirectURL);
            } else {
                variable.message = '<span class="failure-message">There was an error creating/updating the menu item. Please try again.</span>';
            }
        }

    }



    /* Delete Book */
    if (structKeyExists(URL, "action") && URL.action == "delete") {
        bookId = form.id;
        variables.deleteBook = variables.book.deleteMenuItem(bookId = bookId);
        response = structNew();
        response.success = true;
        response.message = "Book deleted successfully.";
        writeOutput(serializeJSON(response));
    }
    
    /* Books list */
    variables.currentPage = 1;
    if (structKeyExists(URL, "currentpage")) {
        variables.currentPage = URL.currentpage;
    }
    variables.pageSize = 5;
    variables.books = variables.book.getAllBooks(page = variables.currentPage, pageSize = variables.pageSize);
    variables.totalPages = ceiling(variables.books.totalcount / variables.pageSize);
    // writeDump(var=variables.books.items, abort=true);

</cfscript>