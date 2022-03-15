if Config.VersionCheck then
    lib.versionCheck("ohqpr/qphospital")
end

lib.callback.register("qphospital:signIn", function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local returnable = nil

    if xPlayer then
        if xPlayer.getMoney() >= Config.BillAmount then
            xPlayer.removeAccountMoney('money', Config.BillAmount)
            returnable = true
        else
            returnable = false
        end
    else
        returnable = false
    end

    while returnable == nil do Wait(50) end; return returnable
end)

ESX.RegisterServerCallback('qphospital:hasMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = xPlayer.getMoney()
    if cash >= Config.BillAmount then
        cb(true)
    else
        cb(false)
    end
end)
