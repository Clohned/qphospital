fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'qpr' -- https://github.com/ohqpr

version '1.0.3'

client_script 'client.lua'
server_script 'server/*.lua'

shared_scripts {
  '@es_extended/imports.lua',
  'config.lua'
}

dependencies {
  'qtarget',
  'nh-context',
  'es_extended',
  'esx_ambulancejob'
}
