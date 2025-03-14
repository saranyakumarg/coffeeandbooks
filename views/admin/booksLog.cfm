

<cfinclude  template="../../controller/admin/booksAction.cfm">

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
                                <th>User</th>
                                <th>Book</th>
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
                            <cfoutput query="#variables.booksLog.items#">
                                <tr>
                                    <td>BK-#variables.booksLog.items.user_book_id#</td>
                                    <td>#variables.booksLog.items.username#</td>
                                    <td>#variables.booksLog.items.book_name#</td>
                                    <td>#variables.booksLog.items.authorName#</td>
                                    <td>
                                        <cfif variables.booksLog.items.book_returned_date NEQ "">
                                            Returned
                                        <cfelseif variables.booksLog.items.borrowed_date NEQ "">
                                            Borrowed
                                        <cfelseif variables.booksLog.items.booked_date NEQ "">
                                            Booked
                                        </cfif>
                                    </td>
                                    <td>#DateFormat(variables.booksLog.items.booked_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.booksLog.items.booked_date, 'hh:mm tt')#</td>  
                                    <td>
                                        <cfif variables.booksLog.items.borrowed_date NEQ "">
                                            #DateFormat(variables.booksLog.items.borrowed_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.booksLog.items.borrowed_date, 'hh:mm tt')#
                                        <cfelse>
                                            <button class="hover-title-btn" onclick="BorrowConfirm(#variables.booksLog.items.user_book_id#)">
                                                <i class="fa fa-check-square" aria-hidden="true"></i>
                                                <span class="button-text">Confirm Borrow</span>
                                            </button>
                                        </cfif>
                                    </td>  
                                    <td>#variables.booksLog.items.review#</td>  
                                    <td>#DateFormat(variables.booksLog.items.review_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.booksLog.items.review_date, 'hh:mm tt')#</td>  
                                    <td>#DateFormat(variables.booksLog.items.book_returned_date, 'mmm dd, yyyy') & " " & TimeFormat(variables.booksLog.items.book_returned_date, 'hh:mm tt')#</td>  
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
