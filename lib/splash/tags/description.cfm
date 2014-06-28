<cfif thisTag.executionMode is "start"><cfoutput>#generateContent()#</cfoutput></cfif><cfsilent>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

<cffunction name="generateContent" returnType="string" access="public" output="false">
	<cfset var sReturn = "">

	<!--- Check if we are inside a "children" related tag --->
	<cfif StructKeyExists(request, "tags")>
		<cfset sReturn = request.tags.currentChild.description>
	<cfelse>
		<cfset sReturn = request.page.description>
	</cfif>

	<cfreturn sReturn>
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfsilent>