Config = {}

Config.Target = "qtarget"

Config.Machines = {
    drinks = {
        label = "Напитки",
        icon = "fas fa-glass-whiskey",
        models = {
            `prop_vend_soda_01`,
            `prop_vend_soda_02`,
            `prop_vend_water_01`,
        },
        items = {
            {label = "Количка", item = "cocacola", price = 7},
            {label = "Водичка", item = "water", price = 5},
            {label = "Енергийна напитка", item = "energy", price = 12},
        }
    },
    food = {
        label = "Вендинг машина",
        icon = "fas fa-hotdog",
        models = {
            `prop_vend_snak_01`,
            `prop_vend_snak_01_tu`,
        },
        items = {
            {label = "Пакетиран сандвич", item = "sandwich", price = 5},
            {label = "Фафла", item = "donut", price = 5},
            {label = "Сливенска поничка", item = "banana", price = 5},
        }
    },
    coffee = {
        label = "Кафе машина",
        icon = "fas fa-mug-hot",
        models = {
            `prop_vend_coffe_01`,
        },
        items = {
            {label = "Кафенце", item = "coffee", price = 5},
        }
    },
    water = {
        label = "Диспенсер за вода",
        icon = "fas fa-water",
        models = {
            `prop_watercooler_dark`,
            `prop_watercooler`,
            `watercooler_bottle001`,
            `prop_vend_water_01`,
        },
        items = {
            {label = "Водичка", item = "water", price = 5},
        }
    }
}
