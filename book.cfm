<cfset book = createObject("component", "controller.book")>
<cfset bookItems = book.getAllbookItems()>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<body>
    <cfinclude  template="layout/nav.cfm">

    <cfoutput>
        <main>
            <h4>Explore Our Books:</h4>
            <ul class="book-list">
                <cfloop array="#bookItems#" index="item">
                    <li class="book-item">
                        <div class="book-item-header">
                            <strong class="book-item-name">#item.name#</strong>
                            <span class="book-item-author">by #item.authorName#</span>
                        </div>
                        <p class="book-item-description">#item.description#</p>
                    </li>
                </cfloop>
            </ul>
        </main> 
    </cfoutput>

    <cfinclude  template="layout/footer.cfm">
</body>
</html>
