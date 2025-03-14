<!--- <cfif NOT structKeyExists(session, "loggedInUser") OR session.loggedIn EQ false OR session.userRole NEQ "admin"> --->
<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#variables.app.baseURL#index.cfm">
</cfif>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../layout/header.cfm">
<body>
    <cfoutput>
    <cfinclude  template="../layout/nav.cfm">
        <main>
            <!-- Admin Dashboard -->
            <div class="dashboard-wrapper">
                    <cfinclude  template="../layout/sidenav.cfm">

                <!-- Dashboard Content -->
                <div class="dashboard-content">
                    <h2>Admin Dashboard</h2>

                    <!-- Info Boxes for Menu and Books -->
                    <div class="dashboard-info">
                        <div class="info-box">
                            <h3>Menu Items</h3>
                            <p id="menuCount">12</p> <!-- Placeholder for menu count -->
                        </div>
                        <div class="info-box">
                            <h3>Books</h3>
                            <p id="bookCount">8</p> <!-- Placeholder for book count -->
                        </div>
                    </div>
                </div>
            </div>
        </main>

    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
