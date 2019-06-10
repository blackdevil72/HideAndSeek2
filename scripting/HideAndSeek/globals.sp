/*
*
* Hide And Seek : Define All The Variablesh Tat Can Be Used In Any Other Files
*
*/

// HideAndSeek Defines
#define PLUGIN_VERSION "2.0 dev"
#define PREFIX "{green}Hide and Seek {default}> {lightgreen}"
#define SERVER_CFG_ARRAY 13
#define MAX_WHISTLE_SOUNDS 7


// HideAndSeek ConVars Initialisation
ConVar Cvar_HnsVersion
ConVar Cvar_HnsEnabled
ConVar Cvar_FreezeCt
ConVar Cvar_FreezeTimeCt

ConVar Cvar_WhistleEnabled
ConVar Cvar_WhistleSet

ConVar Cvar_WhistleLimit

ConVar Cvar_CtHpChangeEnable
ConVar Cvar_CtHpChangeDecrease
ConVar Cvar_CtHpChangeIncrease
ConVar Cvar_CtHpChangeBonus

ConVar Cvar_CtDisableKnifeRightClick

/*
FUTURE CVARS NAMES MAY CHANGE

ConVar Cvar_ModelChangeLimit
ConVar Cvar_ModelChangeTime
ConVar Cvar_ModelAutoChoose
ConVar Cvar_WhistleAuto
ConVar Cvar_WhistleAutoInterval
ConVar Cvar_WhistleDelay

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
int Global_ServerCfgValue[SERVER_CFG_ARRAY] =
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

// Enforced Server Cvars Previous Value
int Global_ServerCfgPreviousValue[SERVER_CFG_ARRAY]

//HideAndSeek Globals
bool Global_HnsEnabled
bool Global_IsModelFixed[MAXPLAYERS] = false
bool Global_IsPlayerFreeze[MAXPLAYERS] = false
bool Global_ModelsLoaded

char Global_WhistlePath[MAX_WHISTLE_SOUNDS][PLATFORM_MAX_PATH]

float Global_ModelHeightFix[MAXPLAYERS]
float Global_NullVelocity[3] = {0.0, 0.0, 0.0}

int Global_TotalModels
int Global_PlayerWhistleCount[MAXPLAYERS]
int Global_FakeModel[MAXPLAYERS] = -1

// Offsets
int Offset_fFlags