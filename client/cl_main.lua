-- CLIENT
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

local player = PlayerPedId()

local function openVendingMenu(machineType)
    local machine = Config.Machines[machineType]
    if not machine then return end

    local menu = {
        { id = 1, header = machine.label, txt = '' }
    }

    for i, item in ipairs(machine.items) do
        menu[#menu+1] = {
            id = i + 1,
            header = ("%s %s$"):format(item.label, item.price),
            txt = '',
            params = {
                event = 'mr-vending:buyItem',
                args = { item = item.item, price = item.price }
            }
        }
    end

    TriggerEvent('nh-context:sendMenu', menu)
end

Citizen.CreateThread(function()
    for machineType, machine in pairs(Config.Machines) do
        exports[Config.Target]:AddTargetModel(machine.models, {
            options = {
                {
                    event = 'mr-vending:open:' .. machineType,
                    icon = machine.icon,
                    label = machine.label
                }
            },
            job = { 'all' },
            distance = 2
        })

        RegisterNetEvent('mr-vending:open:' .. machineType)
        AddEventHandler('mr-vending:open:' .. machineType, function()
            openVendingMenu(machineType)
        end)
    end
end)

RegisterNetEvent('mr-vending:buyItem')
AddEventHandler('mr-vending:buyItem', function(data)
    local item = data.item
    local price = data.price

    TaskPlayAnim(player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent('mr-vending:server:buyItem', item, price)
end)
