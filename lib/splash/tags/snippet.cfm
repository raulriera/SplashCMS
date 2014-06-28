<cfif thisTag.executionMode IS "start"><cfoutput>#generateContent()#</cfoutput></cfif><cfsilent>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

<cffunction name="generateContent" returnType="string" access="public" output="false">
    <cfset var sReturn = "">

    <cfparam name="attributes.name" default="">

    <cfset wheelsProxy=CreateObject("component","controllers.Controller") >

    <cfset snippet = wheelsProxy.wheelsExecute("model('snippet').findOneByName('#attributes.name#')")>

    <cfif isObject(snippet)>
        <cfoutput>
        <cfif snippet.filename is Not "">
                <cfif fileExists(expandPath("#application.defaults.rootPath#public/snippets/#snippet.filename#"))>
                    <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#"></cfsavecontent>
                <cfelse>
                    <cfset snippet.write()>
                    <cfif fileExists(expandPath("#application.defaults.rootPath#public/snippets/#snippet.filename#"))>
                        <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#"></cfsavecontent>
                    </cfif>
                </cfif>
        <cfelse>
            <cfset snippet.filename = createUUID()>
            <!--- some of this code is repeated and ugly, thinking of adding some methods to the model to keep it DRY --->
            <cfset snippet.write()>
            <cfset snippet.save()>
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/snippets/#snippet.filename#"))>
                <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#"></cfsavecontent>
            </cfif>
        </cfif>
        </cfoutput>
    </cfif>

    <cfreturn sReturn>
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
</cfsilent>