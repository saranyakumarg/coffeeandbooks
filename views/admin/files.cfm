<!--- <cfif NOT structKeyExists(session, "loggedInUser") OR session.loggedIn EQ false OR session.userRole NEQ "admin"> --->
<cfif NOT structKeyExists(session, "loggedInUser")>
    <cflocation url="#application.baseURL#index.cfm">
</cfif>

<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../layout/header.cfm">
<body>
    <cfoutput>
    <cfinclude  template="../layout/nav.cfm">
        <main>
            <!-- Admin Dashboard -->
            <div class="dashboard-wrapper">
                    <cfinclude  template="../layout/sidenav.cfm">

                <div class="dashboard-content">
                    <h2>File Management</h2>
                    <!---    File management                  --->
                    <cfset variable.uploadDirectory = #application.baseUrl#&'uploads/filesDirectory'>
                    <cfset filename = variable.uploadDirectory&'/write_file.txt'>
                    <cfif not directoryExists(variable.uploadDirectory)>
                        <cfdirectory action="create" directory="#variable.uploadDirectory#">
                    </cfif>
                    <cftry>
                        <cffile action="write" file="#filename#">
                            <!---some tag body (html,csv,..)--->
                            - The tag syntax depends on the action attribute value
                            - action="write"
                            - action="append"  file = "full pathname" output = "string" addNewLine = "yes|no" attributes = "file attributes list" charset = "characterset option" fixnewline = "yes|no" mode = "mode"
                            - For cffile action = "append" and cffile action = "write", you can provide file content in the tag body. 
                            - If you provide file content in both the tag body and the output attribute, it results in an error.
                            - action = "copy" destination = "full pathname" source = "full pathname" attributes = "file attributes list" mode = "mode" (Copies a file from one directory to another on the server.)
                            - action = "move"  destination = "full pathname"  source = "full pathname"  attributes = "file attributes list"  charset = "character set option"  mode = "mode"
                            - action="delete" file="uploads/filesDirectory/write_file.txt"
                            - action="UPLOAD" accept=".txt, application/pdf" strict=true (IF STRICT TRUE MIME TYPE IS CONSIDERED, IF EXTENSION CHANGED WILL NOT WORK)
                            - action="uploadAll"
                            - action="rename"
                            - action = "readBinary" (convert file to binary object like image (coversion of large file may bring the server down))
                        </cffile>
                        <cfset content = FileRead(filename)> <!--- OR <cffile action="Read" file="#filename#" variable="content"> --->
                        <cfoutput>#content#</cfoutput>
                        <cfoutput>File Length = #Len(content)# <br></cfoutput>
                        <cfcatch type="any">
                            <cfoutput>#cfcatch.message#<br>#cfcatch.detail#<br></cfoutput>
                        </cfcatch>
                    </cftry>
                    <!--- read directory --->
                    <cfdirectory action="LIST" directory="#variable.uploadDirectory#" name="qFileList">
                    <cfoutput>#qFileList.recordcount# file(s) uploaded <br> </cfoutput>
                    <!---<cfdirectory action="delete" directory="#uploadDirectory#"> --->

                </div>
            </div>
        </main>

    <cfinclude  template="../layout/footer.cfm">
    </cfoutput>
</body>
</html>
