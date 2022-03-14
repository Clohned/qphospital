local yarnlock = {}
local rainydays = false
local rbleu = false
local cockandballs = false
local darling = 0
local pap = 0
local spud = GetEntityCoords(PlayerPedId())
local Notification
local bleeding = false
-------------------------------
        -- NPC --
-------------------------------
CreateThread(function()
    Wait(100)
    for _,v in pairs (Config.NPC) do
    if DoesEntityExist(ped) then
    DeletePed(ped)
  end
    Wait(250)
    ped = CreateHospitalPed(v.model, v.coords, v.heading)
  end
end)
-------------------------------
       -- Healing --
-------------------------------
CreateThread(function()
    while true do
      ply = PlayerPedId()
      spud = GetEntityCoords(PlayerPedId())
      Wait(1000)
   end
end)

CreateThread(function()
    while Config.HealTime ~= 0 do
        Wait(Config.HealTime * 1000)
        if rbleu == true then
        if yarnlock.darlingwhite == true then
        local ply = PlayerPedId()
        local health = GetEntityHealth(ply)
        if health <= 199 then
        SetEntityHealth(ply, health + 1)
      end
     end
    end
   end
end)
-------------------------------
       -- Exports --
-------------------------------
CreateThread(function()
    local doctor = {}
    for _,v in pairs (Config.NPC) do
        doctor = {v.model}
    end
    exports['qtarget']:AddTargetModel(doctor, {
        options = {
            {
                event = "openmenu",
                icon = "fas fa-sign-in-alt",
                label = "Check In",
            },
        },
        distance = 1.5
    })
end)

CreateThread(function()                
	exports['qtarget']:AddTargetModel(Config.Beds, {
        options = {
            {
                event = "qphospital:typescript",
                icon = "fas fa-clipboard",
                label = "Sit Down",
                anim = "sit"
            },
            {
                event = "qphospital:typescript",
                icon = "fas fa-clipboard",
                label = "Lay Down",
                anim = "back"
            },

        },
        job = {"all"},
        distance = 3.5
    })

end)
-------------------------------
        -- Events --
-------------------------------
RegisterNetEvent('qphospital:StartTreatment')
AddEventHandler('qphospital:StartTreatment', function()
    if Config.CostMoney then
        ESX.TriggerServerCallback('qphospital:hasMoney', function(hasMoney)
            if hasMoney then
                TriggerServerEvent('qphospital:payBill', tonumber(Config.BillAmount))
                exports['notify']:Alert("Pillbox Hospital", "You have been billed $500", 5725, 'treated')
                --exports['mythic_notify']:DoHudText('success', 'You have been billed $' .. Config.BillAmount)
                GetTreatment("CheckIn")
                Nurse()
            elseif not hasMoney then
                return exports['notify']:Alert("Notice", "You do not have enough money to get treated", 5725, 'checkin')
                --return exports['mythic_notify']:DoHudText('error', 'You need $' .. Config.BillAmount .. ' in order to get treated.')
            end
        end)
    elseif not Config.CostMoney then
        GetTreatment("CheckIn")
        Nurse()
    end
end)
-------------------------------
   -- Context menu event --
-------------------------------
RegisterNetEvent('openmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Pillbox Hospital",
            txt = ""
        },
        {
            id = 2,
            header = "Receive Treatment",
            txt = "Cost: $" .. Config.BillAmount,
            params = {
                event = "qphospital:StartTreatment",
                args = {
                }
            }
        },
    })
end)
-------------------------------
      -- Prop events --
