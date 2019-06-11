/*
*
* Hide And Seek : Functions Related To Team T
*
*/

// Free Team T At Spawn
public void Hns_TeamT_ThirdPerson(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T && Global_IsPlayerTP[client] == false)
	{
		Client_SetThirdPersonMode(client, true)
		Global_IsPlayerTP[client] = true
	}

	else if (GetClientTeam(client) == CS_TEAM_T && Global_IsPlayerTP[client] == true)
	{
		Client_SetThirdPersonMode(client, false)
		Global_IsPlayerTP[client] = false
	}
}

// Prevent Team T From Using Any Weapons
public void Hns_TeamT_WeaponDrop(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T)
	{
		for (int WeaponSlot = CS_SLOT_PRIMARY; WeaponSlot <= CS_SLOT_C4; WeaponSlot++)
		{
			int WeaponId = GetPlayerWeaponSlot(client, WeaponSlot)

			if (WeaponId != -1)
			{
				RemovePlayerItem(client, WeaponId)
				RemoveEntity(WeaponId)
			}
		}
	}
}

// Manage HP Loss and Death For Team T
public void Hns_TeamT_TakeDamage(int client, float damage)
{
	if (GetClientTeam(client) == CS_TEAM_T)
	{
		Entity_TakeHealth(client, RoundToFloor(damage))
	}
}