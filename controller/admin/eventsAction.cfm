<!--- <cfdump  var="#url.searchQuery#"> --->
<cfscript>

    if (structKeyExists(URL, "action") && URL.action == "create") {
        newEvent = entityNew("Event");
        newEvent.setName("ColdFusion Conference 2");
        newEvent.setStartTime(now());
        newEvent.setEndTime(dateAdd("h", 2, now())); // 2 hours after start
        newEvent.setDescription("A conference about ColdFusion and Lucee.");
        newEvent.setPhoto("uploads/wandp_.jpg");
        newEvent.setCreatedAt(now());

        entitySave(newEvent);
        writeOutput("Event created successfully!");
    }
    if (structKeyExists(URL, "id")) {
        event = entityLoadByPK("Event", URL.id); // Load event by ID

        if (!isNull(event)) {
            writeOutput("Event Name: " & event.getName());
        } else {
            writeOutput("Event not found.");
        }
    }

    if (structKeyExists(URL, "action") && URL.action == "update") {
        event = entityLoadByPK("Event", URL.id);

        if (!isNull(event)) {
            event.setName("Updated Event Name");
            event.setDescription("This is an updated description.");
            event.setStartTime(now());
            event.setEndTime(dateAdd("h", 2, now()));

            entitySave(event);
            writeOutput("Event updated successfully!");
        } else {
            writeOutput("Event not found.");
        }
    }
    if((structKeyExists(URL, "page") && URL.page == "admin-events") || (structKeyExists(URL, "searchQuery"))) {

        variables.currentPage = ( structKeyExists(URL, "currentpage") && isNumeric(URL.currentpage) ) ? URL.currentpage : 1;
        variables.pageSize = 2;
        variables.offset = (variables.currentPage - 1) * variables.pageSize;
        variables.searchQuery = ( structKeyExists(URL, "searchQuery") ) ? trim(URL.searchQuery) : "";

        /* entityLoad() doesn't support like for search so choosing ormExecuteQuery  for search*/
        if(!isNull(variables.searchQuery)) {
            variables.allEvents = ORMExecuteQuery(
                                    "SELECT e FROM Event e WHERE e.name LIKE :search OR e.description LIKE :search ORDER BY e.id DESC",
                                    {search: "%" & variables.searchQuery & "%"},
                                    {maxResults = variables.pageSize, offset = variables.offset});
            variables.totalRecords = ORMExecuteQuery(
                                        "SELECT COUNT(e.id) FROM Event e WHERE e.name LIKE :search OR e.description LIKE :search",
                                        {search: "%" & variables.searchQuery & "%"},
                                        true);
        } else {
            variables.allEvents = entityLoad("Event", {name='Book Swap Meetup'},{maxResults = variables.pageSize, offset = variables.offset});
            variables.totalRecords = ormExecuteQuery("select count(id) from Event",true);
        }
        // writeDump(#variables.allEvents#);abort;
        totalPages = ceiling(variables.totalRecords / variables.pageSize);
    }

    if(structKeyExists(URL, "page") && URL.page == "events") {
        variables.allEvents = entityLoad("Event");
    }
</cfscript>
