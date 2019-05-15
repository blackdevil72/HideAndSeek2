/*
*
* Hide And Seek : Timers Callback
*
*/

// Timer Callback To UnFreeze Team CT At Spawn
public Action Hns_Timers_UnFreezeCT(Handle timer, any data)
{
	Hns_Misc_UnBlindPlayer(data)
	Hns_Freeze_UnFreezePlayer(data)
	EmitSoundToClient(data, "radio/go.wav")
}

public Action Hns_Timers_HeightFix(Handle timer, any data)
{
	Hns_Models_HeightFix(data)
}