/*
*
* Create HideAndSeek Commands
* For Every One Then For Admins
*
*/

public void Hns_CreateCommands()
{
	PrintToServer("[SM][HNS] Hns_CreateCommands call successfull")
}

public void Hns_CreateAdminCommands()
{
	RegAdminCmd("sm_hns_plugin_version", Cmd_PrintHnsVersion, ADMFLAG_CHAT, "Print Hide and Seek plugin version.")
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

// Print plugin Version To The PrintToChatAll
// Usefull For Support
public Action Cmd_PrintHnsVersion(int client, int args)
{
	if (!global_HnsEnabled)
	{
		ReplyToCommand(client, "[SM][HnS] Plugin Disabled")
		return Plugin_Handled
	}

	char Str_PluginVersion[PLATFORM_MAX_PATH]
	GetConVarString(cvar_Version, Str_PluginVersion, PLATFORM_MAX_PATH)
	CPrintToChatAll("%s version %s", PREFIX, Str_PluginVersion)
	PrintToServer("[SM][HnS] Hide and Seek version %s", Str_PluginVersion)
	return Plugin_Handled
}