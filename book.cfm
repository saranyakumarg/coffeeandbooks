<cfset book = createObject("component", "action.book")>
<cfset books = book.getAllbookItems()>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<body>
    <cfinclude  template="layout/nav.cfm">

    <cfoutput>
        <main>
            <h4>Explore Our Books:</h4>
            <ul class="book-list">
                <cfloop query="#books#">
                    <li class="book-item">
                        <div class="book-item-header">
                            <strong class="book-item-name">#books.name#</strong>
                            <span class="book-item-author">by #books.authorName#</span>
                        </div>
                        <p class="book-item-description">#books.description#</p>
                    </li>
                </cfloop>
            </ul>
        </main> 
    </cfoutput>

    <cfinclude  template="layout/footer.cfm">
</body>
</html>
