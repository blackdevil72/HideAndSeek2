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