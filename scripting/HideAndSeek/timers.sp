/*
*
* Hide And Seek : Timers Callback
*
*/

public Action Hns_Timers_UnFreezeCT(Handle timer, any data)
{
	Hns_Misc_UnBlindPlayer(data)
	Hns_Freeze_UnFreezePlayer(data)
	EmitSoundToClient(data, "radio/go.wav")
}