<!--- we need to blank the password out to allow for updating the user without changing the password --->
<cfset user.password = "">

<cfoutput>
  <p>
    <label class="label">Login</label>
	  #textField(label="", objectName='user', property='username', class="text_field")#
	</p>

	<p>
	  <label class="label">Name</label>
		#textField(label="", objectName='user', property='name', class="text_field")#
	</p>

	<p>
	  <label class="label">Email</label>
		#textField(label="", objectName='user', property='email', class="text_field")#
	</p>

	<p>
	  <label class="label">Password</label>
	  #passwordField(label="", objectName='user', property='password', class="text_field")#
	</p>

	<p>
	  <label class="label">Confirm Password</label>
		#passwordField(label="", objectName='user', property='passwordConfirmation', class="text_field")#
	</p>

	<p>
	  <label class="label">Administrator
	  #checkBox(label="", objectName="user", property="admin", checkedValue="1", uncheckedValue="0")#</label>
	</p>

	<p>
	  <label class="label">Developer
	  #checkBox(label="", objectName="user", property="developer", checkedValue="1", uncheckedValue="0")#</label>
	</p>
</cfoutput>