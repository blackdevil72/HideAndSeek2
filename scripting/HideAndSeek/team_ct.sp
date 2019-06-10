/*
*
* Hide And Seek : Functions Related To Team CT
*
*/

// Gives A Shotgun To Team CT At Spawn
public void Hns_TeamCT_GiveShotgun(int client)
{
	if (GetClientTeam(client) ==  CS_TEAM_CT)
	{
		GivePlayerItem(client, "Weapon_XM1014")
	}
}

// Freeze Team CT At Spawn
public void Hns_TeamCT_FreezeAtSpawn(int client)
{
	if (GetClientTeam(client) == CS_TEAM_CT)
	{
		Hns_Misc_BlindPlayer(client)
		CreateTimer(0.5, Hns_Timers_FreezeCT, client)
		CreateTimer(GetConVarFloat(Cvar_FreezeTimeCt), Hns_Timers_UnFreezeCT, client)
	}
}

// Make Weapons Dropped by Team CT Dissapear To Prevent Cheating
public Hns_TeamCT_WeaponDrop(int client, int weapon)
{
	if (GetClientTeam(client) == CS_TEAM_CT)
	{
		if (weapon != -1)
		{
			CS_DropWeapon(client, weapon, false)
			RemoveEntity(weapon)
		}
	}
}

// Decrease CT Health When Fire Weapon
public void Hns_TeamCT_HpDecrease(int client)
{
	if (GetConVarBool(Cvar_CtHpChangeEnable) == true)
		Entity_TakeHealth(client, GetConVarInt(Cvar_CtHpChangeDecrease))
}

// Increase CT Health When Hurting Or Killing A T
public void Hns_TeamCT_HpIncrease(int client, int victim)
{
	if (GetClientHealth(victim) <= 0)
		SetEntityHealth(client, GetClientHealth(client) + GetConVarInt(Cvar_CtHpChangeDecrease) + GetConVarInt(Cvar_CtHpChangeBonus))

	else
		SetEntityHealth(client, GetClientHealth(client) + GetConVarInt(Cvar_CtHpChangeDecrease) + GetConVarInt(Cvar_CtHpChangeIncrease))
}

// Manage HP Decrease On Knife Right Click
public void Hns_TeamCT_KnifeRightClick(int client, int& buttons)
{
	if(GetClientTeam(client) == CS_TEAM_CT)
	{
		char ClientWeaponName[MAXPLAYERS][PLATFORM_MAX_PATH]
		GetClientWeapon(client, ClientWeaponName[client], PLATFORM_MAX_PATH)

		if (CS_AliasToWeaponID(ClientWeaponName[client]) == CSWeapon_KNIFE && buttons & IN_ATTACK2 && !GetConVarBool(Cvar_CtDisableKnifeRightClick))
			Hns_TeamCT_HpDecrease(client)

		else if (CS_AliasToWeaponID(ClientWeaponName[client]) == CSWeapon_KNIFE && buttons & IN_ATTACK2 && GetConVarBool(Cvar_CtDisableKnifeRightClick))
			buttons &= ~IN_ATTACK2
	}
}