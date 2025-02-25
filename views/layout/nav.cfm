<cfoutput>
    <header>
        <h1>#application.name#</h1>
    </header>
    <!-- Inject application.baseURL into a data attribute (to access in js file)-->
    <div id="appConfig" data-baseurl="#application.baseURL#"></div>
    <nav>
        <a href="#application.baseURL#?page=home">Home</a>
        <a href="#application.baseURL#?page=about">About</a>
        <a href="#application.baseURL#?page=menu">Menu</a>
        <a href="#application.baseURL#?page=books">Books</a>
        <cfif structKeyExists(session, "loggedInUser")>
            <a href="##" id="adminLogoutBtn" class="admin-login" onclick="logout()">Logout</a>
            <!---#session.loggedInUser.role# --->
        <cfelse>
            <a href="##" id="adminLoginBtn" class="admin-login">Admin Login</a>
        </cfif>
    </nav>

<cfinclude  template="login.cfm">
<script src="#application.baseURL#js/main.js"></script>
</cfoutput>

