Config = {}

Config.VersionCheck = true -- If set true, you'll get a print in server console when your resource is out of date and needs a update.

-- Resource debug for client debug_print. Edit below the test command to receive treatment.
Config.Debug = true
Config.DebugCommand = 'treatmenttest' -- Here you can set a command for testing your hospital menu.

-- Notification you will receive when you are bleeding and in need of treatment.
Config.Notification = 'You need medical attention!'

-- Choose to have players pay for receiving treatment.
-- If set to true edit 'Config.BillAmount' to your desired price for receiving treatment. If set false it will be free for everyone.
Config.CostMoney = true

-- Total cost to receive treatment
Config.BillAmount = 500

-- Choose for players to gain health when using qtarget to lay down in bed (got bored so why not).
-- If set to 0 this option will be disabled. If set to 3 players will receive 1 health every 3 seconds while laying down in bed.
Config.HealTime = 3

Config.NPC      = { -- NPC spawn location & model.
    {
        coords  = vec3(311.57, -594.11, 43.28 - 0.99),
        heading = 0.5440,
        model   = `s_m_m_doctor_01`
    }
}

Config.Animations = {
  ['sit_down']    = {
      dict        = false,
      anim        = 'WORLD_HUMAN_PICNIC'
  },
  ['lay_down']    = {
      dict        = 'anim@gangops@morgue@table@',
      anim        = 'ko_front'
  }
}

-- *DO NOT TOUCH UNLESS YOU KNOW WHAT YOUR DOING*
Config.Data      = {
    [96868307]   = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [867556671]  = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [536071214]  = {
        metadata = {0.0, -0.1, -0.5, 180.0}
    },
    [538002882]  = {
        metadata = {0.0, 0.0, 0.1, 168.0}
    },
    [2117668672] = {
        metadata = {0.0, 0.0, -1.4, 0.0}
    },
    [1631638868] = {
        metadata = {0.0, 0.0, -1.4, 0.0}
    },
    [1268458364] = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [1037469683] = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [-992735415] = {
        metadata = {0.0, -0.0, 0.1, 180.0}
    },
    [-992710074] = {
        metadata = {0.0, -0.1, -0.7, 168.0}
    },
    [-171943901] = {
        metadata = {0.0, 0.0, -0.0, 168.0}
    },
    [-377849416] = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [-109356459] = {
        metadata = {0.0, 0.0, -0.4, 168.0}
    },
    [-1519439119] = {
        metadata  = {0.0, 0.0, -2.0, 0.0}
    },
    [-1195678770] = {
        metadata  = {0.0, -0.1, -0.7, 5.0}
    },
    [-1091386327] = {
        metadata  = {0.0, 0.13, -0.2, 90.0},
    },
    [-1118419705] = {
        metadata  = {0.0, 0.1, -0.5, 168.0},
    },
    [-1761659350] = {
        metadata  = {0.0, -0.0, -0.5, 180.0},
    },
    [-1626066319] = {
        metadata  = {0.0, -0.0, 0.1, 180.0},
    }
}

-- *DO NOT TOUCH UNLESS YOU KNOW WHAT YOUR DOING*
Config.Beds = {
    1631638868, -- hospital xray bed
    2117668672 -- hospital catscan bed
}
