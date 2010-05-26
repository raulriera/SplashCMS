<cfscript>
    if (thisTag.executionMode == 'start'){      
		
		// Check if we are inside a "children" related tag
		if (StructKeyExists(request, "tags")) {
			pageObject = request.tags.currentChild;
		} else {
			pageObject = request.page;
		}
		
		url = pageObject.slug;
        title = pageObject.title;
        urlString = '<a href="';
    }
    
    if (thisTag.executionMode == 'end'){
		if (len(thisTag.generatedContent)){
            linkText = thisTag.generatedContent;
            thisTag.generatedContent = "";
        } else {
            linkText = title;
        }

		// For some reason, the "url" property is lost here, so I reuse "pageObject"    
        urlString = urlString & pageObject.slug & '">' & linkText & '</a>';
        writeOutput(urlString);
    }
</cfscript>