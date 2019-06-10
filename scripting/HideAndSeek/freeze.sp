/*
*
* Hide And Seek : Functions Related To Team T
*
*/

// Freeze Player
public void Hns_Freeze_FreezePlayer(int client)
{
	Global_IsPlayerFreeze[client] = true

	SetEntityMoveType(client, MOVETYPE_NONE)
	TeleportEntity(client, NULL_VECTOR, NULL_VECTOR, Global_NullVelocity) 
}

// UnFreeze Player
public void Hns_Freeze_UnFreezePlayer(int client)
{
	Global_IsPlayerFreeze[client] = false

	SetEntityMoveType(client, MOVETYPE_WALK)
}

// Solution Found Here: https://forums.alliedmods.net/showpost.php?p=1893048&postcount=5?p=1893048&postcount=5
// Free Model With Free Camera
public void Hns_Freeze_FreezeModel(int client)
{
	char ModelPath[PLATFORM_MAX_PATH]
	GetClientModel(client, ModelPath, sizeof(ModelPath))

	float ClientPosition[3]
	GetClientAbsOrigin(client, ClientPosition)

	float ClientAngles[3]
	GetClientAbsAngles(client,ClientAngles)

	float ClientEyeAngles[3]
	GetClientEyeAngles(client, ClientEyeAngles)

	float ClientEyeAnglesVectors[3]
	GetAngleVectors(ClientEyeAngles, ClientEyeAnglesVectors, NULL_VECTOR, NULL_VECTOR)

	float ModelPosition[3]

	ClientPosition[0] -= 0.0
	ModelPosition[0] = 0.0

	GetEntPropVector(client, Prop_Data, "m_vecVelocity", ClientEyeAnglesVectors)
	AddVectors(ModelPosition, ClientEyeAnglesVectors, ModelPosition)

	Global_FakeModel[client] = CreateEntityByName("prop_physics_override")

	if (IsValidEntity(Global_FakeModel[client]))
	{
		PrecacheModel(ModelPath, true)
		SetEntityRenderMode(Global_FakeModel[client], RENDER_TRANSCOLOR)
		SetEntityModel(Global_FakeModel[client], ModelPath)
		Entity_SetOwner(Global_FakeModel[client], client)
		SetEntProp(Global_FakeModel[client], Prop_Data, "m_CollisionGroup", 1)
		SetEntProp(Global_FakeModel[client], Prop_Send, "m_usSolidFlags", 12)
		Entity_SetSolidType(Global_FakeModel[client], SOLID_VPHYSICS)
		DispatchSpawn(Global_FakeModel[client])
		SetEntData(Global_FakeModel[client], Offset_fFlags, FL_CLIENT|FL_ATCONTROLS, 4, true)
		SetEntityMoveType(Global_FakeModel[client], MOVETYPE_NONE)
		TeleportEntity(Global_FakeModel[client], ClientPosition, NULL_VECTOR, ModelPosition)
		SetEntPropEnt(Global_FakeModel[client], Prop_Data, "m_hLastAttacker", client)
		TeleportEntity(Global_FakeModel[client], NULL_VECTOR, ClientAngles, NULL_VECTOR)
		Effect_FadeOut(client)
	}
}

// UnFrezze Model
public void Hns_Freeze_UnFreezeModel(int client)
{
	if (Global_FakeModel[client] > 0 && IsValidEntity(Global_FakeModel[client]))
	{
		Entity_Kill(Global_FakeModel[client])
		Global_FakeModel[client] = -1
		Effect_FadeIn(client)
	}
}