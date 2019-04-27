// Sourcemod includes
#include <cstrike>
#include <sdkhooks>
#include <sdktools>
#include <sourcemod>

// Third party includes
#include <morecolors> // https://forums.alliedmods.net/showthread.php?t=185016
#include <smlib> // https://github.com/bcserv/smlib

// HideAndSeek Includes
#include "HideAndSeek/globals.sp"
#include "HideAndSeek/convars.sp"
#include "HideAndSeek/hooks.sp"
#include "HideAndSeek/events.sp"
#include "HideAndSeek/commands.sp"

// Initialise Plugin
public void OnPlugInStart()
{
	LoadTranslations("HideAndSeek.phrases")
	LoadTranslations("common.phrases")
	Hns_CreateConVar()
	Hns_CreateHooks()
	Hns_CreateCommands()
	Hns_CreateAdminCommands()
	Hns_HooksEvents()
}

public void OnPlugInEnd()
{

}