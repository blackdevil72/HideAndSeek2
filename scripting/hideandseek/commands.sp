public void Hns_CreateCommands()
{
	PrintToServer("[SM][HNS] Hns_CreateCommands call successfull")
}

public void Hns_CreateAdminCommands()
{
	RegAdminCmd("sm_hns_plugin_version", PrintHnsVersion, ADMFLAG_CHAT, "Print Hide and Seek plugin version.")
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
public Action PrintHnsVersion(int client, int args)
{
	if (!g_bEnableHnS)
	{
		ReplyToCommand(client, "Disabled");
		return Plugin_Handled;
	}

	char CvarPluginVersion[PLATFORM_MAX_PATH];
	GetConVarString(g_cvVersion, CvarPluginVersion, PLATFORM_MAX_PATH);
	PrintToChatAll("\x04[HnS] \x03Hide and Seek version %s", CvarPluginVersion);
	PrintToServer("[HnS] Hide and Seek version %s", CvarPluginVersion);
	return Plugin_Handled;
}