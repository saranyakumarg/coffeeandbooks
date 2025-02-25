<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#application.baseURL#index.cfm">
</cfif>

<cfset menu = createObject("component", "#application.baseURL#model.admin.menu")>
<cfset menuItems = menu.getAllMenuItems()>
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
                        <button onclick="window.location.href='#application.baseURL#?page=create-menu'">Create New Menu</button>
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
                            <cfoutput query="#menuItems#">
                                <tr>
                                    <td>#menuItems.id#</td>
                                    <td>#menuItems.name#</td>
                                    <td>#menuItems.description#</td>
                                    <td>$#menuItems.price#</td>
                                    <td>
                                        <button class="edit-btn" title="Edit" onclick="window.location.href='#application.baseURL#?page=create-menu&id=#menuItems.id#'">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="delete-btn" title="Delete" onclick="deleteItem()">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
