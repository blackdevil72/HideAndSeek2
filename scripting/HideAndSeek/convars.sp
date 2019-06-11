/*
*
* Hide And Seek: Create HideAndSeek Convars And Config File
*
*/

public void Hns_Convars_CreateCvars()
{
	Cvar_CtDisableKnifeRightClick =			CreateConVar("sm_hns_ct_disable_knife_rightclick", "1", "Can CT use right click with knife?", _, true, 0.0, true, 1.0)
	Cvar_CtHpChangeBonus =					CreateConVar("sm_hns_ct_hp_bonus", "25", "How many HP do we grant to CT when killing a T?", _, true, 0.0, true, 100.0)
	Cvar_CtHpChangeIncrease =				CreateConVar("sm_hns_ct_hp_increase", "15", "How many HP should we add to CT when hurting a T?", _, true, 0.0, true, 100.0)
	Cvar_CtHpChangeDecrease =				CreateConVar("sm_hns_ct_hp_decrease", "5", "How many HP should we remove from CT when using a weapon?", _, true, 1.0, true, 100.0)
	Cvar_CtHpChangeEnable =					CreateConVar("sm_hns_ct_hp_change", "1", "Should we change CT HP when using a weapon?", _, true, 0.0, true, 1.0)
	Cvar_WhistleLimit =						CreateConVar("sm_hns_whistle_limit", "5", "How many times a hider is allowed to whistle per round?", _, true, 0.0, true, 100.0)
	Cvar_WhistleSet =						CreateConVar("sm_hns_whistle_set", "0", "Wich whistle set to use. 0 = Default / 1 = Whistle / 2 = Birds / 3 = Custom", _, true, 0.0, true, 3.0)
	Cvar_WhistleEnabled =					CreateConVar("sm_hns_whistle", "1", "Are terrorists allowed to whistle?", _, true, 0.0, true, 1.0)
	Cvar_FreezeTimeCt =						CreateConVar("sm_hns_freezetime_ct", "30", "How long should we freeze team CT at round start (in seconds)", _, true, 1.0, true, 600.0)
	Cvar_FreezeCt =							CreateConVar("sm_hns_freeze_ct", "1", "Freeze team CT at round start", _, true, 0.0, true, 1.0)
	Cvar_AutoThirdperson =					CreateConVar("sm_hns_auto_thirdperson", "1", "Automaticly set terrorists in thirdperson view at spawn", _, true, 0.0, true, 1.0)
	Cvar_HnsEnabled =						CreateConVar("sm_hns_enable", "1", "Enable Hide And Seek Plugin", _, true, 0.0, true, 1.0)
	Cvar_HnsVersion =						CreateConVar("sm_hns_version", PLUGIN_VERSION, "SM Hide And Seek Version", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY|FCVAR_DONTRECORD)

/*
FUTURE CVARS NAMES MAY CHANGE

	Cvar_ModelChangeLimit =			CreateConVar("sm_hns_model_change_limit", "5","How many time the Terrorists should be able to change model [0 = no limit]", _, true, 0.0, true, 50)
	Cvar_ModelChangeTime =			CreateConVar("sm_hns_model_change_time", "30", "For how long can terrorist change model during a round [0 = no limit] (in seconds)", _, true, 0.0)
	Cvar_ModelAutoChoose =			CreateConVar("sm_hns_model_auto_choose", "1")
	Cvar_WhistleAuto =				CreateConVar
	Cvar_WhistleAutoInterval =		CreateConVar
	Cvar_WhistleDelay =				CreateConVar
*/

	Global_HnsEnabled = GetConVarBool(Cvar_HnsEnabled)

	AutoExecConfig(true, "HideAndSeek")
}