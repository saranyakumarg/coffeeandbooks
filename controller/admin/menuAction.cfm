<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#application.baseURL#index.cfm">
</cfif>

<cfif structKeyExists(URL, "page") AND URL.page == 'create-menu' >

    <!--- Menu create and edit  --->
    <cfset menu = createObject("component", "#application.baseURL#model.admin.menu")>
    <cfset variable.singleMenuItem = []>
    <cfset variable.message = "">
    <cfset variable.itemID = 0>
    <cfset variable.ename ="">
    <cfset variable.edescription = "">
    <cfset variable.eprice = 0>
    <cfif structKeyExists(URL, "id") AND Len(URL.id) GT 0>
        <cfset variable.singleMenuItem = menu.getAllMenuItems(url.id)>
        <cfset variable.itemID = url.id>
        <cfset variable.ename = variable.singleMenuItem.items.name>
        <cfset variable.edescription = variable.singleMenuItem.items.description>
        <cfset variable.eprice = variable.singleMenuItem.items.price>
    </cfif>

    <cfif structKeyExists(form, "createMenuItem")>
        <cfif len(variable.itemID) AND variable.itemID GT 0>
            <cfset result = menu.createMenuItem(variable.itemID, form.name, form.description, form.price)>
        <cfelse>
            <cfset result = menu.createMenuItem(variable.itemID, form.name, form.description, form.price)>
        </cfif>
        
        <cfif result>
            <cfset variable.message = '<span class = "success-message">Menu item created/updated successfully!</span>' >
            <cfset redirectURL = "#application.baseURL#?page=admin-menu">
            <cflocation url="#redirectURL#">
        <cfelse>
            <cfset variable.message = '<span class = "failure-message">There was an error creating/updating the menu item. Please try again.</span>' >
        </cfif>
    </cfif>
<cfelse>
    <!--- Menu delete  --->
    <cfsetting enablecfoutputonly="true" />
    <cfsetting showDebugOutput="false">

    <cfif structKeyExists( URL, "action") AND URL.action == 'delete'>   
        <cfset menuItemId = form.id>
            <cfset variables.menu = createObject("component", "#application.baseURL#model.admin.menu")>
            <cfset variables.menuItem = variables.menu.deleteMenuItem(itemId=menuItemId)>
            <cfoutput>success</cfoutput>
    </cfif>
    <!--- Menu list page pagination  --->
    <cfset variables.currentPage = 1>
    <cfif structKeyExists(URL, "currentpage") >
        <cfset variables.currentPage = url.currentpage>
    </cfif>
    <cfset variables.pageSize = 5>
    <cfset variables.menu = createObject("component", "#application.baseURL#model.admin.menu")>
    <cfset variables.menuItems = variables.menu.getAllMenuItems(page=variables.currentPage, pageSize=variables.pageSize)>
    <cfset variables.totalPages = ceiling(variables.menuItems.totalcount / variables.pageSize)>
</cfif>

