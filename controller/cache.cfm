<cfcomponent>
    <cffunction name="getPopularBooks" access="public" returnType="query">
        <cfscript>
            // Check if cache exists
            cachedData = cacheGet("popularBooks");
            
            if (!isNull(cachedData)) {
                return cachedData; // Return cached data if available
            }
            
            // Run the database query if cache is empty
            result = queryExecute(
                "SELECT * FROM books WHERE popularity > 100",
                [],
                {datasource=""}
            );
            
            // Store in cache for 30 minutes
            cachePut("popularBooks", result, createTimeSpan(0,0,30,0));

            return result;
        </cfscript>
    </cffunction>
    <cfscript>
        queryExecute(
            "INSERT INTO books (title, author) VALUES (?, ?)",
            ["New Book", "Author Name"],
            {datasource="myDSN"}
        );

        // Clear cache after inserting a new book
        cacheRemove("popularBooks");
    </cfscript>

</cfcomponent>
