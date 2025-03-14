
<cfcomponent displayname="MenuComponent">
    <cfset variables.app = getApplicationSettings()>
    <!--- get book list --->
    <cffunction name="getAllBooks" access="public" returntype="struct">
        <cfargument name="id" type="numeric" required="false">
        <cfargument name="page" type="numeric" required="true" default="1">
        <cfargument name="pageSize" type="numeric" required="true" default="10">
        <cfset var qryTotalCount = queryNew('')>
        <cfset var qryGetAllbooks = queryNew('')>
        <cfset variable.result = {}>
        <cfset var variable.page = IIf(arguments.page, arguments.page, 1)>

        <cfset var offset = (arguments.page - 1) * arguments.pageSize>
        <cfset var totalCount = 0>
        <cfquery name="qryTotalCount" datasource="#variables.app.datasource#">
            SELECT COUNT(*) as total_count
            FROM books
        </cfquery>
        <cfset totalCount = qryTotalCount.total_count>
        <cfset variable.result.totalCount = totalCount>
        <cfquery name="qryGetAllbooks" datasource="#variables.app.datasource#">
            SELECT id, name, description, authorName, image_file_path
            FROM books
            <cfif arguments.id GT 0>
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfif>
            ORDER BY id
            LIMIT <cfqueryparam value="#arguments.pageSize#" cfsqltype="cf_sql_integer">
            OFFSET <cfqueryparam value="#offset#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset variable.result.items = qryGetAllbooks>
        <cfreturn  variable.result>
    </cffunction>


    <!--- create new/update book --->
    <cffunction name="createBook" access="public" returntype="boolean">
        <cfargument name="id" type="numeric" required="false">
        <cfargument name="name" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="author" type="string" required="true">
        <cfargument name="imagePath" type="string" required="false">

        <cfset var success = false>
        <cfset arguments.description = ReReplace(Trim(arguments.description), '\s+', ' ', 'ALL')>

        <cfif structKeyExists(arguments, "id") AND arguments.id GT 0>
            <cfquery datasource="#variables.app.datasource#">
                UPDATE books
                SET 
                    name = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                    description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_text">,
                    authorName = <cfqueryparam value="#arguments.author#" cfsqltype="cf_sql_varchar">
                    <cfif len(arguments.imagePath)>, image_file_path = <cfqueryparam value="#arguments.imagePath#" cfsqltype="cf_sql_text"></cfif>
                WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfset success = true>

        <cfelse>
            <cfquery datasource="#variables.app.datasource#">
                INSERT INTO books (name, description, authorName,shelf_quantity <cfif len(arguments.imagePath)>, image_file_path</cfif>)
                VALUES (
                    <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_text">,
                    <cfqueryparam value="#arguments.author#" cfsqltype="cf_sql_varchar">,0
                    <cfif len(arguments.imagePath)>, <cfqueryparam value="#arguments.imagePath#" cfsqltype="cf_sql_text"></cfif>
                )
            </cfquery>

            <cfquery name="queryNewID" datasource="#variables.app.datasource#">
                SELECT LAST_INSERT_ID() AS newID
            </cfquery>

            <cfif queryNewID.recordCount GT 0 AND queryNewID.newID GT 0>
                <cfset success = true>
            </cfif>
        </cfif>

        <cfreturn success>
    </cffunction>

   <!--- delete book --->
    <cffunction name="deleteMenuItem" access="public" returntype="boolean">
        <cfargument name="bookId" type="numeric" required="true">
        
        <cfset var success = false>

        <!--- Perform the delete operation --->
        <cfquery name="qryDeleteItem" datasource="#variables.app.datasource#">
            DELETE FROM books
            WHERE id = <cfqueryparam value="#arguments.bookId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn success>
    </cffunction>

   <!--- confirm borrow --->
    <cffunction name="confirmBorrow" access="public" returntype="boolean">
        <cfargument name="userBookId" type="numeric" required="true">
        <cfset var success = false>
        
        <cfquery name="qryConfirmBorrow" datasource="#variables.app.datasource#" result="qryResult">
            UPDATE user_books
            SET borrowed_date = NOW()
            WHERE id = <cfqueryparam value="#arguments.userBookId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif qryResult.recordCount GT 0>
            <cfset success = true>
        </cfif>

        <cfreturn success>
    </cffunction>

    
</cfcomponent>