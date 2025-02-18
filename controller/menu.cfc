
<cfcomponent displayname="MenuComponent">
    <cfset variables.menuItems = [
        {name="Espresso", description="Strong black coffee", price="3.00"},
        {name="Cappuccino", description="Espresso with steamed milk and foam", price="3.50"},
        {name="Latte", description="Espresso with steamed milk", price="3.75"},
        {name="Mocha", description="Espresso with chocolate and steamed milk", price="4.00"},
        {name="Americano", description="Espresso with hot water", price="2.75"}
    ]>

    <cffunction name="getAllMenuItems" access="public" returntype="array">
        <cfreturn variables.menuItems>
    </cffunction>
    
</cfcomponent>