<cfset variables.app = getApplicationSettings()>
<cfif structKeyExists( URL, "action")> 
    <cfsetting enablecfoutputonly="true">
    <cfsetting showDebugOutput="false">
</cfif>
<cfscript>
    if(structKeyExists(session, "loggedInUser")) {
        
        /* Borrow Book */
        if (structKeyExists(URL, "action") && URL.action == "confirm") {
            variables.book = createObject("component", variables.app.baseURL & "model.book");
            bookId = form.id;
            variables.result = variables.book.confirmBook(bookId = bookId, userId = session.loggedInUser.userId);
            if (variables.result) {
                response = structNew();
                response.success = true;
                response.message = "Booking confirmed successfully.";
                writeOutput(serializeJSON(response));
            } else {
                response = structNew();
                response.success = false;
                response.message = "Error in Booking. Please try again later";
                writeOutput(serializeJSON(response));
            }
        }

        /* Books list */
        variables.book = createObject("component", variables.app.baseURL & "model.book");
        variables.currentPage = 1;
        if (structKeyExists(URL, "currentpage")) {
            variables.currentPage = URL.currentpage;
        }
        variables.pageSize = 5;
        variables.books = variables.book.getUserBooks(page = variables.currentPage, pageSize = variables.pageSize);
        variables.totalPages = ceiling(variables.books.totalcount / variables.pageSize);
    }
</cfscript>