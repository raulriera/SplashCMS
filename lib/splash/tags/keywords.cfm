<cfif thisTag.executionMode is "start">
	<!--- Check if we are inside a "children" related tag --->
	<cfif StructKeyExists(request, "tags")>
		<cfoutput>#request.tags.currentChild.keywords#</cfoutput>
	<cfelse>
		<cfoutput>#request.page.keywords#</cfoutput>
	</cfif>
</cfif>