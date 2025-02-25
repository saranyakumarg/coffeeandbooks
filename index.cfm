<cfif structKeyExists(URL, "page")>
    <cfset route = url.page>
<cfelse>
    <cfset route = "home">
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
    <cfcase value="dashboard">
        <cfinclude template="views/admin/dashboard.cfm">
    </cfcase>
    <cfcase value="admin-menu">
        <cfinclude template="views/admin/menu.cfm">
    </cfcase>
    <cfcase value="create-menu">
        <cfinclude template="views/admin/createMenu.cfm">
    </cfcase>
</cfswitch>