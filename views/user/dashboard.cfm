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
            <div class="dashboard-wrapper">
                <cfinclude  template="../layout/sidenav.cfm">
                    <div>
                    <h2>Welcome to your dashboard, #uCase(session.loggedInUser.username)#!</h2>
                    <div class="container">
                    <div class="dashboard-box">
                        <a href="##" class="action-button">
                            <div class="label">
                                <h3>Your Recent Purchases</h3>
                                <p>Here is a quick look at the items you have recently purchased.</p>
                            </div>
                            <div class="count">12</div> <!-- Placeholder for menu count -->
                        </a>
                    </div>

                    <div class="dashboard-box">
                        <a href="##" class="action-button">
                            <div class="label">
                                <h3>Your Book Collection</h3>
                                <p>Explore your growing collection of books.</p>
                            </div>
                        </a>
                        <div class="count">8</div> <!-- Placeholder for book count -->
                        

                    </div>

                    <div class="action-section">
                        
                    </div>
                </div>
                </div>
            </div>
        </main>

    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>