<cfset application.name = "Coffee & Books">
<cfset application.year = Year(Now())>
<cfset application.pageTitle = "Welcome to Coffee & Books">
<cfset application.dsn = "coffeeandbooks_dsn">
<cfset application.sessionManagement = "yes">
<cfset application.sessionTimeout = createTimespan(0, 0, 10, 0)>
<cfset application.baseUrl = "/projects/coffeeandbooks/">
<cfsetting enableCFoutputOnly = "yes" showDebugOutput = "yes" >