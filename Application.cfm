<cfset application.name = "Coffee & Books">
<cfset application.year = Year(Now())> <!-- Get the current year -->
<cfset application.pageTitle = "Welcome to Coffee & Books">
<cfset application.dsn = "coffeeandbooks_dsn">
<cfset application.sessionManagement = "yes">
<cfset application.sessionTimeout = createTimespan(0, 0, 10, 0)>
<cfsetting enableCFoutputOnly = "yes" showDebugOutput = "yes" >