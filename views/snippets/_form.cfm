<cfoutput>
<p><label class="label">Name</label>
#textField(label="", objectName='snippet', property='name', class="text_field")#</p>

<p><label class="label">Category</label>
#select(label="", objectName="snippet", property="categoryid", options="#categories#", includeBlank="true")#
<a id="add-new" class="ui-button ui-state-default ui-corner-all">add new</a><br/>
<span class="description">Categories are simply a way to organize your snippets.</span></p>

<p><label class="label">Body</label>
<!--- #textArea(objectName='snippet', property='content', class="text_area", rows="15")# --->
#richTextField(label="", objectName='snippet', property='content', class="rteditor", rows="15", editor="markitup", includeJSLibrary="false")#
</p>
</cfoutput>