/*
*
* Hide And Seek : Functions Related To Team T
*
*/

public Hns_TeamT_WeaponDrop(int client)
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

public Hns_TeamT_TakeDamage(int client, float damage)
{
	if (GetClientTeam(client) == CS_TEAM_T)
	{
		int ClientRemainingHealth = GetClientHealth(client) - RoundToFloor(damage)

		if (ClientRemainingHealth < 0)
			ForcePlayerSuicide(client)

		else
			SetEntityHealth(client, ClientRemainingHealth)
	}
}