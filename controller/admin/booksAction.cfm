<cfset variables.app = getApplicationSettings()>
<cfif structKeyExists( URL, "action") AND (URL.action == 'delete' OR URL.action == 'confirm-borrow')> 
    <cfsetting enablecfoutputonly="true">
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    if(!structKeyExists(session, "loggedInUser")) {
        location(url = "#variables.app.baseURL#index.cfm");
    }

    variables.book = createObject("component", variables.app.baseURL & "model.admin.book");

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
                redirectURL = variables.app.baseURL & "?page=admin-books";
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

    /* confirm borrow */ 
    if (structKeyExists(URL, "action") && URL.action == "confirm-borrow") {
        userBookId = form.id;
        variables.borrowBook = variables.book.confirmBorrow(userBookId = userBookId);
        response = structNew();
        if(variables.borrowBook) {
             // email data
                variables.emailData = {
                    to: "saranyakumar@yopmail.com",
                    from: "saranyakumar.g@techversantinfotech.com",
                    subject: "Borrow Confirmation",
                    message: "Hello, <br> Your book borrowing request has been successfully confirmed.<br>Thank you!",
                    type: "html"
                };
            response.success = true;
            response.message = "Borrow confirmed successfully.";
        } else {
            response.success = false;
            response.message = "Error occured, please try again after some time.";
        }
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

    /* Books log */
    if (structKeyExists(URL, "page") && URL.page == "books-log") {
        variables.currentPage = 1;
        variables.bookLog = createObject("component", variables.app.baseURL & "model.book");
        if (structKeyExists(URL, "currentpage")) {
            variables.currentPage = URL.currentpage;
        }
        variables.pageSize = 5;
        variables.booksLog = variables.bookLog.getUserBooks(page = variables.currentPage, pageSize = variables.pageSize);
        variables.totalPages = ceiling(variables.booksLog.totalcount / variables.pageSize);
     }

</cfscript>

<!--- Send email using cfmail outside cfscript --->
<cfif structKeyExists(variables, "borrowBook") AND variables.borrowBook>
    <cfmail to="#variables.emailData.to#"
            from="#variables.emailData.from#"
            subject="#variables.emailData.subject#"
            type="html">
        #variables.emailData.message#
    </cfmail>
</cfif>