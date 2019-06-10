/*
*
* Hide And Seek: Every Functions I Don't Know Where To Put
*
*/

public void Hns_Misc_Offsets()
{
	Offset_fFlags = FindSendPropInfo("CBasePlayer", "m_fFlags")

	if (Offset_fFlags == -1)
		SetFailState("Couldnt find the m_fFlags offset!")
}

// Force Value Server Side Cvars
public void Hns_Misc_ForceServerCfg()
{
	for (int ArrayPosition = 0; ArrayPosition < SERVER_CFG_ARRAY - 1; ArrayPosition++)
	{
		if (GetConVarInt(FindConVar(Global_ServerCfg[ArrayPosition])) != Global_ServerCfgValue[ArrayPosition])
		{
			Global_ServerCfgPreviousValue[ArrayPosition] = GetConVarInt(FindConVar(Global_ServerCfg[ArrayPosition]))
			SetConVarInt(FindConVar(Global_ServerCfg[ArrayPosition]), Global_ServerCfgValue[ArrayPosition], true)
			HookConVarChange(FindConVar(Global_ServerCfg[ArrayPosition]), Hns_Misc_HookForceServerCfg)
		}
	}
}

// Make Sure Foced Configs Stay As Needed
public void Hns_Misc_HookForceServerCfg(ConVar convar, const char[] oldValue, const char[] newValue)
{
	for (int ArrayPosition = 0; ArrayPosition < SERVER_CFG_ARRAY - 1; ArrayPosition++)
	{
		char ConVarName[PLATFORM_MAX_PATH]

		GetConVarName(convar, ConVarName, PLATFORM_MAX_PATH)
		if (StrEqual(Global_ServerCfg[ArrayPosition], ConVarName, true) && StringToInt(newValue) != Global_ServerCfgValue[ArrayPosition])
		{
			SetConVarInt(convar, Global_ServerCfgValue[ArrayPosition], true)
			PrintToServer("Hide and Seek: %t", "ProtectedCvar", LANG_SERVER)
			break
		}
	}
}

// Blind Player
public void Hns_Misc_BlindPlayer(int client)
{
	if (IsClientInGame(client))
		Client_ScreenFade(client, 0, FFADE_STAYOUT)
}

// UnBlind Player
public void Hns_Misc_UnBlindPlayer(int client)
{
	if (IsClientInGame(client))
		Client_ScreenFade(client, 0, FFADE_PURGE, 0, 0, 0, 0, 0)
}

// Clean Ragdolls From The Floor
public void Hns_Misc_CleanRagdolls(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T)
		Effect_DissolvePlayerRagDoll(client, DISSOLVE_ELECTRICAL_LIGHT);
	
	else
		Effect_DissolvePlayerRagDoll(client, DISSOLVE_NORMAL);
}