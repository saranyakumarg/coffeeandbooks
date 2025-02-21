<cfoutput>
    <header>
        <h1>#application.name#</h1>
    </header>

    <nav>
        <a href="index.cfm">Home</a>
        <a href="about.cfm">About</a>
        <a href="menu.cfm">Menu</a>
        <a href="book.cfm">Books</a>
        <cfif structKeyExists(session, "loggedInUser")>
            <a href="##" id="adminLogoutBtn" class="admin-login" onclick="logout()">Logout</a>
            <!---#session.loggedInUser.role# --->
        <cfelse>
            <a href="##" id="adminLoginBtn" class="admin-login">Admin Login</a>
        </cfif>
    </nav>

<cfinclude  template="login.cfm">
<script src="js/main.js"></script>
</cfoutput>

