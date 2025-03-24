<cfset variables.app = getApplicationSettings()>
<cfsetting enablecfoutputonly="true">
<cfsetting showDebugOutput="false">
<cfset draw = url.draw>
<cfset start = url.start>
<cfset length = url.length>
<cfset searchValue = structKeyExists(url, "search[value]") ? url["search[value]"] : "">
<cfset orderColumnIndex = structKeyExists(url, "order[0][column]") ? url["order[0][column]"] : "0">
<cfset orderDir = structKeyExists(url, "order[0][dir]") ? url["order[0][dir]"] : "asc">

<cfset columnMap = ["id", "name", "description", "startTime"]>
<cfset orderColumn = columnMap[orderColumnIndex + 1]>

<!-- total records -->
<cfset totalRecords = ORMExecuteQuery("SELECT COUNT(e.id) FROM Event e", {}, true)>

<!-- filtered records -->
<cfif len(searchValue)>
    <cfset query = ORMExecuteQuery(
        "SELECT e FROM Event e WHERE e.name LIKE :search OR e.description LIKE :search ORDER BY e.#orderColumn# #orderDir#",
                                    {search: "%" & searchValue & "%"},
                                    {maxResults = length, offset = start})>
        

    <cfset filteredRecords = ORMExecuteQuery(
        "SELECT COUNT(e.id) FROM Event e WHERE e.name LIKE :search OR e.description LIKE :search",
        {search: "%" & searchValue & "%"},
        true
    )>
<cfelse>
    <cfset query = ORMExecuteQuery(
        "SELECT e FROM Event e ORDER BY e.#orderColumn# #orderDir#",
        {},
        {maxResults = length, offset = start}
    )>

    <cfset filteredRecords = totalRecords>
</cfif>

<!--  results to array -->
<cfset data = []>
<cfloop array="#query#" index="event">
    <cfset editAction = "#variables.app.baseURL#?page=create-event&id=#event.getId()#">
    <cfset viewAction = "#variables.app.baseURL#?page=view-event&id=#event.getId()#">
    <cfset actions = '
        <button class="edit-btn" title="View Event" onclick="window.location.href=''#editAction#''">
            <i class="fas fa-eye"></i>
        </button>
        <button class="edit-btn" title="Edit Event" onclick="window.location.href=''#viewAction#''">
            <i class="fas fa-edit"></i>
        </button>
        <button class="delete-btn" title="Delete" onclick="deleteEvent(#event.getId()#)">
            <i class="fas fa-trash-alt"></i>
        </button>
    '>
    <cfset arrayAppend(data, {
        "id": event.getId(),
        "name": event.getName(),
        "description": left(event.getDescription(), 25) & "...",
        "time": dateFormat(event.getStartTime(), "yyyy-mm-dd") & " " & TimeFormat(event.getStartTime(), 'hh:mm tt'),
        "actions": actions
    })>
</cfloop>

<!-- Return JSON response -->
<cfcontent type="application/json">
<cfoutput>#serializeJSON({
    "draw": draw,
    "recordsTotal": totalRecords,
    "recordsFiltered": filteredRecords,
    "data": data
})#</cfoutput>
