-- FX Information --
fx_version 'cerulean'
game       'gta5'
lua54      'yes'

-- Resource Information --
name         'qphospital'
author       'qpr'
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

client_script 'client.lua'
server_script 'server/*.lua'
