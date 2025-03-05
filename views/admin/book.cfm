

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

                    <div class="create-menu-btn">
                        <button onclick="window.location.href='#application.baseURL#?page=create-book'">Add New Book</button>
                    </div>

<!---                     <div class="search-bar"> 
                        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for menu items...">
                    </div> --->

                    <table class="menu-items-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Author</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="#variables.books.items#">
                                <tr>
                                    <td>#variables.books.items.id#</td>
                                    <td>#variables.books.items.name#</td>
                                    <td>#variables.books.items.description#</td>
                                    <td>#variables.books.items.authorName#</td>
                                    <td>
                                        <button class="edit-btn" title="Edit" onclick="window.location.href='#application.baseURL#?page=create-book&id=#variables.books.items.id#'">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="delete-btn" title="Delete" onclick="deleteBook(#variables.books.items.id#)">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <cfif currentPage GT 1>
                            <a href="#application.baseURL#?page=admin-books&currentPage=#currentPage-1#" >Previous</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Previous</a>
                        </cfif>

                        <cfoutput>
                            <!-- Display page numbers -->
                            <cfloop from="1" to="#variables.totalPages#" index="pageNum">
                                <a href="#application.baseURL#?page=admin-books&currentPage=#pageNum#" 
                                <cfif pageNum EQ currentPage>class="active"</cfif>>#pageNum#</a>
                            </cfloop>
                        </cfoutput>

                        <cfif currentPage LT variables.totalPages>
                            <a href="#application.baseURL#?page=admin-books&currentPage=#currentPage+1#">Next</a>
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
