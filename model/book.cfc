<cfcomponent displayname="BookComponent">
    <cfset variables.app = getApplicationSettings()>
    <cffunction name="getAllBookItems" access="public" returntype="query">
        <cfset var qryGetAllBookItems = QueryNew('')>
        <cfquery name="qryGetAllBookItems" datasource="#variables.app.datasource#">
            SELECT id, name, description, authorName, image_file_path, shelf_quantity
            FROM books
        </cfquery>
        <cfreturn qryGetAllBookItems>
    </cffunction>

    <cffunction name="confirmBook" access="public" returntype="boolean">
        <cfargument name="bookId" type="numeric" required="true">
        <cfargument name="userId" type="numeric" required="true">
        <cfset var success = false>
        <cfquery datasource="#variables.app.datasource#">
                INSERT INTO user_books (user_id, book_id, booked_date)
                VALUES (
                    <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#arguments.bookId#" cfsqltype="cf_sql_integer">,
                    NOW()
                )
            </cfquery>

            <cfquery name="queryNewID" datasource="#variables.app.datasource#">
                SELECT LAST_INSERT_ID() AS newID
            </cfquery>
            <cfquery name="qryupdatesq" datasource="#variables.app.datasource#" result="qryResult">
                UPDATE books
                SET shelf_quantity = CASE 
                                        WHEN shelf_quantity > 0 THEN shelf_quantity - 1 
                                        ELSE 0 
                                    END
                WHERE id = <cfqueryparam value="#arguments.bookId#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfif queryNewID.recordCount GT 0 AND queryNewID.newID GT 0>
                <cfset success = true>
            </cfif>
            <cfreturn success>
    </cffunction>

    <!--- get book list --->
    <cffunction name="getUserBooks" access="public" returntype="struct">
        <cfargument name="userId" type="numeric" required="false" default="0">
        <cfargument name="page" type="numeric" required="true" default="1">
        <cfargument name="pageSize" type="numeric" required="true" default="10">

        <cfset var qryTotalCount = queryNew("")>
        <cfset var qryGetUserBooks = queryNew("")>
        <cfset var variable.result = {}>

        <cfset var variable.page = IIf(arguments.page, arguments.page, 1)>
        <cfset var offset = (arguments.page - 1) * arguments.pageSize>
        <cfset var totalCount = 0>

        <cfquery name="qryTotalCount" datasource="#variables.app.datasource#">
            SELECT COUNT(*) AS total_count
            FROM user_books
            <cfif arguments.userId>
                WHERE user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfset totalCount = qryTotalCount.total_count>
        <cfset variable.result.totalCount = totalCount>

        <cfquery name="qryGetUserBooks" datasource="#variables.app.datasource#">
            SELECT 
                ub.id AS user_book_id,
                ub.user_id,
                ub.book_id,
                ub.booked_date,
                ub.borrowed_date,
                ub.review,
                ub.review_date,
                ub.book_returned_date,
                b.name AS book_name,
                b.description AS book_description,
                b.authorName,
                b.image_file_path,
                u.username
            FROM user_books ub
            INNER JOIN books b ON ub.book_id = b.id
            INNER JOIN users u ON ub.user_id = u.id
            <cfif arguments.userId>
                WHERE ub.user_id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
            </cfif>
            ORDER BY ub.booked_date DESC
            LIMIT <cfqueryparam value="#arguments.pageSize#" cfsqltype="cf_sql_integer">
            OFFSET <cfqueryparam value="#offset#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfset variable.result.items = qryGetUserBooks>
        <cfreturn variable.result>
    </cffunction>

    
</cfcomponent>