/*
*
* Hide And Seek : Functions Related To Team CT
*
*/

// Gives A Shotgun To Team CT
public Hns_TeamCT_GiveShotgun(int client)
{
	if (GetClientTeam(client) ==  CS_TEAM_CT)
	{
		GivePlayerItem(client, "Weapon_XM1014")
	}
}

// Make Weapons Dropped by Team CT Dissapear To Prevent Cheating
public Hns_TeamCT_WeaponDrop(int client, int weapon)
{
	if (GetClientTeam(client) == CS_TEAM_CT)
	{
		if (weapon != -1)
			RemoveEntity(weapon)
	}
}

// Decrease CT Health When Fire Weapon
public Hns_TeamCT_HpDecrease(int client)
{
	int ClientRemainingHealth = GetClientHealth(client) - GetConVarInt(Cvar_CtHpChangeDecrease)

	if (ClientRemainingHealth > 0)
		SetEntityHealth(client, ClientRemainingHealth)

	else
		ForcePlayerSuicide(client)
}

// Increase CT Health When Hurting Or Killing A T
public Hns_TeamCT_HpIncrease(int client, int victim)
{
	if (GetClientHealth(victim) < 0)
		SetEntityHealth(client, GetClientHealth(client) + GetConVarInt(Cvar_CtHpChangeDecrease) + GetConVarInt(Cvar_CtHpChangeBonus))

	else
		SetEntityHealth(client, GetClientHealth(client) + GetConVarInt(Cvar_CtHpChangeDecrease) + GetConVarInt(Cvar_CtHpChangeIncrease))
}