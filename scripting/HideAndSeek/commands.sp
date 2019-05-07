/*
*
* Create HideAndSeek Commands
* For Every One Then For Admins
*
*/

public Hns_Commands_CreateCommands()
{
	PrintToServer("[SM][HNS] Hns_CreateCommands call successfull")
}

public Hns_Commands_CreateAdminCommands()
{
	RegAdminCmd("sm_hns_version", Hns_Commands_PrintHnsVersion, ADMFLAG_CHAT, "Print Hide and Seek plugin version.")
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
public Action Hns_Commands_PrintHnsVersion(int client, int args)
{
	if (!Global_HnsEnabled)
	{
		ReplyToCommand(client, "[SM][HnS] Plugin Disabled")

		return Plugin_Handled
	}

	char PluginVersion[PLATFORM_MAX_PATH]

	GetConVarString(Cvar_HnsVersion, PluginVersion, PLATFORM_MAX_PATH)
	CPrintToChatAll("%s version %s", PREFIX, PluginVersion)
	PrintToServer("[SM][HnS] Hide and Seek version %s", PluginVersion)

	return Plugin_Handled
}