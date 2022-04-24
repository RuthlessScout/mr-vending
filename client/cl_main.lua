--CLIENT
local player = PlayerPedId(-1)
Citizen.CreateThread(function()
   local drinkvendings = { 
        `prop_vend_soda_01`,
        `prop_vend_soda_02`,
        `prop_vend_water_01`,
    }
    exports[Config.Target]:AddTargetModel(drinkvendings, {
        options = {
            {
                event = "mr-vending:sodamach",
                icon = "fas fa-glass-whiskey",
                label = "Напитки",
            },
        },
        job = {'all'},
        distance = 2
    })
    local foodvendings = { 
        `prop_vend_snak_01`,
        `prop_vend_snak_01_tu`,    
    }
    exports[Config.Target]:AddTargetModel(foodvendings, {
        options = {
            {
                event = "mr-vending:vendingmach",
                icon = "fas fa-hotdog",
                label = "Вендинг машина",
            },
        },
        job = {'all'},
        distance = 2
    })
    local coffeevendings = { 
        `prop_vend_coffe_01`,
    }
    exports[Config.Target]:AddTargetModel(coffeevendings, {
        options = {
            {
                event = "mr-vending:coffemach",
                icon = "fas fa-mug-hot",
                label = "Кафе машина",
            },
        },
        job = {'all'},
        distance = 2
    })

    local vodu = { 
        `prop_watercooler_dark`,
        `prop_watercooler`,
        `watercooler_bottle001`,
        `prop_vend_water_01`,
    }
    exports[Config.Target]:AddTargetModel(vodu, {
        options = {
            {
                event = "mr-vending:waterdis",
                icon = "fas fa-water",
                label = "Диспенсер за вода",
            },
        },
        job = {'all'},
        distance = 2
    })

    Citizen.Wait(0)
end)




RegisterNetEvent('mr-vending:sodamach', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Машина за соди",
            txt = ""
        },
        {
            id = 2,
            header = "Количка 7$",
            txt = "Derby или нищо!",
            params = {
                event = "sodaitem1",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Водичка 5$",
            txt = "Хидратацията е много важно нещо",
            params = {
                event = "sodaitem2",
                args = {
                    number = 2,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Енергиина напитка 12$",
            txt = "Hell-че брат",
            params = {
                event = "sodaitem3",
                args = {
                    number = 3,
                    id = 4
                }
            }
        },
    })
end)

RegisterNetEvent('mr-vending:vendingmach', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Вендинг машина",
            txt = ""
        },
        {
            id = 2,
            header = "Пакетиран сандвич 5$",
            txt = "Старичък и леко изсъхнал",
            params = {
                event = "vendingitem1",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Фафла 5$",
            txt = "Кат' на Криско, ама по-хубави",
            params = {
                event = "vendingitem2",
                args = {
                    number = 2,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Сливенски поничка 5$",
            txt = "Сладки и мазни, като...",
            params = {
                event = "vendingitem3",
                args = {
                    number = 3,
                    id = 4
                }
            }
        },
    })
end)

RegisterNetEvent('mr-vending:coffemach', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Машина за кафе",
            txt = ""
        },
        {
            id = 2,
            header = "Кафенце 5$",
            txt = "Абе става, като за от машина",
            params = {
                event = "coffeeitem",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

RegisterNetEvent('mr-vending:waterdis', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Диспенсер за вода",
            txt = ""
        },
        {
            id = 2,
            header = "Водичка 5$",
            txt = "Абе става, като за от машина",
            params = {
                event = "wateritem",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

---------------------Евенти

RegisterNetEvent("vendingitem1")
AddEventHandler("vendingitem1", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","sandwich",5)
end)

RegisterNetEvent("vendingitem2")
AddEventHandler("vendingitem2", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","donut",5)
end)

RegisterNetEvent("vendingitem3")
AddEventHandler("vendingitem3", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","banana",5)
end)

--Вендинг

RegisterNetEvent("sodaitem1")
AddEventHandler("sodaitem1", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","water",5)
    
    
end)

RegisterNetEvent("sodaitem2")
AddEventHandler("sodaitem2", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","cocacola",5)
end)

RegisterNetEvent("sodaitem3")
AddEventHandler("sodaitem3", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","energy",5)
end)

--

RegisterNetEvent("coffeeitem")
AddEventHandler("coffeeitem", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","coffee",5)
end)

RegisterNetEvent("wateritem")
AddEventHandler("wateritem", function()
    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, -1.0, -1, 1, 0, false, false, false)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(player)
    TriggerServerEvent("mr-vending:server:check","water", 5)
end)






