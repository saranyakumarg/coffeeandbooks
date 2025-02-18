
<cfcomponent displayname="BookComponent">
    <cfset variables.bookItems = [
        {name="To Kill a Mockingbird", description="A classic novel about race and justice in the Deep South.", authorName="Harper Lee"},
        {name="1984", description="A dystopian novel set in a totalitarian society under constant surveillance.", authorName="George Orwell"},
        {name="The Great Gatsby", description="A novel about the American dream and the disillusionment of the Jazz Age.", authorName="F. Scott Fitzgerald"},
        {name="Pride and Prejudice", description="A romantic novel that explores the themes of love and marriage in the English countryside.", authorName="Jane Austen"}
    ]>

    <cffunction name="getAllBookItems" access="public" returntype="array">
        <cfreturn variables.bookItems>
    </cffunction>
    
</cfcomponent>