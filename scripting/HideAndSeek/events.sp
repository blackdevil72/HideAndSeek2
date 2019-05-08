/*
*
* Hide And Seek : Load Hooked Events
*
* Read Function Name To Know What Event Is Called
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

	Hns_TeamCT_GiveShotgun(Client)

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

	if (GetClientTeam(Client) == CS_TEAM_T)
		Effect_DissolvePlayerRagDoll(Client, DISSOLVE_ELECTRICAL_LIGHT);
	
	else
		Effect_DissolvePlayerRagDoll(Client, DISSOLVE_NORMAL);

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
	Hns_TeamCT_HpIncrease(attacker, victim)

	return Plugin_Handled
}
