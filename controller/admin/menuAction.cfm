<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#application.baseURL#index.cfm">
</cfif>

<cfset menu = createObject("component", "#application.baseURL#model.admin.menu")>
<cfset variable.singleMenuItem = []>
<cfset variable.message = "">
<cfset variable.itemID = 0>
<cfif structKeyExists(URL, "id") AND Len(URL.id) GT 0>
    <cfset variable.singleMenuItem = menu.getAllMenuItems(url.id)>
    <cfset variable.itemID = url.id>
</cfif>

<cfif structKeyExists(form, "createMenuItem")>

    <cfif len(variable.itemID)>
        <cfset result = menu.createMenuItem(variable.itemID, form.name, form.description, form.price)>
    <cfelse>
        <cfset result = menu.createMenuItem(form.name, form.description, form.price)>
    </cfif>
    
    <cfif result>
        <cfset variable.message = '<span class = "success-message">Menu item created/updated successfully!</span>' >
        <cfset redirectURL = "#application.baseURL#?page=admin-menu">
        <cflocation url="#redirectURL#">
    <cfelse>
        <cfset variable.message = '<span class = "failure-message">There was an error creating/updating the menu item. Please try again.</span>' >
    </cfif>
</cfif>