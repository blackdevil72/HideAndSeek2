/*
*
* Hide And Seek : Define All The Variablesh Tat Can Be Used In Any Other Files
*
*/

// HideAndSeek Defines
#define PLUGIN_VERSION "2.0 dev"
#define PREFIX "{green}Hide and Seek {default}> {lightgreen}"
#define WHISTLE_MAX_SIZE 7


// HideAndSeek ConVars Initialisation
ConVar Cvar_HnsVersion
ConVar Cvar_HnsEnabled
ConVar Cvar_FreezeCt
ConVar Cvar_FreezeTimeCt

ConVar Cvar_CtHpChangeEnable
ConVar Cvar_CtHpChangeDecrease
ConVar Cvar_CtHpChangeIncrease
ConVar Cvar_CtHpChangeBonus

/*
FUTURE CVARS NAMES MAY CHANGE

ConVar cvar_ModelChangeLimit
ConVar cvar_ModelChangeTime
ConVar cvar_ModelAutoChoose
ConVar cvar_WhistleEnabled
ConVar cvar_WhistlePack
ConVar cvar_WhistleAuto
ConVar cvar_WhistleAutoInterval
ConVar cvar_WhistleLimit
ConVar cvar_WhistleDelay

*/

// Enforced Server Side Configs
char Global_ServerCfg[13][] =
{
	"mp_flashlight",
	"sv_footsteps",
	"mp_limitteams",
	"mp_autoteambalance",
	"mp_freezetime",
	"sv_nonemesis",
	"sv_nomvp",
	"sv_nostats",
	"mp_playerid",
	"sv_allowminmodels",
	"sv_turbophysics",
	"mp_teams_unbalance_limit",
	"mp_show_voice_icons"
}

// Enforced Server Side Configs Value
int Global_ServerCfgValue[13] =
{
	0, // mp_flashlight
	0, // sv_footsteps
	0, // mp_limitteams
	0, // mp_autoteambalance
	0, // mp_freezetime
	1, // sv_nonemesis
	1, // sv_nomvp
	1, // sv_nostats
	1, // mp_playerid
	0, // sv_allowminmodels
	1, // sv_turbophysics
	0, // mp_teams_unbalance_limit
	0 // mp_show_voice_icons
}

int Global_ServerCfgPreviousValue[13]

//HideAndSeek Globals
bool Global_HnsEnabled
bool Global_IsPlayerFreeze[MAXPLAYERS] = false