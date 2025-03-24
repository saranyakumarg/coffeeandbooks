<cfif structKeyExists(URL, "page")>
    <cfset route = url.page>
<cfelse>
    <cfset route = "home">
</cfif>

<cfset variable.role = 0>
<cfset adminPages = ["dashboard", "admin-menu", "create-menu", "admin-books", "create-book", "files", "books-log", "admin-events"]>
<cfset userPages = ["user-dashboard","user-books"]>
<cfset homePages = ["home", "menu", "books", "events"]>

<cfif structKeyExists(session, "loggedInUser")>
    <cfset variable.role = session.loggedInUser.role>
    <cfif ArrayContains(adminPages, route) AND variable.role EQ 1>
        <cfset route = route>
    <cfelseif ArrayContains(userPages, route) AND variable.role EQ 2>
        <cfset route = route>
    <cfelseif ArrayContains(homePages, route)>
        <cfset route = route>
    <cfelse>        
        <cfset route = "home">
    </cfif>
<cfelse>        
    <cfif ArrayContains(homePages, route)>
        <cfset route = route>
    <cfelse>        
        <cfset route = "home">
    </cfif>
</cfif>

<cfswitch expression="#route#"> 
    <cfcase value="home">
        <cfinclude template="views/index.cfm">
    </cfcase>
    <cfcase value="menu">
        <cfinclude template="views/menu.cfm">
    </cfcase>
    <cfcase value="books">
        <cfinclude template="views/book.cfm">
    </cfcase>
    <cfcase value="events">
        <cfinclude template="controller/admin/eventsAction.cfm">
        <cfinclude template="views/event.cfm">
    </cfcase>
    <cfcase value="dashboard">
        <cfinclude template="views/admin/dashboard.cfm">
    </cfcase>
    <cfcase value="admin-menu">
        <cfinclude template="views/admin/menu.cfm">
    </cfcase>
    <cfcase value="create-menu">
        <cfinclude template="views/admin/createMenu.cfm">
    </cfcase>
    <cfcase value="admin-books">
        <cfinclude template="views/admin/book.cfm">
    </cfcase>
    <cfcase value="admin-events">
<!---         <cfinclude template="views/admin/event.cfm"> --->
        <cfinclude template="views/admin/eventDT.cfm">
    </cfcase>
    <cfcase value="create-book">
        <cfinclude template="views/admin/createBook.cfm">
    </cfcase>
    <cfcase value="files">
        <cfinclude template="views/admin/files.cfm">
    </cfcase>
    <cfcase value="books-log">
        <cfinclude template="views/admin/booksLog.cfm">
    </cfcase>
    <cfcase value="user-dashboard">
        <cfinclude template="views/user/dashboard.cfm">
    </cfcase>
    <cfcase value="user-books">
        <cfinclude template="views/user/book.cfm">
    </cfcase>
    <cfdefaultcase>
        <cfinclude template="views/index.cfm">
    </cfdefaultcase>
</cfswitch>