<cfset variables.app = getApplicationSettings()>
<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#variables.app.baseURL#index.cfm">
</cfif>

<cfif structKeyExists(URL, "page") AND URL.page == 'create-menu' >

    <!--- Menu create and edit  --->
    <cfset menu = createObject("component", "#variables.app.baseURL#model.admin.menu")>
    <cfset variable.singleMenuItem = []>
    <cfset variable.message = "">
    <cfset variable.itemID = 0>
    <cfset variable.ename ="">
    <cfset variable.edescription = "">
    <cfset variable.eprice = 0>
    <cfset variable.eimage_file_path = "">
    <cfif structKeyExists(URL, "id") AND Len(URL.id) GT 0>
        <cfset variable.singleMenuItem = menu.getAllMenuItems(url.id)>
        <cfset variable.itemID = url.id>
        <cfset variable.ename = variable.singleMenuItem.items.name>
        <cfset variable.edescription = variable.singleMenuItem.items.description>
        <cfset variable.eprice = variable.singleMenuItem.items.price>
        <cfset variable.eimage_file_path = variable.singleMenuItem.items.image_file_path>
    </cfif>

    <cfif structKeyExists(form, "createMenuItem")>
        <cfset variable.imagePath = "">
        <cfif isDefined("Form.imageContent") AND len(Form.imageContent)>
            <cfset variable.saveDir = expandPath("uploads/")>
            <cffile action = "upload" fileField = "Form.imageContent" destination = "#variable.saveDir#" accept = "image/*" nameConflict = "MakeUnique">
            <cfset variable.imageName = cffile.serverFile>
            <cfset variable.imagePath = 'uploads/' & variable.imageName>
        </cfif>
        <cfif len(variable.itemID) AND variable.itemID GT 0>
            <cfset result = menu.createMenuItem(variable.itemID, form.name, form.description, form.price, variable.imagePath)>
        <cfelse>
            <cfset result = menu.createMenuItem(variable.itemID, form.name, form.description, form.price, variable.imagePath)>
        </cfif>
        
        <cfif result>
            <cfset variable.message = '<span class = "success-message">Menu item created/updated successfully!</span>' >
            <cfset redirectURL = "#variables.app.baseURL#?page=admin-menu">
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
            <cfset variables.menu = createObject("component", "#variables.app.baseURL#model.admin.menu")>
            <cfset variables.menuItem = variables.menu.deleteMenuItem(itemId=menuItemId)>
            <cfoutput>success</cfoutput>
    </cfif>
    <!--- Menu list page pagination  --->
    <cfset variables.currentPage = 1>
    <cfif structKeyExists(URL, "currentpage") >
        <cfset variables.currentPage = url.currentpage>
    </cfif>
    <cfset variables.pageSize = 5>
    <cfset variables.menu = createObject("component", "#variables.app.baseURL#model.admin.menu")>
    <cfset variables.menuItems = variables.menu.getAllMenuItems(page=variables.currentPage, pageSize=variables.pageSize)>
    <cfset variables.totalPages = ceiling(variables.menuItems.totalcount / variables.pageSize)>
</cfif>

