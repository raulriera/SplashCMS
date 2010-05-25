<cfif thisTag.executionMode IS "start"> 
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
              <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
            <cfelse>
                <cfset pagePart.write()>
                <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                    <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
                </cfif>
            </cfif>
        <cfelse>
            <cfset pagePart.fileName = createUUID()>
            <cfset pagePart.write()>
            <cfset pagePart.save()>
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
            </cfif>
        </cfif>
        </cfoutput>
    </cfif>
</cfif>