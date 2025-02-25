<cfset menu = createObject("component", "#application.baseURL#model.menu")>
<cfset menuItems = menu.getAllMenuItems()>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<body>
    <cfinclude  template="layout/nav.cfm">
    <cfoutput>
        <main>
            <h4>Explore our menu:</h4>
            <ul class="menu-list">
                <cfoutput query="#menuItems#" group="price">
                    <li class="menu-item">
                        <div class="item-header">
                            <cfoutput><strong class="item-name">#menuItems.name#</strong></cfoutput>
                            <span class="item-price">$ #menuItems.price#</span>
                        </div>
                        <p class="item-description">#menuItems.description#</p>
                    </li>
                </cfoutput>
            </ul>

        </main> 
    </cfoutput>
    <cfinclude  template="layout/footer.cfm">
</body>
</html>
