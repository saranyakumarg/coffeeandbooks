
component{
    this.name = "Coffee & Books";
    this.year = Year(Now());
    this.sessionManagement = "yes";
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
    this.datasource = "coffeeandbooks_dsn";
    this.pageTitle = "Welcome to Coffee & Books";
    this.datasource = "coffeeandbooks_dsn";
    this.sessionTimeout = createTimespan(0, 0, 10, 0);
    this.baseUrl = "/projects/coffeeandbooks/";
    this.showDebugOutput = "yes";

    function onApplicationStart(){
        this.pageTitle = "Welcome to Coffee & Books";
        this.datasource = "coffeeandbooks_dsn";
        
        this.sessionTimeout = createTimespan(0, 0, 10, 0);
        this.baseUrl = "/projects/coffeeandbooks/";
    }
    function onRequestStart(targetPage){
        return true;
    }

}
<!--- <cfsetting enableCFoutputOnly = "yes" showDebugOutput = "yes"> --->
