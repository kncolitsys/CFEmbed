
<cfcomponent extends="BasePlugin">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfargument name="mainManager" type="any" required="true" />
		<cfargument name="preferences" type="any" required="true" />
		
		<cfset setManager(arguments.mainManager) />
		<cfset setPreferencesManager(arguments.preferences) />
	
		<cfreturn this/>
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any">
		<cfreturn "idxEmbedly Plugin is now activated. Embedly is now available for all pages. Make sure you look-up usage on this page:
					<a href='http://api.embed.ly'>Public Api on Embed.ly</a>" />
	</cffunction>
	
	<cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any">
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />		
		<cfreturn />
	</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->	
	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />

			<cfset var embedlyString =  ""/>
			<cfset var outputData = "">
			
			<cfswitch expression="#arguments.event.name#">
				
				<cfcase value="beforeHtmlHeadEnd">
					<cfset outputData = arguments.event.getOutputData() />
					
					<cfsavecontent variable="embedlyString">
						<cfoutput>
							<script type="text/javascript" src="http://scripts.embed.ly/embedly.js" ></script>
						</cfoutput>
					</cfsavecontent>
					
					<cfset arguments.event.setOutputData(outputData & embedlyString) />
				</cfcase>
				
			</cfswitch>
		
		<cfreturn arguments.event />
	</cffunction>
	
</cfcomponent>