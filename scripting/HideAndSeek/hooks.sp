/*
*
* Hide And Seek : Hook Game Events And Call Related Function
*
*/

// Sourcemod Hooks
public void Hns_Hooks_CreateHooks()
{
	HookEvent("player_spawn", Hns_Events_PlayerSpawn)
	HookEvent("item_pickup", Hns_Events_ItemPickup)
	HookEvent("weapon_fire", Hns_Events_WeaponFire)
	HookEvent("player_death", Hns_Events_PlayerDeath)
	HookEvent("round_end", Hns_Events_Roundend)
}

// SDK Hooks
public void Hns_Hooks_CreateSdkHooks(int client)
{
	SDKHook(client, SDKHook_WeaponDrop, Hns_Events_WeaponDrop)
	SDKHook(client, SDKHook_TraceAttack, Hns_Events_TraceAttack)
}