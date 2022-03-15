local plyPos, inBed, bleeding, playerLoaded = GetEntityCoords(cache.ped), false, false, false

-- Functions
local function debug_print(msg)
    if Config.Debug then
        print(msg)
    end
end

local function showAlert(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local function disableActions()
    DisableAllControlActions(0)
    EnableControlAction(0, 1, true)
    EnableControlAction(0, 2, true)
    EnableControlAction(0, 245, true)
    debug_print('Controls disabled')
end

local function startBleedingEffect()
    if playerLoaded then  
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - 2)

        if not bleeding then
            StartScreenEffect('Rampage', 0, true)
            bleeding = true
        end

        showAlert(Config.Notification)
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    end

    Wait(5000)
end

local function stopBleedingEffect()
    bleeding = false
    StopScreenEffect('Rampage')
    SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end

GetTreatment = function(action)
if action    == "CheckIn" then
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
            Async    = true,
            Duration = 22500,
            Label    = "Being treated...",
            Easing   = "easeLinear",
            Radius   = 60, 
            Stroke   = 10,
            DisableControls = {
              Mouse  = false,
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
        exports['mythic_notify']:SendAlert('error', 'You have been treated and can go on your way')
        SetEntityCoords(PlayerPedId(), 316.55, -584.42, 43.32)
        SetEntityHeading(PlayerPedId(), 351.02)
        RequestAnimSet("move_m@drunk@slightlydrunk")
        while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
      end
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@slightlydrunk", true)
        StartScreenEffect('drugsmichaelaliensfightout', 0, true)
         Wait(10000)
        StartScreenEffect('drugsmichaelaliensfightout', 0, true)
         Wait(10000)
        StopAllScreenEffects(PlayerPedId())
      end
     end
   end)
 end
end

local function enterBed(model, data)
    local obj = GetClosestObjectOfType(plyPos.x, plyPos.y, plyPos.z, 3.0, model, 0, 0, 0)
    local objPos = GetEntityCoords(obj)
    data['metadata'] = Config.Data[model].metadata or {0.0, 0.0, 0.0, 0.0}; data['bed'] = Config.Data[model].bed

    inBed = true

    SetEntityCoords(cache.ped, objPos.x, objPos.y, objPos.z + 0.5); SetEntityHeading(cache.ped, GetEntityHeading(obj) - 180)
    FreezeEntityPosition(obj, true); FreezeEntityPosition(cache.ped, true)

    if data.dict then
        lib.requestAnimDict(data.dict)
        TaskPlayAnim(cache.ped, data.dict, data.anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)
    else
        TaskStartScenarioAtPosition(
            cache.ped,
            data.anim,
            objPos.x + data.metadata[1],
            objPos.y + data.metadata[2],
            objPos.z - data.metadata[3],
            GetEntityHeading(obj) + data.metadata[4],
            0,
            true,
            true
        )
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

DisableActions = function()
    DisableAllControlActions(0)
	EnableControlAction(0, 1, true)
	EnableControlAction(0, 2, true)
	EnableControlAction(0, 245, true)
end
-- End of Functions

CreateThread(function()
    Wait(100)

    for k, v in pairs(Config.NPC) do
        lib.requestModel(v.model)
        local ped = CreatePed(4, v.model, v.coords, false, false)
        SetEntityHeading(ped, heading)
        SetEntityAsMissionEntity(ped, true, true)
        SetPedFleeAttributes(ped, 0, 0)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    debug_print('NPC created')
end)

CreateThread(function()
    -- NPC
    local doctor = {}

    for k, v in pairs(Config.NPC) do
        doctor = {v.model}
    end

    exports['qtarget']:AddTargetModel(doctor, {
        options = {
            {
                event = 'openmenu',
                icon = 'fas fa-sign-in-alt',
                label = 'Check In'
            }
        },
        distance = 1.5
    })

    debug_print('NPC target loaded')

-- Events
RegisterNetEvent('qphospital:StartTreatment')
AddEventHandler('qphospital:StartTreatment', function()
    if Config.CostMoney then
        ESX.TriggerServerCallback('qphospital:hasMoney', function(hasMoney)
            if hasMoney then
                TriggerServerEvent('qphospital:payBill', tonumber(Config.BillAmount))
                exports['mythic_notify']:SendAlert('success', 'You have been billed $' .. Config.BillAmount)
                GetTreatment("CheckIn")
                --Nurse()
            elseif not hasMoney then
                return exports['mythic_notify']:SendAlert('error', 'You need $' .. Config.BillAmount .. ' in order to get treated')
            end
        end)
    elseif not Config.CostMoney then
        GetTreatment("CheckIn")
        Nurse()
    end
end)

RegisterNetEvent('openmenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id     = 1,
            header = "Pillbox Hospital",
            txt    = ""
        },
        {
            id     = 2,
            header = "Receive Treatment",
            txt    = "Cost: $" .. Config.BillAmount,
            params = {
                event = "qphospital:StartTreatment",
                args  = {
                }
            }
        },
    })
end)
-- End of Events

-- Bed Entities
exports['qtarget']:AddTargetModel(Config.Beds, {
    options = {
        {
            event  = 'qphospital:typescript',
            icon   = 'fas fa-clipboard',
            label  = 'Sit Down',
            action = function(entity)
                enterBed(GetEntityModel(entity), Config.Animations['sit_down'])
            end
        },
        {
            event  = 'qphospital:typescript',
            icon   = 'fas fa-clipboard',
            label  = 'Lay Down',
            action = function(entity)
                enterBed(GetEntityModel(entity), Config.Animations['lay_down'])
            end
        }
    },
     distance = 1.5
})
  debug_print('BED target loaded')
end)
-- End of Entities

-- Intervals
SetInterval(function()
    plyPos = GetEntityCoords(cache.ped)
end, 2000)

SetInterval(function()
    if inBed then
        local health = GetEntityHealth(cache.ped)

        if health <= 175 then
            SetEntityHealth(cache.ped, health + 1)
        end
    end
end, Config.HealTime * 1000)

SetInterval(function()
    local health = GetEntityHealth(cache.ped)

    if health < 140 then
        startBleedingEffect()
    elseif health > 150 then
        stopBleedingEffect()
    end
end, 5)
-- End of Intervals

-- Key mapping
RegisterKeyMapping('qphospital:getUp', 'Get up', 'keyboard', 'F')
RegisterCommand('qphospital:getUp', function(raw)
    if inBed then
        inBed = false
        
        ClearPedTasksImmediately(cache.ped)
        FreezeEntityPosition(cache.ped, false)
    end
end)
-- End of Key mapping

-- Debug
if Config.Debug then
    RegisterCommand(Config.DebugCommand, function(source, args, rawCommand)
        TriggerEvent('openmenu')
    end)
end
-- End of Debug