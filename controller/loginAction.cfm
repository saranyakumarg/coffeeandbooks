<cfset variables.app = getApplicationSettings()>

<cfif structKeyExists(url, "register") AND url.register EQ "true">
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
    
    <cfparam name="form.newUsername" default="">
    <cfparam name="form.newPassword" default="">

    <cfset username = trim(form.newUsername)>
    <cfset password = trim(form.newPassword)>
    <cfset secretKey = variables.app.secretKey>

     <!--- Hash HMAC-SHA256 --->
    <cfset hashedPassword = hmac(password, secretKey, "HmacSHA256")>

    <cfquery name="checkUser" datasource="#variables.app.datasource#">
        SELECT COUNT(*) AS userCount
        FROM users
        WHERE username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif checkUser.userCount EQ 0>
        <cfquery name="registerUser" datasource="#variables.app.datasource#">
            INSERT INTO users (username, password, role)
            VALUES (
                <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="2" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfquery name="getUserId" datasource="#variables.app.datasource#">
            SELECT LAST_INSERT_ID() AS userId
        </cfquery>

        <cfoutput>
            <cfset session.loggedInUser = {'userId' = getUserId.userId,'username' = username, 'role' = 2 }>
            {"status": "success", "message": "Registration successful!"}
        </cfoutput>
    <cfelse>
        <cfoutput>
            {"status": "error", "message": "Username already exists!"}
        </cfoutput>
    </cfif>
</cfif>

<cfif structKeyExists(form, "username") and structKeyExists(form, "password")>
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">
    <cfquery name="getUser" datasource="#variables.app.datasource#">
        SELECT id, username, password, role
        FROM users
        WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif getUser.RecordCount GT 0>
        <cfset secretKey = variables.app.secretKey>
        <cfset hashedInput = hmac(trim(form.password), secretKey, "HmacSHA256")>
        <cfif getUser.password == "#hashedInput#">
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





