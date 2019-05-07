/*
*
* Hide And Seek : Hook Game Events And Call Related Function
*
*/

// Sourcemod Hooks
public Hns_Hooks_CreateHooks()
{
	HookEvent("player_spawn", Hns_Events_PlayerSpawn)
	HookEvent("item_pickup", Hns_Events_ItemPickup)
}

// SDK Hooks
public Hns_Hooks_CreateSdkHooks(int client)
{
	SDKHook(client, SDKHook_WeaponDrop, Hns_Events_WeaponDrop)
}

// SDK Unhook
/*
public Hns_Hooks_ClearSdkHooks()
{
	for (int Client = 0; Client <= MAXPLAYERS; Client++)
	{
		if (IsClientInGame(Client))
		{
			SDKUnhook(Client, SDKHook_WeaponDropPost, Hns_Events_WeaponDropPost)
		}
	}
}
*/