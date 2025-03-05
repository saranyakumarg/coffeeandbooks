<cfset variables.book = createObject("component", "#application.baseURL#model.book")>
<cfset variables.qryBooks = book.getAllbookItems()>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<body>
    <cfinclude  template="layout/nav.cfm">

    <cfoutput>
        <main>
            <h4>Explore Our Books:</h4>
            <ul class="book-list">
                <cfloop query="#variables.qryBooks#">
                    <li class="book-item">
                        <div class="book-item-header">
                            <div class="book-item-image">
                                <!-- Check if image path exists -->
                                <cfif len(variables.qryBooks) && len(variables.qryBooks.image_file_path)>
                                    <img src="#application.baseUrl&variables.qryBooks.image_file_path#" alt="Cover of #variables.qryBooks.name#" />
                                </cfif>
                            </div>
                            <strong class="book-item-name">#variables.qryBooks.name#</strong>
                            <span class="book-item-author">by #variables.qryBooks.authorName#</span>
                        </div>
                        <p class="book-item-description">#variables.qryBooks.description#</p>
                    </li>
                </cfloop>
            </ul>
        </main>
    </cfoutput>

    <cfinclude  template="layout/footer.cfm">
</body>
</html>
