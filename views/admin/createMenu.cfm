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
                    <cfform action="" method="POST" name="createMenuForm" format="html" class="create-menu-form">
                        <div class="form-group">
                            <label for="name">Menu Item Name:</label>
                            <cfinput type="text" id="name" name="name" value="#variable.ename#" required placeholder="Enter menu item name">
                        </div>

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" required placeholder="Enter description of the menu item">
                                <cfif len(variable.singleMenuItem)>
                                    #variable.singleMenuItem.items.description#
                                </cfif>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="price">Price ($):</label>
                            <cfinput type="text" id="price" name="price" step="0.01" min="0" value="#variable.eprice#" required placeholder="Enter price" pattern="^\d+(\.\d{1,2})?$">
                        </div>

                        <div class="form-group">
                            <button type="submit" name="createMenuItem"><cfif len(variable.singleMenuItem)>Update<cfelse>Create</cfif> Menu Item</button>
                        </div>
                    </cfform>
                </div>
            </div>
        </main>
    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