-------------------------------
RegisterNetEvent('qphospital:typescript')
AddEventHandler('qphospital:typescript', function(data)
    Anim = data.anim
    local hash = GetEntityModel(data.entity)
    local shesmyheart = GetClosestObjectOfType(spud.x, spud.y, spud.z, 3.0, hash, 0, 0, 0)
    local vuestand = GetEntityCoords(shesmyheart)
    local bbw = #(vuestand - spud)
    if (bbw < 3.0 and shesmyheart ~= 0) then
    if (bbw < 1.5) then
        yarnlock = {
            golang = shesmyheart,
            golangCoords = vuestand,
            golangcX = Config.Props.area[hash].metadataone,
            golangcY = Config.Props.area[hash].metadatatwo,
            golangcZ = Config.Props.area[hash].metadatathree,
            golangDir = Config.Props.area[hash].metadatafour,
            darlingwhite = Config.Props.area[hash].bed
        }
     end
    end
    if yarnlock.golang then
        local object = yarnlock.golang
        local vertx = yarnlock.golangcX
        local verty = yarnlock.golangcY
        local vertz = yarnlock.golangcZ
        local dir = yarnlock.golangDir
        local daysarecoming = yarnlock.darlingwhite
        local beanflicker = yarnlock.golangCoords
        
        local ped = PlayerPedId()
        darling = GetEntityCoords(ped)
        FreezeEntityPosition(object, true)
        FreezeEntityPosition(ped, true)
        rbleu = true
        if daysarecoming == false then
        if Config.Props.sitonbed.dict ~= nil then
            SetEntityCoords(ped, beanflicker.x, beanflicker.y, beanflicker.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.Props.sitonbed.dict
            local anim = Config.Props.sitonbed.anim
                
            AnimLoadDict(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.Props.sitonbed.anim, beanflicker.x + vertx, beanflicker.y + verty, beanflicker.z - vertz, GetEntityHeading(object) + dir, 0, true, true)
        end
    else
        if Anim == 'back' then
            if Config.Props.layonback.dict ~= nil then
            SetEntityCoords(ped, beanflicker.x, beanflicker.y, beanflicker.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.Props.layonback.dict
            local anim = Config.Props.layonback.anim
                    
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.Props.layonback.anim, beanflicker.x + vertx, beanflicker.y + verty, beanflicker.z - vertz, GetEntityHeading(object) + dir, 0, true, true
        )
        end
    elseif Anim == 'stomach' then
        if Config.Props.layonstomach.dict ~= nil then
            SetEntityCoords(ped, beanflicker.x, beanflicker.y, beanflicker.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.Props.layonstomach.dict
            local anim = Config.Props.layonstomach.anim
                    
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.Props.layonstomach.anim, beanflicker.x + vertx, beanflicker.y + verty, beanflicker.z - vertz, GetEntityHeading(object) + dir, 0, true, true)
        end
    elseif Anim == 'sit' then
        if Config.Props.smallcock.dict ~= nil then
            SetEntityCoords(ped, beanflicker.x, beanflicker.y, beanflicker.z + 0.5)
            SetEntityHeading(ped, GetEntityHeading(object) - 180.0)
            local dict = Config.Props.smallcock.dict
            local anim = Config.Props.smallcock.anim
                    
            Animation(dict, anim, ped)
        else
            TaskStartScenarioAtPosition(ped, Config.Props.smallcock.anim, beanflicker.x + vertx, beanflicker.y + verty, beanflicker.z - vertz, GetEntityHeading(object) + 180.0, 0, true, true)
        end
      end
    end
  end
end)
-------------------------------
       -- Functions --
-------------------------------
GetTreatment = function(action)
if action == "CheckIn" then
    SetEntityCoords(PlayerPedId(), 351.37716674805, -583.1494140625, 44.206405639648 + 0.3)
    TriggerEvent('esx_ambulancejob:revive', PlayerPedId())
    SetEntityHealth(PlayerPedId(), 200)
    Wait(1000)
    TreatmentInProgress()
    Wait(500)
    CreateThread(function()
        local CheckIn = true
        while CheckIn do
        if currentView ~= 4 then
        DisableActions(PlayerPedId())
        exports.rprogress:Custom({
            Async = true,
            Duration = 22500,
            Label = "Being treated...",
            Easing = "easeLinear",
            Radius = 60, 
            Stroke = 10,
            DisableControls = {
                Mouse = false,
                Player = true
                }
            },
            function(e)
            if not e then
            ClearPedTasks(PlayerPedId())
            end
        end)
        Wait(22500)
        ClearPedTasksImmediately(PlayerPedId())
        CheckIn = false
        DoScreenFadeIn(50)
        exports['notify']:Alert("Pillbox Hospital", "You have been treated and can go on your way", 5725, 'treated')
        --exports['mythic_notify']:DoHudText('error', 'You have been treated and can go on your way.')
        SetEntityCoords(PlayerPedId(), 316.55, -584.42, 43.32)
        SetEntityHeading(PlayerPedId(), 351.02)
        RequestAnimSet("move_m@drunk@slightlydrunk")
        while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Wait(0)
        end
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@slightlydrunk", true)
        StartScreenEffect('drugsmichaelaliensfightout', 0, true)
        Wait(10000)
        StartScreenEffect('drugsmichaelaliensfightout', 0, true)
        Wait(10000)
        StopAllScreenEffects(PlayerPedId())
        ResetPedMovementClipset(PlayerPedId(), 0)
      end
     end
   end)
 end
end

TreatmentInProgress = function()
    SetEntityCoords(PlayerPedId(), 317.88, -585.21, 44.22 + 0.3)
    RequestAnimDict('anim@gangops@morgue@table@')
    while not HasAnimDictLoaded('anim@gangops@morgue@table@') do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), 'anim@gangops@morgue@table@' , 'ko_front' ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(PlayerPedId(), 335.05)
    InAction = true
