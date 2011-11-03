<cfif thisTag.executionMode IS "start"><cfoutput>#generateContent()#</cfoutput></cfif><cfsilent>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

<cffunction name="generateContent" returnType="string" access="public" output="false">
    <cfset var sReturn = "">

    <cfparam name="attributes.part" default="">
    <cfparam name="attributes.page" default="#request.page#">

	<!--- Check if we are inside a "children" related tag --->
	<cfif StructKeyExists(request, "tags")>
		<cfset attributes.page = request.tags.currentChild>
	</cfif>

	<!--- Create a wheels proxy so we can use their methods inside a custom tag --->
    <cfset wheelsProxy = CreateObject("component","controllers.Controller")>

	<!--- Find the desired part --->
    <cfset pagePart = wheelsProxy.wheelsExecute("model('pagePart').findByPage(pageID=#attributes.page.ID#, part = '#attributes.part#')")>

    <cfif IsObject(pagePart)>
        <cfoutput>
        <cfif pagePart.fileName IS NOT "">
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#"></cfsavecontent>
            <cfelse>
                <cfset pagePart.write()>
                <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                    <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#"></cfsavecontent>
                </cfif>
            </cfif>
        <cfelse>
            <cfset pagePart.fileName = createUUID()>
            <cfset pagePart.write()>
            <cfset pagePart.save()>
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                <cfsavecontent variable="sReturn"><cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#"></cfsavecontent>
            </cfif>
        </cfif>
        </cfoutput>
    </cfif>

    <cfreturn sReturn>

</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfsilent>