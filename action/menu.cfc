
<cfcomponent displayname="MenuComponent">
    <cffunction name="getAllMenuItems" access="public" returntype="query">
        <cfquery name="getMenu" datasource="#application.dsn#">
            SELECT name, description, price
            FROM menu_items
        </cfquery>
        <cfreturn getMenu>
    </cffunction>
    
</cfcomponent>