--SERVER
ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("mr-vending:server:check")
AddEventHandler("mr-vending:server:check", function(item,price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if  xPlayer.canCarryItem(item, 1) and xPlayer.getMoney() >= price then 
        xPlayer.addInventoryItem(item, 1)
        xPlayer.removeMoney(price)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Вадиш колата от машината'})
    elseif xPlayer.getMoney() < price then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Стотинките не стигнаха, брат!'})
    elseif not xPlayer.canCarryItem(item, 1) then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Джобчетата са ти пълни! Метни нещо'})
    end
end)





