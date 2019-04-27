public void Hns_CreateHooks()
{
	// Game Event Hooks
	HookEvent("player_spawn", Hns_Event_OnPlayerSpawn)

	// SDK Hooks
	SDKHook(client, SDKHook_WeaponCanUse, OnWeaponCanUse);
	SDKHook(client, SDKHook_WeaponCanSwitchTo, OnWeaponCanUse);
	SDKHook(client, SDKHook_WeaponEquip, OnWeaponCanUse);
	SDKHook(client, SDKHook_WeaponSwitch, OnWeaponCanUse);
}