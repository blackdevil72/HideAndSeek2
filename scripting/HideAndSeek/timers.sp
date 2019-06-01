/*
*
* Hide And Seek : Timers Callback
*
*/

// Timer Callback To Freeze Team CT At Spawn
public Action Hns_Timers_FreezeCT(Handle timer, any data)
{
	Hns_Freeze_FreezePlayer(data)
}

// Timer Callback To UnFreeze Team CT At Spawn
public Action Hns_Timers_UnFreezeCT(Handle timer, any data)
{
	Hns_Misc_UnBlindPlayer(data)
	Hns_Freeze_UnFreezePlayer(data)
	EmitSoundToClient(data, "radio/go.wav")
}