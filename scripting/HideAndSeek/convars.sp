public Hns_Convars_CreateCvars()
{
	// Create HideAndSeek ConVars
	Cvar_HnsVersion =				CreateConVar("sm_hns_verion", PLUGIN_VERSION, "SM Hide And Seek Version", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY|FCVAR_DONTRECORD)
	Cvar_HnsEnabled =				CreateConVar("sm_hns_enable", "1", "Enable Hide And Seek Plugin", _, true, 0.0, true, 1.0)

/*
FUTURE CVARS NAMES MAY CHANGE

	cvar_FreezeCt =					CreateConVar("sm_hns_freeze_ct", "1", "Freeze team CT at round start", _, true, 0.0, true, 1.0)
	cvar_FreezeTimeCt =				CreateConVar("sm_hns_freezetime_ct", "30", "How long should we freeze team CT at round start (in seconds)", _, true, 1.0)
	cvar_ModelChangeLimit =			CreateConVar("sm_hns_model_change_limit", "5","How many time the Terrorists should be able to change model [0 = no limit]", _, true, 0.0, true, 50)
	cvar_ModelChangeTime =			CreateConVar("sm_hns_model_change_time", "30", "For how long can terrorist change model during a round [0 = no limit] (in seconds)", _, true, 0.0)
	cvar_ModelAutoChoose =			CreateConVar("sm_hns_model_auto_choose", "1")
	cvar_WhistleEnabled =			CreateConVar
	cvar_WhistlePack =				CreateConVar
	cvar_WhistleAuto =				CreateConVar
	cvar_WhistleAutoInterval =		CreateConVar
	cvar_WhistleLimit =				CreateConVar
	cvar_WhistleDelay =				CreateConVar
*/

	Global_HnsEnabled = GetConVarBool(Cvar_HnsEnabled)
	AutoExecConfig(true, "HideAndSeek")
	PrintToServer("[SM][HNS] Hns_Convars_CreateCvars call successfull")
}