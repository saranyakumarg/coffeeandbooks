 <cfoutput>
    <footer>
        <p>&copy; #variables.app.year & " " & application.applicationname# All rights reserved.</p>
    </footer>
    <script src="#variables.app.baseURL#js/main.js"></script>
    <cfif structKeyExists(session, "loggedInUser") AND session.loggedInUser.role == 2>
        <script src="#variables.app.baseURL#js/user.js"></script>
    <cfelseif structKeyExists(session, "loggedInUser") AND session.loggedInUser.role == 1>
        <script src="#variables.app.baseURL#js/admin.js"></script>
    </cfif>
</cfoutput>
