/*
*
* Hide And Seek: Create Commands
*
*/

public void Hns_Commands_CreateCommands()
{
	RegConsoleCmd("freeze", Hns_Commands_FreezePlayer, "Toggle freezing for hiders.")
	RegConsoleCmd("whistle", Hns_Commands_Whistle, "Toggle whistling for hiders.")
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
			Hns_Freeze_FreezeModel(client)
			CReplyToCommand(client, "%s%t", PREFIX, "HiderFreezed")
		}

		else if (Global_IsPlayerFreeze[client] == true && IsPlayerAlive(client))
		{
			Hns_Freeze_UnFreezePlayer(client)
			Hns_Freeze_UnFreezeModel(client)
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

// Play A Song To Give Team CT A Clue Where To Search A T
public Action Hns_Commands_Whistle(int client, int args)
{
	if (GetClientTeam(client) == CS_TEAM_T)
	{
		if (IsPlayerAlive(client) && GetConVarBool(Cvar_WhistleEnabled) && Global_PlayerWhistleCount[client] < GetConVarInt(Cvar_WhistleLimit))
		{
			Global_PlayerWhistleCount[client]++

			Hns_Whistle_PlayWhistle(client)
			CPrintToChatAll("%s%N %t", PREFIX, client, "Whistled")
			CPrintToChat(client, "%s%t", PREFIX, "WhistleLeft", GetConVarInt(Cvar_WhistleLimit) - Global_PlayerWhistleCount[client])
		}

		else if (IsPlayerAlive(client) && GetConVarBool(Cvar_WhistleEnabled) && Global_PlayerWhistleCount[client] == GetConVarInt(Cvar_WhistleLimit))
		{
			CPrintToChat(client, "%s%t", PREFIX, "WhistleLimit", GetConVarInt(Cvar_WhistleLimit))
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