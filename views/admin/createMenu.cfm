<cfinclude  template="../../controller/admin/menuAction.cfm">

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../layout/header.cfm">
<body>
    <cfoutput>
    <cfinclude  template="../layout/nav.cfm">
        <main>
            <div class="dashboard-wrapper">
                <cfinclude  template="../layout/sidenav.cfm">
                <div class="dashboard-content">
                    <h3>Create New Menu Item</h3>
                    #variable.message#
                    <form action="" method="POST" class="create-menu-form">
                        <div class="form-group">
                            <label for="name">Menu Item Name:</label>
                            <input type="text" id="name" name="name" 
                                <cfif len(variable.singleMenuItem)>value="#variable.singleMenuItem.name#"<cfelse>value=""</cfif>  
                                required placeholder="Enter menu item name">
                        </div>

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" required placeholder="Enter description of the menu item">
                                <cfif len(variable.singleMenuItem)>
                                    #variable.singleMenuItem.description#
                                </cfif>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="price">Price ($):</label>
                            <input type="number" id="price" name="price" step="0.01" min="0" 
                                <cfif len(variable.singleMenuItem)>value="#variable.singleMenuItem.price#"<cfelse>value=""</cfif>
                                required placeholder="Enter price">
                        </div>

                        <div class="form-group">
                            <button type="submit" name="createMenuItem"><cfif len(variable.singleMenuItem)>Update<cfelse>Create</cfif> Menu Item</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
