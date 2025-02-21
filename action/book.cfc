<cfcomponent displayname="BookComponent">

    <cffunction name="getAllBookItems" access="public" returntype="query">
        <cfquery name="getBooks" datasource="#application.dsn#">
            SELECT name, description, authorName
            FROM books
        </cfquery>
        <cfreturn getBooks>
    </cffunction>
    
</cfcomponent>