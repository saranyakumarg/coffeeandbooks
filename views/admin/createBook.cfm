<cfinclude  template="../../controller/admin/booksAction.cfm">

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
                    <h3>Add New Book</h3>
                    #variable.message#
                    <cfif len(variable.singleBook) && len(variable.singleBook.items.image_file_path)>
                        <img src="#application.baseUrl&variable.singleBook.items.image_file_path#" class="small-image">
                    </cfif>

                    <cfform action="" method="POST" id="createBookForm" name="createBookForm" format="html" class="create-menu-form" enctype = "multipart/form-data">
                        <div class="form-group">
                            <label for="name">Book Name:</label>
                            <cfinput type="text" id="name" name="name" value="#variable.ename#" required placeholder="Enter menu item name">
                        </div>

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" required placeholder="Enter description of the menu item">
                                <cfif len(variable.singleBook)>
                                    #variable.singleBook.items.description#
                                </cfif>
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label for="price">Author:</label>
                            <cfinput type="text" id="author" name="author" value="#variable.eauthor#" required placeholder="Enter author name">
                        </div>

                        <div class="form-group">
                            <label for="image">Book Image:</label>
                            <cfinput type="file" id="imageContent" name="imageContent" accept="image/*">
                        </div>

                        <div class="form-group">
                            <button type="submit" id="createBook" name="createBook"><cfif len(variable.singleBook)>Update<cfelse>Add</cfif> Book </button>
                        </div>
                    </cfform>
                </div>
            </div>
        </main>
    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
