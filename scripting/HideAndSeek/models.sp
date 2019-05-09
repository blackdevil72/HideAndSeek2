public Hns_Models_LoadModels()
{
	Global_TotalModels = 0

	Handle Kv_Models = CreateKeyValues("Models")

	char CurrentMap[PLATFORM_MAX_PATH]
	GetCurrentMap(CurrentMap, sizeof(CurrentMap))
	
	char ConfigFile[PLATFORM_MAX_PATH]
	BuildPath(Path_SM, ConfigFile, sizeof(ConfigFile), "configs/HideAndSeek/maps/%s.cfg", CurrentMap)

	char ModelsPath[PLATFORM_MAX_PATH]
	char ModelsCachePath[PLATFORM_MAX_PATH]

	if (!FileToKeyValues(Kv_Models, ConfigFile))
	{
		PrintToServer("Can't parse modelconfig file for map %s.", CurrentMap)
		CloseHandle(Kv_Models)

		return
	}

	else
	{
		FileToKeyValues(Kv_Models, ConfigFile)

		KvGotoFirstSubKey(Kv_Models)

		do
		{
			// Get Models Path And Precache It
			KvGetSectionName(Kv_Models, ModelsPath, sizeof(ModelsPath))
			FormatEx(ModelsCachePath, sizeof(ModelsCachePath), "models/%s.mdl", ModelsPath)
			PrecacheModel(ModelsCachePath, true)

			Global_TotalModels++
		}

		while (KvGotoNextKey(Kv_Models))

		CloseHandle(Kv_Models)

		return
	}
}

public Hns_Models_SetRandomModel(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T&& IsPlayerAlive(client) == true)
	{
		int RandomModel = GetRandomInt(0, Global_TotalModels - 1)
		int CurrentModel = 0

		Handle Kv_Models = CreateKeyValues("Models")

		char CurrentMap[PLATFORM_MAX_PATH]
		GetCurrentMap(CurrentMap, sizeof(CurrentMap))
		
		char ConfigFile[PLATFORM_MAX_PATH]
		BuildPath(Path_SM, ConfigFile, sizeof(ConfigFile), "configs/HideAndSeek/maps/%s.cfg", CurrentMap)

		char ModelsPath[PLATFORM_MAX_PATH]
		char ModelsCachePath[PLATFORM_MAX_PATH]

		FileToKeyValues(Kv_Models, ConfigFile)

		if (!FileToKeyValues(Kv_Models, ConfigFile))
		{
			CloseHandle(Kv_Models)

			return
		}

		else
		{
			FileToKeyValues(Kv_Models, ConfigFile)

			KvGotoFirstSubKey(Kv_Models)

			do
			{
				if (RandomModel == CurrentModel)
				{
					// Get Models Path And Set It On Player
					KvGetSectionName(Kv_Models, ModelsPath, sizeof(ModelsPath))
					FormatEx(ModelsCachePath, sizeof(ModelsCachePath), "models/%s.mdl", ModelsPath)
					SetEntityModel(client, ModelsCachePath)

					CloseHandle(Kv_Models)
					break
				}

				CurrentModel++
			}

			while (KvGotoNextKey(Kv_Models))

			CloseHandle(Kv_Models)

			return
		}
	}
}