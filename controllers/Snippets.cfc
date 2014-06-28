<cfcomponent extends="Controller">

  <cffunction name="init">
    <cfset filters(through="loginRequired")>
  </cffunction>

  <cffunction name="index">
      <cfset snippetsAndCategories = model('snippet').findAll(order="categoryid,name", include="category", groupby="categoryid")>
    <!--- <cfset categories = model('category').findAll(order="name")> --->
  </cffunction>

  <cffunction name="new">
    <cfset snippet = model('snippet').new()>
    <cfset category = model('category').new()>
    <cfset categories = model('category').findAll()>
  </cffunction>

  <cffunction name="edit">
  	<cfset snippet = model('snippet').findByKey(params.key)>
	<cfset category = model('category').new()>
    <cfset categories = model('category').findAll()>

    <cfif NOT IsObject(snippet)>
      <cfset flashInsert(info="No snippet exists for ID #params.key#")>

     	<cftry>
      	<cfset redirectTo(back=true)>

      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(route="snippets_path")>
      	</cfcatch>
      </cftry>
    </cfif>
  </cffunction>

  <cffunction name="create">
    <cfset snippet = model('snippet').new(params.snippet)>

    <!--- create our snippets filename --->
    <cfset snippet.fileName = createUUID() & ".cfm">

    <cfif snippet.save()>
        <cfset flashInsert(success="The snippet was created successfully")>
        <cfset redirectTo(route="edit_snippet_path", key=snippet.id)>
        <!--- <cfset redirectTo(route="snippets_path")> --->
    <cfelse>
        <cfset category = model('category').new()>
    <cfset categories = model('category').findAll()>
        <cfset flashInsert(error="There was an error creating the snippet.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>

  <cffunction name="update">
  	<cfset snippet = model('snippet').findByKey(params.key)>

    <!--- delete our old file --->
    <cfif fileExists("#application.defaults.snippetsPath#/#snippet.fileName#")>
  	    <cffile action="delete" file="#application.defaults.snippetsPath#/#snippet.fileName#">
  	</cfif>
    <!--- change our filename to the new file --->
	<cfset snippet.fileName = createUUID() & ".cfm">

  	<cfif snippet.update(params.snippet)>
  	    <!--- write the file to disk --->
		  <cffile action="write" file="#application.defaults.snippetsPath#/#snippet.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#snippet.content#" addnewline="no" fixnewline="yes" />

  		<cfset flashInsert(success="The snippet was updated successfully.")>
      <cfset redirectTo(route="edit_snippet_path", key=snippet.id)>
      <!--- <cfset redirectTo(route="snippets_path")> --->
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the snippet.")>
  		<cfset category = model('category').new()>
      <cfset categories = model('category').findAll()>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>

  <cffunction name="delete">
  	<cfset snippet = model('snippet').findByKey(params.key)>

  	<cfif snippet.delete()>
  		<cfset flashInsert(success="The snippet was deleted successfully. Make sure that none of your pages or layouts are using it.")>
      <cfset redirectTo(route="snippets_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the snippet.")>
  		<cfset redirectTo(route="snippets_path")>
  	</cfif>
  </cffunction>

</cfcomponent>