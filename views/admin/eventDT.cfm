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
                        </div>
                    </form>
                    <table id="eventsTable" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody></tbody> <!-- Data will be inserted here dynamically -->
                    </table>
                </div>
            </div>
        </main>
    <cfinclude template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
