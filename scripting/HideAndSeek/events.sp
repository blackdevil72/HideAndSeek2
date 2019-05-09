/*
*
* Hide And Seek : Load Hooked Events
*
*/

/*
*
* Sourcemod Hooks Events
*
*/

public Action Hns_Events_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))

	// Team T Spawn Events
	Hns_TeamT_ThirdPersonAtSpawn(Client)
	Hns_Models_SetRandomModel(Client)

	// Team CT Spawn Events
	Hns_TeamCT_GiveShotgun(Client)

	if (GetConVarBool(Cvar_FreezeCt) == true)
		Hns_TeamCT_FreezeAtSpawn(Client)

	return Plugin_Continue
}

public Action Hns_Events_ItemPickup(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))

	Hns_TeamT_WeaponDrop(Client)

	return Plugin_Continue
}

public Action Hns_Events_WeaponFire(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))

	if (GetConVarBool(Cvar_CtHpChangeEnable) == true)
		Hns_TeamCT_HpDecrease(Client)

	return Plugin_Continue
}

public Action Hns_Events_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	int Client = GetClientOfUserId(GetEventInt(event, "userid"))
	Global_IsPlayerFreeze[Client] = false

	Hns_Misc_CleanRagdolls(Client)

	return Plugin_Continue
}

/*
*
* SDK Hooks Events
*
*/

public Action Hns_Events_WeaponDrop(int client, int weapon)
{
	Hns_TeamCT_WeaponDrop(client, weapon)

	return Plugin_Continue
}

public Action Hns_Events_TraceAttack(int victim, int &attacker, int &inflictor, float &damage, int &damagetype, int &ammotype, int hitbox, int hitgroup)
{
	Hns_TeamT_TakeDamage(victim, damage)

	if (GetConVarBool(Cvar_CtHpChangeEnable) == true)
		Hns_TeamCT_HpIncrease(attacker, victim)

	return Plugin_Handled
}