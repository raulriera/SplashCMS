<cfcomponent extends="Wheels" output="false">

  <cffunction name="setCreatedByID">
  	<cfif structKeyExists(session, "currentUser")>
    	<cfset this.createdById = session.currentUser.id>
    </cfif>
  </cffunction>

  <cffunction name="setUpdatedByID">
  	<cfif structKeyExists(session, "currentUser")>
  	    <cfset this.updatedById = session.currentUser.id>
  	</cfif>
  </cffunction>

</cfcomponent>