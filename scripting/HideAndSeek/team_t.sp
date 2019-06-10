/*
*
* Hide And Seek : Functions Related To Team T
*
*/

// Free Team T At Spawn
public void Hns_TeamT_ThirdPersonAtSpawn(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T)
		Client_SetThirdPersonMode(client)
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