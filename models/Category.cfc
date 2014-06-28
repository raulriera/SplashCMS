<cfcomponent extends="Model" output="false"><cfscript>

    function init(){
    	table("cms_categories");
        hasMany('Snippets');

        validatesPresenceOf(properties="name", message="Your category must have a name.");
        validatesLengthOf(properties="name", message="Your cateogries name can be no longer than 50 characters.", maximum="50");
    }

</cfscript></cfcomponent>