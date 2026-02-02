fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
author 'SirRayan'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'lb-phone',
	'ox_lib',
    'bl_ui',
}