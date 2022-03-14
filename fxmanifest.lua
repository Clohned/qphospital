-- FX Information --
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

-- Resource Information --
name         'qphospital'
author       'qpr' -- https://github.com/ohqpr
version      '1.0.4'
repository   'https://github.com/ohqpr/qphospital'
description  'Hospital treatment resource utilizing qtarget & nh-context'

-- Manifest --
dependencies {
  '/server:5181',
  '/onesync',
  'qtarget',
  'nh-context',
  'esx_ambulancejob'
}

shared_scripts {
  '@es_extended/imports.lua',
  'config.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/*.lua'
}

client_script 'client.lua'
