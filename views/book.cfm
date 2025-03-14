<cfinclude  template="../controller/user/booksAction.cfm">
<cfset variables.book = createObject("component", "#variables.app.baseURL#model.book")>
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
                                    <img src="#variables.app.baseURL&variables.qryBooks.image_file_path#" alt="Cover of #variables.qryBooks.name#" />
                                </cfif>
                            </div>
                            <strong class="book-item-name" id="book_name_#variables.qryBooks.id#">#variables.qryBooks.name#</strong>
                            <span class="book-item-author">by #variables.qryBooks.authorName#</span>
                            <cfif structKeyExists(session, "loggedInUser") AND session.loggedInUser.role == 2>
                            <span class="book-item-shelf">In-shelf (#variables.qryBooks.shelf_quantity#)</span>
                                <cfif variables.qryBooks.shelf_quantity GT 0>
                                    <button class="book-item-get general-popup" onclick="getBook(#variables.qryBooks.id#)">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" style="enable-background:new 0 0 64 64" xml:space="preserve" class="default-icon">
                                            <path d="M54 8V0H12C6.49 0 2 4.49 2 10v44c0 5.51 4.49 10 10 10h50V8h-8zM6 10c0-3.31 2.69-6 6-6h38v40H12c-2.25 0-4.33.75-6 2V10zm6 50c-3.31 0-6-2.69-6-6s2.69-6 6-6h42V12h4v40H20v4h38v4H12z" style="fill:##231f20"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" class="hover-icon">
                                            <g data-name="07-open book">
                                                <path d="M47 15h-2V7a1 1 0 0 0-1.781-.625c-.075.094-7.4 9.052-18.245 9.575C24.43 4 14.5 4 4 4a1 1 0 0 0-1 1v11H1a1 1 0 0 0-1 1v23a1 1 0 0 0 1 1h1v2a1 1 0 0 0 1 1h42a1 1 0 0 0 1-1v-2h1a1 1 0 0 0 1-1V16a1 1 0 0 0-1-1zM2 39V18h1v10a1 1 0 0 0 1 1c11.736 0 18.542.479 18.977 10zm21 3H4v-1h19zm0-9.882C19.656 27.216 12.548 27.009 5 27V6c11.51.035 18 .8 18 11zm2-14.155c8.621-.378 15.05-5.519 18-8.414v20.085c-1.294 1.483-8.208 8.836-18 9.319zM44 42H25v-1h19zm2-3H33.49a31.573 31.573 0 0 0 11.291-8.375A1 1 0 0 0 45 30V17h1z"/>
                                                <path d="M4 32h4v2H4zM4 35h7v2H4z"/>
                                            </g>
                                        </svg>
                                        Get Book
                                    </button>
                                </cfif>
                            </cfif>
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
