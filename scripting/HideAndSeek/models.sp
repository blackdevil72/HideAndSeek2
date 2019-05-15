public bool Hns_Models_LoadModels()
{
	Global_TotalModels = 0

	Handle Kv_Models = CreateKeyValues("Models")

	char CurrentMap[PLATFORM_MAX_PATH]
	GetCurrentMap(CurrentMap, sizeof(CurrentMap))
	
	char ConfigFilePath[PLATFORM_MAX_PATH]
	BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/hideandseek/maps/%s.cfg", CurrentMap)

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
		BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/hideandseek/maps/%s.cfg", CurrentMap)

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

					Global_ModelHeightFix[client] = KvGetFloat(Kv_Models, "heightfix", 0.0)

					CreateTimer(2.0, Hns_Timers_HeightFix, client)

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
		BuildPath(Path_SM, ConfigFilePath, sizeof(ConfigFilePath), "configs/hideandseek/maps/%s.cfg", CurrentMap)

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

					Global_ModelHeightFix[client] = KvGetFloat(Kv_Models, "heightfix", 0.0)

					CreateTimer(2.0, Hns_Timers_HeightFix, client)

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

public void Hns_Models_HeightFix(int client)
{
	float ClientPosition[MAXPLAYERS][3]
	float ClientPreviousHeight[MAXPLAYERS]

	if (IsPlayerAlive(client) && Global_ModelHeightFix[client] != 0.0)
	{
		GetClientAbsOrigin(client, ClientPosition[client])

		if (ClientPreviousHeight[client] != ClientPosition[client][2])
		{
			ClientPosition[client][2] = ClientPosition[client][2] + Global_ModelHeightFix[client]
			ClientPreviousHeight[client] = ClientPosition[client][2]

			//TeleportEntity(client, NULL_VECTOR, NULL_VECTOR, Global_NullVelocity)
			TeleportEntity(client, ClientPosition[client], NULL_VECTOR, Global_NullVelocity)
			//SetEntityMoveType(client, MOVETYPE_NONE)
		}
		
		CreateTimer(0.1, Hns_Timers_HeightFix, client)
		//Hns_Models_HeightFix(client)
	}
}