<cfoutput>
    <header>
        <h1>#application.applicationname#</h1>
    </header>
    <!-- Inject variables.app.baseURL into a data attribute (to access in js file)-->
    <div id="appConfig" data-baseurl="#variables.app.baseURL#" <cfif structKeyExists(session, "loggedInUser")> data-role="#session.loggedInUser.role#" </cfif> ></div>
    <nav>
        <a href="#variables.app.baseURL#?page=home">Home</a>
        <a href="#variables.app.baseURL#?page=about">About</a>
        <a href="#variables.app.baseURL#?page=menu">Menu</a>
        <a href="#variables.app.baseURL#?page=books">Books</a>
        <cfif structKeyExists(session, "loggedInUser")>
            <a href="##" id="adminLogoutBtn" class="admin-login" onclick="logout()">Logout</a>
            <!---#session.loggedInUser.role# --->
        <cfelse>
            <a href="##" id="adminLoginBtn" class="admin-login">Login</a>
        </cfif>
    </nav>

<cfinclude  template="login.cfm">
<cfinclude  template="popup.cfm">
</cfoutput>

