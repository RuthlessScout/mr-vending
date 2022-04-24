--CLIENT

Citizen.CreateThread(function()
   local drinkvendings = { 
        `prop_vend_soda_01`,
        `prop_vend_soda_02`,
        `prop_vend_water_01`,
    }
    exports['int_eye']:AddTargetModel(drinkvendings, {
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
    exports['int_eye']:AddTargetModel(foodvendings, {
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
    exports['int_eye']:AddTargetModel(coffeevendings, {
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
    exports['int_eye']:AddTargetModel(vodu, {
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
                event = "itemа1",
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
                event = "itemа2",
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
                event = "itemа3",
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
            header = "Пакетиран сандвич 10$",
            txt = "Старичък и леко изсъхнал",
            params = {
                event = "item1",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Фафла 8$",
            txt = "Кат' на Криско, ама по-хубави",
            params = {
                event = "item2",
                args = {
                    number = 2,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Сливенски поничка 8$",
            txt = "Сладки и мазни, като...",
            params = {
                event = "item3",
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
            header = "Кафенце 10$",
            txt = "Абе става, като за от машина",
            params = {
                event = "itemа4",
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
                event = "itemа2",
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
    TriggerServerEvent("mr-vending:server:check",Config.VendingItem1)
end)

RegisterNetEvent("vendingitem2")
AddEventHandler("vendingitem2", function()
    TriggerServerEvent("mr-vending:server:check",Config.VendingItem2)
end)

RegisterNetEvent("vendingitem3")
AddEventHandler("vendingitem3", function()
    TriggerServerEvent("mr-vending:server:check",Config.VendingItem3)
end)

--Вендинг

RegisterNetEvent("sodaitem1")
AddEventHandler("sodaitem1", function()
    TriggerServerEvent("mr-vending:server:check",Config.SodaItem1)
end)

RegisterNetEvent("sodaitem2")
AddEventHandler("sodaitem2", function()
    TriggerServerEvent("mr-vending:server:check",Config.SodaItem2)
end)

RegisterNetEvent("sodaitem3")
AddEventHandler("sodaitem3", function()
    TriggerServerEvent("mr-vending:server:check",Config.SodaItem3)
end)

--

RegisterNetEvent("coffeeitem")
AddEventHandler("coffeeitem", function()
    TriggerServerEvent("mr-vending:server:check",Config.CoffeeItem)
end)

RegisterNetEvent("wateritem")
AddEventHandler("wateritem", function()
    TriggerServerEvent("mr-vending:server:check",Config.WaterItem)
end)






