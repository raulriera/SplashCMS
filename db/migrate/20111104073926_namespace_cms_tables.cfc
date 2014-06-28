<cfcomponent extends="plugins.dbmigrate.Migration" hint="namespace cms tables">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="up">
		<cfscript>
			renameTable("categories",	"cms_categories");
			renameTable("layouts",		"cms_layouts");
			renameTable("pageclasses",	"cms_pageclasses");
			renameTable("pageparts",	"cms_pageparts");
			renameTable("pages",		"cms_pages");
			renameTable("snippets",		"cms_snippets");
			renameTable("users",		"cms_users");
		</cfscript>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="down">
		<cfscript>
			renameTable("cms_categories",	"categories");
			renameTable("cms_layouts",		"layouts");
			renameTable("cms_pageclasses",	"pageclasses");
			renameTable("cms_pageparts",	"pageparts");
			renameTable("cms_pages",		"pages");
			renameTable("cms_snippets",		"snippets");
			renameTable("cms_users",		"users");
		</cfscript>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfcomponent>
