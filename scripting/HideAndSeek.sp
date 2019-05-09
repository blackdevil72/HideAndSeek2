// Sourcemod Includes
#include <cstrike>
#include <sdkhooks>
#include <sdktools>
#include <sourcemod>

// Third Party Includes
#include <morecolors> // https://forums.alliedmods.net/showthread.php?t=185016
#include <smlib> // https://github.com/bcserv/smlib

// HideAndSeek Includes
#include "HideAndSeek/globals.sp"
#include "HideAndSeek/convars.sp"
#include "HideAndSeek/commands.sp"
#include "HideAndSeek/hooks.sp"
#include "HideAndSeek/events.sp"
#include "HideAndSeek/freeze.sp"
#include "HideAndSeek/misc.sp"
#include "HideAndSeek/models.sp"
#include "HideAndSeek/timers.sp"
#include "HideAndSeek/team_t.sp"
#include "HideAndSeek/team_ct.sp"
#include "HideAndSeek/sounds.sp"

public Plugin myinfo =
{
	name = "Cs:S Hide and Seek",
	author = "Version 2: blackdevil72 | Version 1 credits to: Selax & Peace-Maker for the original idea",
	description = "Terrorists set a model and hide, CT seek them.",
	version = PLUGIN_VERSION,
	url = "https://github.com/blackdevil72/"
}

public void OnPluginStart()
{
	LoadTranslations("HideAndSeek.phrases")
	LoadTranslations("common.phrases")
	Hns_Convars_CreateCvars()
	Hns_Hooks_CreateHooks()
	Hns_Commands_CreateCommands()
	Hns_Commands_CreateAdminCommands()

	PrintToServer("[SM][HNS] HideAndSeeek %s load successfull", PLUGIN_VERSION)
}

public void OnConfigsExecuted()
{
	Hns_Misc_ForceServerCfg()
	Hns_Sounds_LoadGameSounds()
	Hns_Models_LoadModels()
}

public void OnClientPutInServer(int client)
{
	Hns_Hooks_CreateSdkHooks(client)
}