
<cfcomponent displayname="MenuComponent">
    <cffunction name="getAllMenuItems" access="public" returntype="query">
        <cfquery name="getMenu" datasource="#application.dsn#">
            SELECT name, description, price, image_file_path
            FROM menu_items
        </cfquery>
        <cfreturn getMenu>
    </cffunction>
    
</cfcomponent>