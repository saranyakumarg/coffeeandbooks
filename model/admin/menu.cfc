
<cfcomponent displayname="MenuComponent">

    <!--- get menu list --->
    <cffunction name="getAllMenuItems" access="public" returntype="query">
        <cfargument name="id" type="numeric" required="false">
        <cfset var qryGetAllMenuItems = queryNew('')>
        <cfquery name="qryGetAllMenuItems" datasource="#application.dsn#">
            SELECT id, name, description, price
            FROM menu_items
            <cfif arguments.id GT 0>
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfreturn qryGetAllMenuItems>
    </cffunction>


    <!--- create new menu item --->
    <cffunction name="createMenuItem" access="public" returntype="boolean">
        <cfargument name="id" type="numeric" required="false">
        <cfargument name="name" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="price" type="numeric" required="true">

        <cfset var success = false>
        <cfset arguments.description = ReReplace(Trim(arguments.description), '\s+', ' ', 'ALL')>

        <cfif structKeyExists(arguments, "id") AND arguments.id GT 0>
            <cfquery datasource="#application.dsn#">
                UPDATE menu_items
                SET 
                    name = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                    description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_text">,
                    price = <cfqueryparam value="#arguments.price#" cfsqltype="cf_sql_decimal">
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfset success = true>

        <cfelse>
            <cfquery datasource="#application.dsn#">
                INSERT INTO menu_items (name, description, price)
                VALUES (
                    <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_text">,
                    <cfqueryparam value="#arguments.price#" cfsqltype="cf_sql_decimal">
                )
            </cfquery>

            <cfquery name="queryNewID" datasource="#application.dsn#">
                SELECT LAST_INSERT_ID() AS newID
            </cfquery>

            <cfif queryNewID.recordCount GT 0 AND queryNewID.newID GT 0>
                <cfset success = true>
            </cfif>
        </cfif>

        <cfreturn success>
    </cffunction>
    
</cfcomponent>