-- FX Information --
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

-- Resource Information --
name         'qphospital'
author       'qpr' -- https://github.com/ohqpr
version      '1.0.5'
repository   'https://github.com/ohqpr/qphospital'
description  'Hospital treatment resource utilizing qtarget & nh-context'

-- Manifest --
dependencies {
  '/server:5181',
  '/onesync',
  'ox_lib',
  'rprogress',
  'qtarget',
  'nh-context'
}

shared_scripts {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua',
  'config.lua'
}

server_script 'server.lua'
client_script 'client.lua'
