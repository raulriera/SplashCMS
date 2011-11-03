<cfoutput>
<p><label class="label">Name</label>
#textField(label="", objectName='layout', property='name', class="text_field")#</p>

<p><label class="label">Body</label>
#richTextField(label="", objectName='layout', property='content', class="rteditor", rows="15", editor="markitup", includeJSLibrary="false")#</p>
</cfoutput>