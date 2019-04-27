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
	RegAdminCmd("sm_hns_plugin_version", Hns_Cmd_PrintHnsVersion, ADMFLAG_CHAT, "Print Hide and Seek plugin version.")
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
public Action Hns_Cmd_PrintHnsVersion(int client, int args)
{
	if (!global_HnsEnabled)
	{
		ReplyToCommand(client, "[SM][HnS] Plugin Disabled")
		return Plugin_Handled
	}

	CPrintToChatAll("%s version %s", PREFIX, GetConVarString(cvar_Version))
	PrintToServer("[SM][HnS] Hide and Seek version %s", GetConVarString(cvar_Version))
	return Plugin_Handled
}