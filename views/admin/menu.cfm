

<cfinclude  template="../../controller/admin/menuAction.cfm">

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
                        <button onclick="window.location.href='#variables.app.baseURL#?page=create-menu'">Add New Menu</button>
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
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="#variables.menuItems.items#">
                                <tr>
                                    <td>#variables.menuItems.items.id#</td>
                                    <td>#variables.menuItems.items.name#</td>
                                    <td>#variables.menuItems.items.description#</td>
                                    <td>$#variables.menuItems.items.price#</td>
                                    <td>
                                        <button class="edit-btn" title="Edit" onclick="window.location.href='#variables.app.baseURL#?page=create-menu&id=#variables.menuItems.items.id#'">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="delete-btn" title="Delete" onclick="deleteMenuItem(#variables.menuItems.items.id#)">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <cfif currentPage GT 1>
                            <a href="#variables.app.baseURL#?page=admin-menu&currentPage=#currentPage-1#" >Previous</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Previous</a>
                        </cfif>

                        <cfoutput>
                            <!-- Display page numbers -->
                            <cfloop from="1" to="#variables.totalPages#" index="pageNum">
                                <a href="#variables.app.baseURL#?page=admin-menu&currentPage=#pageNum#" 
                                <cfif pageNum EQ currentPage>class="active"</cfif>>#pageNum#</a>
                            </cfloop>
                        </cfoutput>

                        <cfif currentPage LT variables.totalPages>
                            <a href="#variables.app.baseURL#?page=admin-menu&currentPage=#currentPage+1#">Next</a>
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
