<cftry>
    <cfquery name="createUserTable" datasource="#application.dsn#">
        CREATE TABLE users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL,
            role INT NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    </cfquery>

    <cfoutput>User table created successfully.</cfoutput>
<cfcatch>
    <cfoutput>Error creating user table: #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
