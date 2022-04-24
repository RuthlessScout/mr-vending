fx_version 'cerulean'

game 'gta5'



version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua'
}

server_scripts {
    'server/sv_main.lua'
}

client_scripts {
	'client/*.lua',
    'config.lua'
}
