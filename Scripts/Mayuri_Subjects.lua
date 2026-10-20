-- ===========================================================================
-- Подопытные: захват при убийстве + бонус Науки в НИИ Синигами.
-- Базовая величина растёт с эпохой игрока. Подопытный II даёт x2.
-- ===========================================================================

local DISTRICT_TYPE  = "DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE"
local LEADER_TYPE    = "LEADER_MAYURI_KUROTSUCHI"
local SUBJECT_1_TYPE = "UNIT_SDRI_SUBJECT"
local SUBJECT_2_TYPE = "UNIT_SDRI_SUBJECT_2"

local ELITE_UNITS = {
    UNIT_SDRI_OPERATIVE     = true,
    UNIT_SDRI_LIEUTENANT    = true,
    UNIT_SDRI_LINE_INFANTRY = true,
}

local SUBJECT_MULT = {
    UNIT_SDRI_SUBJECT   = 1,
    UNIT_SDRI_SUBJECT_2 = 2,
}

local ERA_BASE_SCIENCE = { [0]=50, 100, 150, 250, 350, 550, 800, 1000, 1200 }

-- ============================= Helpers ==============================

local function IsMayuriPlayer(playerID)
    local cfg = PlayerConfigurations[playerID]
    if cfg == nil then return false end
    return cfg:GetLeaderTypeName() == LEADER_TYPE
end

local function GetEraScience(playerID)
    local era = 0
    local ok, v = pcall(function() return Players[playerID]:GetEras():GetEra() end)
    if ok and v then era = v end
    return ERA_BASE_SCIENCE[era] or ERA_BASE_SCIENCE[8]
end

local function IsSRIPlot(plot)
    local di = GameInfo.Districts[DISTRICT_TYPE]
    if di == nil or plot == nil then return false end
    if plot:GetDistrictType() ~= di.Index then return false end
    local ok, result = pcall(function()
        local d = CityManager.GetDistrictAt(plot:GetX(), plot:GetY())
        return d ~= nil and d:IsComplete() and not d:IsPillaged()
    end)
    if not ok then return false end
    return result
end

-- ===================== Subject → Science (district) =================

local function TryConsumeSubject(playerID, unit)
    local info = GameInfo.Units[unit:GetType()]
    local mult = info and SUBJECT_MULT[info.UnitType]
    if mult == nil then return false end

    local plot = Map.GetPlot(unit:GetX(), unit:GetY())
    if not IsSRIPlot(plot) then return false end

    local techs = Players[playerID]:GetTechs()
    if techs == nil or techs:GetResearchingTech() == -1 then return false end

    local amount = GetEraScience(playerID) * mult
    local ok = pcall(function() techs:ChangeCurrentResearchProgress(amount) end)
    if not ok then return false end
    print("Mayuri: +" .. amount .. " science (player " .. playerID .. ")")
    UnitManager.Kill(unit)
    return true
end

local function ScanPlayerUnits(playerID)
    local player = Players[playerID]
    if player == nil or not player:IsAlive() then return end
    for _, unit in player:GetUnits():Members() do
        TryConsumeSubject(playerID, unit)
    end
end

GameEvents.PlayerDoTurn.Add(ScanPlayerUnits)

if Events.UnitMoveComplete then
    Events.UnitMoveComplete.Add(function(playerID, unitID)
        local player = Players[playerID]
        if player == nil then return end
        local unit = player:GetUnits():FindID(unitID)
        if unit then TryConsumeSubject(playerID, unit) end
    end)
end

-- ==================== Subject spawning (combat) =====================

local function OnCombat(combatResult)
    local ok, err = pcall(function()
        local att = combatResult[CombatResultParameters.ATTACKER]
        local def = combatResult[CombatResultParameters.DEFENDER]

        local defDead = def[CombatResultParameters.FINAL_DAMAGE_TO]
                     >= def[CombatResultParameters.MAX_HIT_POINTS]
        local attDead = att[CombatResultParameters.FINAL_DAMAGE_TO]
                     >= att[CombatResultParameters.MAX_HIT_POINTS]

        local ourPlayerID, ourUnitID

        if defDead then
            local aID = att[CombatResultParameters.ID]
            if IsMayuriPlayer(aID.player) then
                ourPlayerID = aID.player
                ourUnitID   = aID.id
            end
        end

        if ourPlayerID == nil and attDead then
            local dID = def[CombatResultParameters.ID]
            if IsMayuriPlayer(dID.player) then
                ourPlayerID = dID.player
                ourUnitID   = dID.id
            end
        end

        if ourPlayerID == nil then return end

        local player = Players[ourPlayerID]
        if player == nil then return end
        local unit = player:GetUnits():FindID(ourUnitID)
        if unit == nil then return end

        local unitInfo = GameInfo.Units[unit:GetType()]
        if unitInfo == nil then return end
        local isElite = ELITE_UNITS[unitInfo.UnitType] == true
        local subType = isElite and SUBJECT_2_TYPE or SUBJECT_1_TYPE
        local subInfo = GameInfo.Units[subType]
        if subInfo == nil then return end

        local x, y = unit:GetX(), unit:GetY()
        local spawned = player:GetUnits():Create(subInfo.Index, x, y)
        if spawned then
            print("Mayuri: spawned " .. subType .. " at (" .. x .. "," .. y .. ")")
        end
    end)
    if not ok then
        print("Mayuri OnCombat error: " .. tostring(err))
    end
end

Events.Combat.Add(OnCombat)
print("Mayuri_Subjects: loaded")
