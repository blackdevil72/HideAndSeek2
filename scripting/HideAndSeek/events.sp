/*
*
* Hide And Seek : Load Hooked Events
*
* Read Function Name To Know What Event Is Called
*
*/

public Action Hns_Events_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))

	if (GetClientTeam(Client) ==  CS_TEAM_CT)
	{
		GivePlayerItem(Client, "Weapon_XM1014")
	}
}

public Action Hns_Events_ItemPickup(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))

	if (GetClientTeam(Client) == CS_TEAM_T)
	{
		for (int WeaponSlot = CS_SLOT_PRIMARY; WeaponSlot <= CS_SLOT_C4; WeaponSlot++)
		{
			int WeaponId = GetPlayerWeaponSlot(Client, WeaponSlot)

			if (WeaponId != -1)
			{
				RemovePlayerItem(Client, WeaponId)
				RemoveEntity(WeaponId)
			}
		}
	}

	return Plugin_Continue
}

public Action Hns_Events_WeaponDrop(int client, int weapon)
{
	if (GetClientTeam(client) == CS_TEAM_CT)
	{
		if (weapon != -1)
			RemoveEntity(weapon)
	}

	return Plugin_Continue
}