end

Nurse = function()
    modelHash = `a_m_m_prolhost_01`
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
    Wait(1)
    end

    local NurseNPC = CreatePed(5, modelHash, 316.82, -579.40, 43.30, 178.70, false, false)
    SetEntityAsMissionEntity(NurseNPC)
	SetEntityInvincible(NurseNPC, true)
    Wait(1500)

    SetPedDesiredHeading(NurseNPC, 178.70)
    Wait(100)

    TaskGoStraightToCoord(NurseNPC, 316.67, -585.20, 43.28, 1.0, 5000, 251.89, 2.0)
    Wait(5000)

    TaskStartScenarioInPlace(NurseNPC, "PROP_HUMAN_BUM_BIN", 0, false)
    Wait(40000)
    TaskGoStraightToCoord(NurseNPC, 342.41, -581.68, 42.41, 1.0, 5000, 70.50, 2.0)
    Wait(5000)
    DeleteEntity(NurseNPC)
end

startAnim = function(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
	 TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
  end)
end

loadAnimDict = function(dict)
  while (not HasAnimDictLoaded(dict)) do
	RequestAnimDict(dict)
	 Citizen.Wait(5)
  end
end

DisableActions = function()
    DisableAllControlActions(0)
	EnableControlAction(0, 1, true)
	EnableControlAction(0, 2, true)
	EnableControlAction(0, 245, true)
end

CreateHospitalPed = function(hash, coords, heading, animDict, animName)
    RequestModel(GetHashKey(hash))
    while not HasModelLoaded(GetHashKey(hash)) do
        Wait(5)
    end
    local ped = CreatePed(5, hash, coords, false, false)
    SetEntityHeading(ped, heading)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedFleeAttributes(ped, 0, 0)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    while not TaskPlayAnim(ped, animDict, animName, 0.0, 1.0, -1, 17, 0, 0, 0, 0) do
        Wait(1000)
    end
    return ped
end
-------------------------------
   -- Bleeding function --
-------------------------------
function GetPed() return PlayerPedId() end
function GetCar() return GetVehiclePedIsIn(PlayerPedId(),false) end

function StartBleedingEffect(ped)
   SetEntityHealth(ped,GetEntityHealth(ped)-2)
    if not bleeding then
   StartScreenEffect('Rampage', 0, true)
    bleeding = true
end

   SetTextFont(Notification)
   ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
   Bleeding(Config.Notification)
   SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
   Wait(5000)
end
 
 function StopBleedingEffect(ped)
   bleeding = false
   StopScreenEffect('Rampage')
   SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end
 
 Citizen.CreateThread(function()
  while true do
   Wait(0)
  local player = GetPlayerPed(-1)
  local Health = GetEntityHealth(player)
 
  if Health <= 140  then
	 StartBleedingEffect(player)
 
  elseif Health > 150 then
	StopBleedingEffect(player)
   end
  end
 end)
  
 function Bleeding(text)
 SetNotificationTextEntry("STRING")
 AddTextComponentString(text)
 DrawNotification(false, false)
 end
-------------------------------
      -- Key mapping --
-------------------------------
RegisterKeyMapping('qphospital:vue', 'Get up', 'keyboard', 'F')
RegisterCommand('qphospital:vue', function(raw)
if rbleu then
    rbleu = false
    ClearPedTasksImmediately(ply)
    FreezeEntityPosition(ply, false)
    
    local x, y, z = table.unpack(darling)
    if GetDistanceBetweenCoords(x, y, z, spud) < 10 then
        SetEntityCoords(ply, darling)
    end
    yarnlock = {}
  end
end)

function Animation(dict, anim, ped)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(0)
  end
  TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)
end
-------------------------------
        -- Debug --
-------------------------------
if Config.Debug then
    RegisterCommand("treatmenttest", function(source, args, rawCommand)
        TriggerEvent('openmenu')
    end)
end

