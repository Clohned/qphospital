local ox_inventory = exports.ox_inventory

if Config.VersionCheck then
    lib.versionCheck("ohqpr/qphospital")
end

lib.callback.register("qphospital:signIn", function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local returnable = nil

    if xPlayer then
        if ox_inventory:GetItem(src, 'money').count >= Config.BillAmount then
            ox_inventory:RemoveItem(src, 'money', Config.BillAmount)
            returnable = true
        else
            returnable = false
        end
    else
        returnable = false
    end

    while returnable == nil do Wait(50) end; return returnable
end)
