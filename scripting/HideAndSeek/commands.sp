/*
*
* Hide And Seek: Create HideAndSeek Commands
*
*/

public void Hns_Commands_CreateCommands()
{
// Nothing Here Yet
}

public void Hns_Commands_CreateAdminCommands()
{
	RegAdminCmd("sm_hns_version", Hns_Commands_PrintHnsVersion, ADMFLAG_CHAT, "Print Hide And Seek plugin version.")
}


/*
*
* Player Commands
*
*/

// Nothing Here Yet

/*
*
* Admin Commands
*
*/

// Print plugin Version In Chat And In Server Output
static Action Hns_Commands_PrintHnsVersion(int client, int args)
{
	if (!Global_HnsEnabled)
	{
		ReplyToCommand(client, "[SM][HnS] Plugin Disabled")

		return Plugin_Continue
	}

	else
	{
		char PluginVersion[PLATFORM_MAX_PATH]

		GetConVarString(Cvar_HnsVersion, PluginVersion, PLATFORM_MAX_PATH)
		CPrintToChatAll("%s version %s", PREFIX, PluginVersion)
		PrintToServer("[SM][HnS] Hide and Seek version %s", PluginVersion)

		return Plugin_Continue
	}
}