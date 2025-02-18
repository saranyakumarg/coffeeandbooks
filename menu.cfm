<cfset menu = createObject("component", "controller.menu")>
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
                <cfloop array="#menuItems#" index="item">
                    <li class="menu-item">
                        <div class="item-header">
                            <strong class="item-name">#item.name#</strong>
                            <span class="item-price">$ #item.price#</span>
                        </div>
                        <p class="item-description">#item.description#</p>
                    </li>
                </cfloop>
            </ul>

        </main> 
    </cfoutput>
    <cfinclude  template="layout/footer.cfm">
</body>
</html>
