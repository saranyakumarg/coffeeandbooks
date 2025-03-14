
<cfcomponent displayname="MenuComponent">
    <cfset variables.app = getApplicationSettings()>
    <cffunction name="getAllMenuItems" access="public" returntype="query">
        <cfquery name="getMenu" datasource="#variables.app.datasource#">
            SELECT name, description, price, image_file_path
            FROM menu_items
        </cfquery>
        <cfreturn getMenu>
    </cffunction>
    
</cfcomponent>