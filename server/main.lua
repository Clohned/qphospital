RegisterServerEvent('qphospital:payBill')
AddEventHandler('qphospital:payBill', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = xPlayer.getMoney()
    if cash >= Config.BillAmount then
        xPlayer.removeMoney(amount)
    end
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
