fx_version 'cerulean'

game 'gta5'

author 'qpr' -- https://github.com/ohqpr

lua54 'yes'

version '1.0.2'

client_scripts {
  'client/*.lua'
}

shared_scripts {
  '@es_extended/imports.lua',
  'config.lua'
}

server_scripts {
  'server/*.lua'
}

dependencies {
  'qtarget',
  'nh-context',
  'es_extended',
  'esx_ambulancejob'
}
