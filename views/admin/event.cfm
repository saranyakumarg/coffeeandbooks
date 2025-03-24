<cfinclude template="../../controller/admin/eventsAction.cfm">

<!DOCTYPE html>
<html lang="en">
<cfinclude template="../layout/header.cfm">
<body>
    <cfoutput>
    <cfinclude template="../layout/nav.cfm">
        <main>
            <div class="dashboard-wrapper">
                <cfinclude template="../layout/sidenav.cfm">
                <div class="dashboard-content">
                    <form method="get" action="#variables.app.baseURL#">
                        <div class="create-menu-btn">
                            <button onclick="window.location.href='#variables.app.baseURL#?page=events-log'">User logs</button>
                            <button onclick="window.location.href='#variables.app.baseURL#?page=create-event'">Add New Event</button>
                            <input type="hidden" name="page" value="admin-events">
                            <input type="text" name="searchQuery" id="searchQuery" class="search-bar" placeholder="Search for events..." <cfif structKeyExists(URL, "searchQuery")>value="<cfoutput>#urlEncodedFormat(trim(URL.searchQuery & ""))#</cfoutput>"</cfif>>
                            <button type="submit">Search</button>
                        </div>
                    </form>
                    <table class="menu-items-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="eventsTableBody">
<!---                         <cfdump  var="#variables.allEvents#" abort> --->
                            <cfloop array="#variables.allEvents#" index="event">
                                <tr>
                                    <td>#event.getId()#</td>
                                    <td>#event.getName()#</td>
                                    <td>#left(event.getDescription(), 25)#...</td>
                                    <td>#dateFormat(event.getStartTime(), "yyyy-mm-dd") & " " & TimeFormat(event.getStartTime(), 'hh:mm tt') & " - " & TimeFormat(event.getEndTime(), 'hh:mm tt')#</td>
                                    <td>
                                        <button class="edit-btn" title="Edit" onclick="window.location.href='#variables.app.baseURL#?page=create-event&id=#event.getId()#'">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="edit-btn" title="Edit" onclick="window.location.href='#variables.app.baseURL#?page=create-event&id=#event.getId()#'">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="delete-btn" title="Delete" onclick="deleteEvent(#event.getId()#)">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>

                    <!-- Pagination -->
                    <div class="pagination">
                        <!-- Previous Button -->
                        <cfif variables.currentPage GT 1>
                            <a href="#variables.app.baseURL#?page=admin-events&currentPage=#variables.currentPage-1#&searchQuery=#urlEncodedFormat(variables.searchQuery)#">Previous</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Previous</a>
                        </cfif>

                        <!-- Page Numbers -->
                        <cfloop from="1" to="#variables.totalPages#" index="pageNum">
                            <a href="#variables.app.baseURL#?page=admin-events&currentPage=#pageNum#&searchQuery=#urlEncodedFormat(variables.searchQuery)#"
                                <cfif pageNum EQ variables.currentPage>class="active"</cfif>>#pageNum#</a>
                        </cfloop>

                        <!-- Next Button -->
                        <cfif variables.currentPage LT variables.totalPages>
                            <a href="#variables.app.baseURL#?page=admin-events&currentPage=#variables.currentPage+1#&searchQuery=#urlEncodedFormat(variables.searchQuery)#">Next</a>
                        <cfelse>
                            <a href="javascript:void(0);" style="pointer-events: none; color: gray;">Next</a>
                        </cfif>
                    </div>

                </div>
            </div>
        </main>
    <cfinclude template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
