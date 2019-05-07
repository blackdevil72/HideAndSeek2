/*
*
* Hide And Seek : Hook Game Events And Call Related Function
*
*/

public Hns_Hooks_CreateHooks()
{
	// Game Event Hooks
	HookEvent("round_start", Hns_Events_RoundStart)

	PrintToServer("[SM][HNS] Hns_Hooks_CreateHooks call successfull")
}