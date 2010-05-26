<cfif thisTag.executionMode is "start">
	<!--- Check if we are inside a "children" related tag --->
	<cfif StructKeyExists(request, "tags")>
		<cfoutput>#request.tags.currentChild.author.name#</cfoutput>
	<cfelse>
		<cfoutput>#request.page.author.name#</cfoutput>
	</cfif>
</cfif>