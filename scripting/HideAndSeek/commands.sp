/*
*
* Hide And Seek: Create Commands
*
*/

public void Hns_Commands_CreateCommands()
{
	RegConsoleCmd("freeze", Hns_Commands_FreezePlayer, "Toggles freezing for hiders.")
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

// Freeze Or UnFreeze A Player In Team T
public Action Hns_Commands_FreezePlayer(int client, int args)
{
	if (GetClientTeam(client) == CS_TEAM_T)
	{
		if (Global_IsPlayerFreeze[client] == false && IsPlayerAlive(client))
		{
			Hns_Freeze_FreezePlayer(client)
			CReplyToCommand(client, "%s%t", PREFIX, "HiderFreezed")
		}

		else if (Global_IsPlayerFreeze[client] == true && IsPlayerAlive(client))
		{
			Hns_Freeze_UnFreezePlayer(client)
			CReplyToCommand(client, "%s%t", PREFIX, "HiderUnfreezed")
		}

		return Plugin_Continue
	}

	else
	{
		CReplyToCommand(client, "%s%t", PREFIX, "OnlyTerroristsCanUse")

		return Plugin_Continue
	}
}

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