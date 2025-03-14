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
                    <cfif len(variable.singleMenuItem) && len(variable.singleMenuItem.items.image_file_path)>
                        <img src="#variables.app.baseURL&variable.singleMenuItem.items.image_file_path#" class="small-image">
                    </cfif>

                    <cfform action="" method="POST" id="createMenuForm" name="createMenuForm" format="html" class="create-menu-form" enctype = "multipart/form-data">
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
                            <label for="image">Menu Item Image:</label>
                            <cfinput type="file" id="imageContent" name="imageContent" accept="image/*">
                        </div>

                        <div class="form-group">
                            <button type="submit" id="createMenuItem" name="createMenuItem"><cfif len(variable.singleMenuItem)>Update<cfelse>Add</cfif> Menu Item</button>
                        </div>
                    </cfform>
                </div>
            </div>
        </main>
    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
