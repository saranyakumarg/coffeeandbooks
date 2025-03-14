<cfset variables.app = getApplicationSettings()>
<cfif structKeyExists(form, "username") and structKeyExists(form, "password")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
    <cfquery name="getUser" datasource="#variables.app.datasource#">
        SELECT id, username, password, role
        FROM users
        WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif getUser.RecordCount GT 0>
        <cfif getUser.password == "#form.password#">
<!---        <cflogin> 
                <cfloginuser  name="#getUser.username#"  password="#getUser.password#"  roles="#getUser.role#">
            </cflogin>  --->
            <cfset session.loggedInUser = {'userId' = getUser.id,'username' = getUser.username, 'role' = getUser.role }>
            <cfheader statuscode="200" statustext="OK">
            <cfset response = structNew()>
            <cfset response.success = true>
            <cfset response.role = session.loggedInUser.role>
            <cfset jsonResponse = serializeJSON(response)>
            <cfoutput>#jsonResponse#</cfoutput>
        <cfelse>
            <cfheader statuscode="401" statustext="Unauthorized">
        </cfif>
    <cfelse>
        <cfheader statuscode="401" statustext="Unauthorized">
    </cfif>
</cfif>

<cfif structKeyExists(url, "logout") AND url.logout EQ "true">
    <cfset structDelete(session, 'loggedInUser')>
<!---     <cflogout /> --->
    <cfheader statuscode="200" statustext="OK">
</cfif>





