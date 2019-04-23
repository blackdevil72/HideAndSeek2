// Sourcemod includes
#include <cstrike>
#include <sdkhooks>
#include <sdktools>
#include <sourcemod>

// Third party includes
#include <morecolors> // https://forums.alliedmods.net/showthread.php?t=185016
#include <smlib> // https://github.com/bcserv/smlib

// HideAndSeek Includes
#include <hideandseek/include.sp>


// Initialise Plugin
public void OnPlugInStart()
{
	LoadTranslations("HideAndSeek.phrases")
	LoadTranslations("common.phrases")
	Hns_CreateConVar()
	Hns_CreateCAdminCommands()
}