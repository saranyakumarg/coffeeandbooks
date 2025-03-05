<cfcomponent displayname="BookComponent">

    <cffunction name="getAllBookItems" access="public" returntype="query">
        <cfset var qryGetAllBookItems = QueryNew('')>
        <cfquery name="qryGetAllBookItems" datasource="#application.dsn#">
            SELECT name, description, authorName, image_file_path
            FROM books
        </cfquery>
        <cfreturn qryGetAllBookItems>
    </cffunction>
    
</cfcomponent>