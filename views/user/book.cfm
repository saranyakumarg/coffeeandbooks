

<cfinclude  template="../../controller/user/booksAction.cfm">

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../layout/header.cfm">
<body>
    <cfoutput>
    <cfinclude  template="../layout/nav.cfm">
        <main>
            <div class="dashboard-wrapper">
                <cfinclude  template="../layout/sidenav.cfm">
                <div class="dashboard-content">

<!---                     <div class="search-bar"> 
                        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for menu items...">
                    </div> --->

                    <table class="menu-items-table">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Author</th>
                                <th>Status</th>
                                <th>Booked at</th>
                                <th>Borrowed at</th>
                                <th>Review</th>
                                <th>Reviewed at</th>
                                <th>Returned at</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="#variables.books.items#">
                                <tr>
                                    <td>BK-#variables.books.items.user_book_id#</td>
                                    <td>#variables.books.items.book_name#</td>
                                    <td>#variables.books.items.authorName#</td>
                                    <td>
                                        <cfif variables.books.items.book_returned_date NEQ "">
                                            Returned
                                        <cfelseif variables.books.items.borrowed_date NEQ "">
                                            Borrowed
                                        <cfelseif variables.books.items.booked_date NEQ "">
                                            Booked
                                        </cfif>
                                    </td>
                                    <td>#DateFormat(variables.books.items.booked_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.books.items.booked_date, 'hh:mm tt')#</td>  
                                    <td>#DateFormat(variables.books.items.borrowed_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.books.items.borrowed_date, 'hh:mm tt')#</td>  
                                    <td>
                                        <cfif variables.books.items.review NEQ "">
                                            <i class="fa fa-sticky-note" aria-hidden="true"></i>
                                            #variables.books.items.review#
                                        <cfelse>
                                            <button class="edit-btn" <cfif variables.books.items.borrowed_date NEQ ""> title="Add Review"<cfelse> title="Add Review after reading the book" disabled</cfif> onclick="">
                                                <i class="fa fa-pencil-square" aria-hidden="true"></i>
                                            </button>
                                        </cfif>
                                    </td>  
                                    <td>#DateFormat(variables.books.items.review_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.books.items.review_date, 'hh:mm tt')#</td>  
                                    <td>#DateFormat(variables.books.items.book_returned_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.books.items.book_returned_date, 'hh:mm tt')#</td>  
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <cfif currentPage GT 1>
                            <a href="#variables.app.baseURL#?page=admin-books&currentPage=#currentPage-1#" >Previous</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Previous</a>
                        </cfif>

                        <cfoutput>
                            <!-- Display page numbers -->
                            <cfloop from="1" to="#variables.totalPages#" index="pageNum">
                                <a href="#variables.app.baseURL#?page=admin-books&currentPage=#pageNum#" 
                                <cfif pageNum EQ currentPage>class="active"</cfif>>#pageNum#</a>
                            </cfloop>
                        </cfoutput>

                        <cfif currentPage LT variables.totalPages>
                            <a href="#variables.app.baseURL#?page=admin-books&currentPage=#currentPage+1#">Next</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Next</a>
                        </cfif>
                    </div>

                </div>
            </div>
        </main>

    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
