<cfoutput>
    <nav class="sidebar-nav">
        <cfif structKeyExists(session, "loggedInUser") AND session.loggedInUser.role == 1>
            <a href="#variables.app.baseURL#?page=dashboard">Dashboard</a>
            <a href="#variables.app.baseURL#?page=admin-menu">Manage Menu</a>
            <a href="#variables.app.baseURL#?page=admin-books">Manage Books</a>
            <a href="#variables.app.baseURL#?page=files">Manage Files</a>
            <a href="admin-settings.cfm">Settings</a>  
        <cfelseif structKeyExists(session, "loggedInUser") AND session.loggedInUser.role == 2>
            <a href="#variables.app.baseURL#?page=user-dashboard">Dashboard</a>
            <a href="#variables.app.baseURL#?page=user-books">Your Books</a>
            <a href="#variables.app.baseURL#">Your purchases</a>
            <a href="admin-settings.cfm">Settings</a>  
        </cfif>
    </nav>
</cfoutput>
