/*
*
* Hide And Seek: Load Every Sounds Needed By The Plugin
*
*/

// Load Sounds From The Game
public void Hns_Sounds_LoadGameSounds()
{
	PrecacheSound("radio/go.wav", true)
	PrecacheSound("buttons/weapon_cant_buy.wav", true)
}

// Load Sounds From The Plugin
public void Hns_Sounds_LoadWhistleSounds(const char WhistleSetName[PLATFORM_MAX_PATH])
{
	Handle Kv_SetsList = CreateKeyValues("SetsList")

	char ConfigFilePath[PLATFORM_MAX_PATH]
	BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/hideandseek/whistle/setsList.cfg")

	char WhistleCachedPath[MAX_WHISTLE_SOUNDS][PLATFORM_MAX_PATH]
	char WhistlePosition[2]

	if (FileToKeyValues(Kv_SetsList, ConfigFilePath))
	{
		// Default Engine Sounds
		if (StrEqual(WhistleSetName, "Default"))
		{
			if (KvJumpToKey(Kv_SetsList, WhistleSetName))
			{
				for (int ArrayPosition = 0; ArrayPosition <= MAX_WHISTLE_SOUNDS - 1; ArrayPosition++)
				{
					IntToString(ArrayPosition, WhistlePosition, sizeof(WhistlePosition))
					KvGetString(Kv_SetsList, WhistlePosition, Global_WhistlePath[ArrayPosition], PLATFORM_MAX_PATH)
					PrecacheSound(Global_WhistlePath[ArrayPosition], true)
				}
			}

			else
			{
				CloseHandle(Kv_SetsList)
				SetFailState("[SM][HnS] configs/hideandseek/whistle/setslist.cfg not correctly structured.")
			}
		}

		// Other packs of sounds
		else
		{
			if (KvJumpToKey(Kv_SetsList, WhistleSetName))
			{
				for (int ArrayPosition = 0; ArrayPosition <= MAX_WHISTLE_SOUNDS - 1; ArrayPosition++)
				{
					IntToString(ArrayPosition, WhistlePosition, sizeof(WhistlePosition))
					KvGetString(Kv_SetsList, WhistlePosition, Global_WhistlePath[ArrayPosition], PLATFORM_MAX_PATH)

					if (StrEqual(Global_WhistlePath[ArrayPosition], ""))
					{
						CloseHandle(Kv_SetsList)
						SetFailState("[SM][HnS] configs/hideandseek/whistle/setslist.cfg not correctly structured.")
					}

					else
					{
						PrecacheSound(Global_WhistlePath[ArrayPosition], true)
						Format(WhistleCachedPath[ArrayPosition], PLATFORM_MAX_PATH, "sound/%s", Global_WhistlePath[ArrayPosition])
						AddFileToDownloadsTable(WhistleCachedPath[ArrayPosition])
					}
				}
			}

			else
			{
				CloseHandle(Kv_SetsList)
				SetFailState("[SM][HnS] configs/hideandseek/whistle/setslist.cfg not correctly structured.")
			}
		}
	}

	else
	{
		CloseHandle(Kv_SetsList)
		SetFailState("[SM][HnS] configs/hideandseek/whistle/setslist.cfg not found.")
	}

	CloseHandle(Kv_SetsList)
	PrintToServer("[SM][HnS] Loading whistle: %s", WhistleSetName)
}