<cfif thisTag.executionMode is "start">
	<!--- Check if we are inside a "children" related tag --->
	<cfif StructKeyExists(request, "tags")>
		<cfoutput>#request.tags.currentChild.description#</cfoutput>
	<cfelse>
		<cfoutput>#request.page.description#</cfoutput>
	</cfif>
</cfif>