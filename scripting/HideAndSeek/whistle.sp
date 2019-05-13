public Hns_Whistle_LoadWhistleSet()
{
	if (GetConVarInt(Cvar_WhistleSet) == 0)
		Hns_Sounds_LoadWhistleSounds("Default")

	else if (GetConVarInt(Cvar_WhistleSet) == 1)
		Hns_Sounds_LoadWhistleSounds("Whistle")

	else if (GetConVarInt(Cvar_WhistleSet) == 2)
		Hns_Sounds_LoadWhistleSounds("Birds")

	else if (GetConVarInt(Cvar_WhistleSet) == 3)
		Hns_Sounds_LoadWhistleSounds("Custom")

	else
		SetFailState("CVAR sm_hns_whistle_set not correctly setup.")

//	HookConVarChange("sm_hns_whistle_set", Hns_Whistle_LoadNewWhistleSet)
}

public void Hns_Whistle_LoadNewWhistleSet(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if (StringToInt(newValue) == 0)
		Hns_Sounds_LoadWhistleSounds("Default")

	else if (StringToInt(newValue) == 1)
		Hns_Sounds_LoadWhistleSounds("Whistle")

	else if (StringToInt(newValue) == 2)
		Hns_Sounds_LoadWhistleSounds("Birds")

	else if (StringToInt(newValue) == 3)
		Hns_Sounds_LoadWhistleSounds("Custom")

	else
		SetFailState("CVAR sm_hns_whistle_set not correctly setup.")
}

// Play A Whistling Sound From The Loaded Set
public void Hns_Whistle_PlayWhistle(int client)
{
	float ClientPosition[3]
	GetClientAbsOrigin(client, ClientPosition)
	EmitAmbientSound(Global_WhistlePath[GetRandomInt(0, MAX_WHISTLE_SOUNDS-1)], ClientPosition, SOUND_FROM_WORLD, SNDLEVEL_AIRCRAFT, SND_NOFLAGS, SNDVOL_NORMAL, SNDPITCH_NORMAL, 0.0)
}