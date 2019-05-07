/*
*
* Hide And Seek : Define All The Variables that May be Used In Any Files
*
*/

// HideAndSeek Defines
#define PLUGIN_VERSION "2.0 dev"
#define PREFIX "{green}Hide and Seek {default}> {lightgreen}"
#define WHISTLE_MAX_SIZE 7


// HideAndSeek ConVars Initialisation
ConVar Cvar_HnsVersion
ConVar Cvar_HnsEnabled

ConVar Cvar_CtHpChangeEnable
ConVar Cvar_CtHpChangeDecrease
ConVar Cvar_CtHpChangeIncrease
ConVar Cvar_CtHpChangeBonus

/*
FUTURE CVARS NAMES MAY CHANGE

ConVar cvar_FreezeCt
ConVar cvar_FreezeTimeCt
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

//HideAndSeek Globals
bool Global_HnsEnabled