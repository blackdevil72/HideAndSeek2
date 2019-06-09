/*
*
* Hide And Seek : Models Loading And Change Functions
*
*/

// Load Models From Current Map Config File
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

// Set A Random Model To A Player
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

// Set A Model To A Player
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

// Fix Player Height gor Bugged Models
public void Hns_Models_HeightFix(int client, int& buttons)
{
	if (GetClientTeam(client) == CS_TEAM_T && IsPlayerAlive(client) && Global_ModelsLoaded == true && Global_ModelHeightFix[client] != 0.0)
 	{
		float ClientVelocity[MAXPLAYERS][3]
		Entity_GetAbsVelocity(client, ClientVelocity[client])

		if (ClientVelocity[client][0] == 0.0 && ClientVelocity[client][1] == 0.0 && ClientVelocity[client][2] == 0.0 && !(buttons & IN_FORWARD || buttons & IN_BACK || buttons & IN_MOVELEFT || buttons & IN_MOVERIGHT || buttons & IN_JUMP))
		{
			if (Global_IsModelFixed[client] == false)
			{
				float ClientPosition[MAXPLAYERS][3]
				GetClientAbsOrigin(client, ClientPosition[client])

				ClientPosition[client][2] += Global_ModelHeightFix[client]
				Global_IsModelFixed[client] = true

				SetEntityMoveType(client, MOVETYPE_NONE)
				TeleportEntity(client, ClientPosition[client], NULL_VECTOR, Global_NullVelocity)
			}
		}

		else if (Global_IsPlayerFreeze[client] == false && Global_IsModelFixed[client] == true)
		{
			SetEntityMoveType(client, MOVETYPE_WALK)
			Global_IsModelFixed[client] = false
		}

		// Always disable ducking for that kind of models.
		if (buttons & IN_DUCK)
			buttons &= ~IN_DUCK
	}
}