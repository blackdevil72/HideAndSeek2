public bool Hns_Models_LoadModels()
{
	Global_TotalModels = 0

	Handle Kv_Models = CreateKeyValues("Models")

	char CurrentMap[PLATFORM_MAX_PATH]
	GetCurrentMap(CurrentMap, sizeof(CurrentMap))
	
	char ConfigFilePath[PLATFORM_MAX_PATH]
	BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/HideAndSeek/maps/%s.cfg", CurrentMap)
	PrintToServer("%s", ConfigFilePath)

	char ModelsPath[PLATFORM_MAX_PATH]
	char ModelsCachedPath[PLATFORM_MAX_PATH]

	if (FileToKeyValues(Kv_Models, ConfigFilePath) == false)
	{
		PrintToServer("[SM][HnS] Can't parse Models config file for map %s.", CurrentMap)
		CloseHandle(Kv_Models)

		return false
	}

	else
	{
		KvGotoFirstSubKey(Kv_Models)

		do
		{
			// Get Models Path And Precache It
			KvGetSectionName(Kv_Models, ModelsPath, sizeof(ModelsPath))
			Format(ModelsCachedPath, sizeof(ModelsCachedPath), "models/%s.mdl", ModelsPath)
			PrecacheModel(ModelsCachedPath, true)

			Global_TotalModels++
		}
		while (KvGotoNextKey(Kv_Models))

		CloseHandle(Kv_Models)

		return true
	}
}

public void Hns_Models_SetRandomModel(int client)
{
	if (GetClientTeam(client) == CS_TEAM_T && IsPlayerAlive(client) && Global_ModelsLoaded == true)
	{
		int RandomModel = GetRandomInt(0, Global_TotalModels - 1)
		int CurrentModel = 0

		Handle Kv_Models = CreateKeyValues("Models")

		char CurrentMap[PLATFORM_MAX_PATH]
		GetCurrentMap(CurrentMap, sizeof(CurrentMap))
		
		char ConfigFilePath[PLATFORM_MAX_PATH]
		BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/HideAndSeek/maps/%s.cfg", CurrentMap)

		char ModelsPath[PLATFORM_MAX_PATH]
		char ModelsCachedPath[PLATFORM_MAX_PATH]

		if (FileToKeyValues(Kv_Models, ConfigFilePath) == false)
		{
			CloseHandle(Kv_Models)
		}

		else
		{
			KvGotoFirstSubKey(Kv_Models)

			do
			{
				if (RandomModel == CurrentModel)
				{
					// Get Models Path And Set Model On Player
					KvGetSectionName(Kv_Models, ModelsPath, sizeof(ModelsPath))
					Format(ModelsCachedPath, sizeof(ModelsCachedPath), "models/%s.mdl", ModelsPath)
					SetEntityModel(client, ModelsCachedPath)

					CloseHandle(Kv_Models)
					break
				}

				CurrentModel++
			}
			while (KvGotoNextKey(Kv_Models))

			CloseHandle(Kv_Models)
		}
	}
}

public void Hns_Models_SetModel(int client, int ModelId)
{
	if (GetClientTeam(client) == CS_TEAM_T && IsPlayerAlive(client) && Global_ModelsLoaded == true)
	{
		int CurrentModel = 0

		Handle Kv_Models = CreateKeyValues("Models")

		char CurrentMap[PLATFORM_MAX_PATH]
		GetCurrentMap(CurrentMap, sizeof(CurrentMap))
		
		char ConfigFilePath[PLATFORM_MAX_PATH]
		BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/HideAndSeek/maps/%s.cfg", CurrentMap)

		char ModelsPath[PLATFORM_MAX_PATH]
		char ModelsCachedPath[PLATFORM_MAX_PATH]

		if (FileToKeyValues(Kv_Models, ConfigFilePath) == false)
		{
			CloseHandle(Kv_Models)
		}

		else
		{
			KvGotoFirstSubKey(Kv_Models)

			do
			{
				if (ModelId == CurrentModel)
				{
					// Get Models Path And Set Model On Player
					KvGetSectionName(Kv_Models, ModelsPath, sizeof(ModelsPath))
					Format(ModelsCachedPath, sizeof(ModelsCachedPath), "models/%s.mdl", ModelsPath)
					SetEntityModel(client, ModelsCachedPath)

					CloseHandle(Kv_Models)
					break
				}

				CurrentModel++
			}
			while (KvGotoNextKey(Kv_Models))

			CloseHandle(Kv_Models)
		}
	}
}