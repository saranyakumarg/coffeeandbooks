<cfset variables.app = getApplicationSettings()>
<!--- <cfset variables.app.baseURL = getApplicationSettings().baseURL> --->
<cfoutput>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>#variables.app.pageTitle#</title>
         <link rel="stylesheet" href="#variables.app.baseURL#css/main.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">     <!-- Add Font Awesome for icons -->
    </head>
</cfoutput>