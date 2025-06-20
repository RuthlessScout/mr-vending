-- SERVER
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function isValidPurchase(item, price)
    for _, machine in pairs(Config.Machines) do
        for _, v in ipairs(machine.items) do
            if v.item == item and v.price == price then
                return true
            end
        end
    end
    return false
end

RegisterServerEvent('mr-vending:server:buyItem')
AddEventHandler('mr-vending:server:buyItem', function(item, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not isValidPurchase(item, price) then return end

    if xPlayer.canCarryItem(item, 1) and xPlayer.getMoney() >= price then
        xPlayer.addInventoryItem(item, 1)
        xPlayer.removeMoney(price)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Вадиш колата от машината'})
    elseif xPlayer.getMoney() < price then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Стотинките не стигнаха, брат!'})
    elseif not xPlayer.canCarryItem(item, 1) then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Джобчетата са ти пълни! Метни нещо'})
    end
end)
