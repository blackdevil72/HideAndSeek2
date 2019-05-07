/*
*
* Hide And Seek : Load Hooked Events
*
* Read Function Name To Know What Event Is Called
*
*/

public Action Hns_Events_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
	PrintToServer("[SM][HNS] Hns_Event_RoundStart call successfull")

	int Client = GetClientOfUserId(GetEventInt(event,"userid"))
	int ClientTeam = GetClientTeam(Client)

	if (ClientTeam <= CS_TEAM_SPECTATOR || !IsPlayerAlive(Client))
		return Plugin_Continue

	else if (ClientTeam == CS_TEAM_T)
	{
		PrintToServer("[SM][HNS] Hns_Event_RoundStart call successfull -- TEAM T")

		Hns_WeaponDrop(Client)
	}

	else  if (ClientTeam == CS_TEAM_CT)
	{
		PrintToServer("[SM][HNS] Hns_Event_RoundStart call successfull -- TEAM CT")
	}

	return Plugin_Continue
}

static Hns_WeaponDrop(int client)
{
	for (int WeaponSlot = CS_SLOT_PRIMARY; WeaponSlot < CS_SLOT_C4; WeaponSlot++)
	{
		int WeaponId = GetPlayerWeaponSlot(client, WeaponSlot)
		CS_DropWeapon(client, WeaponId, true, false)
	}
}