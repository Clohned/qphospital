Config = {}

Config.VersionCheck = true -- If set true, you'll get a print in server console when your resource is out of date and needs a update.
Config.Debug = true -- Receieve treatment test command (change the command below to your liking)
Config.DebugCommand = 'treatmenttest' -- The command you wish to use to test receiving treatment

Config.Notification = "You need medical attention!" -- Notification you will receive for when you are bleeding and in need of treatment

-- Choose to have players pay for receiving treatment
-- If set to true edit 'Config.BillAmount' to your desired price for receiving treatment. If set false it will be free for everyone.
Config.CostMoney = true

-- Cost to receive treatment
Config.BillAmount = 500

-- Choose for players to gain health when using qtarget to lay down in bed (got bored so why not)
-- If set to 0 this option will be disbaled. If set to 3 players will receive 1 health every 3 seconds while laying down in bed.
Config.HealTime = 3

-- NPC spawn location/model & hash
Config.NPC      = {
    {
        coords  = vector3(311.57, -594.11, 43.28 - 0.99),
        heading = 0.5440,
        hash    = 0xD47303AC,
        model   = "s_m_m_doctor_01"
    }
}

-- *DO NOT TOUCH UNLESS YOU KNOW WHAT YOUR DOING
Config.Props  = {
    sitonbed  = {anim = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER"},
    laydown   = {dict = "anim@gangops@morgue@table@", anim = "ko_front"},
    smallcock = {anim = "WORLD_HUMAN_PICNIC"},
    area      = {
        [96868307] = {
            object        = 96868307,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [867556671] = {
            object        = 867556671,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [536071214] = {
            object        = 536071214,
            metadataone   = 0.0,
            metadatatwo   = -0.1,
            metadatathree = -0.5,
            metadatafour  = 180.0,
            bed           = false
        },
        [538002882] = {
            object        = 538002882,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = 0.1,
            metadatafour  = 168.0,
            bed           = false
        },
        [2117668672] = {
            object        = 2117668672,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -1.4,
            metadatafour  = 0.0,
            bed           = true
        },
        [1631638868] = {
            object        = 1631638868,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -1.4,
            metadatafour  = 0.0,
            bed           = true
        },
        [1268458364] = {
            object        = 1268458364,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [1037469683] = {
            object        = 1037469683,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [-992735415] = {
            object        = -992735415,
            metadataone   = 0.0,
            metadatatwo   = -0.0,
            metadatathree = 0.1,
            metadatafour  = 180.0,
            bed           = false
        },
        [-992710074] = {
            object        = -992710074,
            metadataone   = 0.0,
            metadatatwo   = -0.1,
            metadatathree = -0.7,
            metadatafour  = 168.0,
            bed           = false
        },
        [-171943901] = {
            object        = -171943901,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.0,
            metadatafour  = 168.0,
            bed           = false
        },
        [-377849416] = {
            object        = -377849416,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [-109356459] = {
            object        = -109356459,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -0.4,
            metadatafour  = 168.0,
            bed           = false
        },
        [-1519439119] = {
            object        = -1519439119,
            metadataone   = 0.0,
            metadatatwo   = 0.0,
            metadatathree = -2.0,
            metadatafour  = 0.0,
            bed           = true
        },
        [-1195678770] = {
            object        = -1195678770,
            metadataone   = 0.0,
            metadatatwo   = -0.1,
            metadatathree = -0.7,
            metadatafour  = 5.0,
            bed           = false
        },
        [-1091386327] = {
            object        = -1091386327,
            metadataone   = 0.0,
            metadatatwo   = 0.13,
            metadatathree = -0.2,
            metadatafour  = 90.0,
            bed           = false
        },
        [-1118419705] = {
            object        = -1118419705,
            metadataone   = 0.0,
            metadatatwo   = -0.1,
            metadatathree = -0.5,
            metadatafour  = 168.0,
            bed           = false
        },
        [-1761659350] = {
            object        = -1761659350,
            metadataone   = 0.0,
            metadatatwo   = -0.0,
            metadatathree = -0.5,
            metadatafour  = 180.0,
            bed           = false
        },
        [-1626066319] = {
            object        = -1626066319,
            metadataone   = 0.0,
            metadatatwo   = -0.0,
            metadatathree = 0.1,
            metadatafour  = 180.0,
            bed           = false
        }
    }
}

-- *DO NOT TOUCH UNLESS YOU KNOW WHAT YOUR DOING*
Config.Beds = {
    1631638868, -- hospital xray bed
    2117668672, -- hospital catscan bed
   -1519439119 -- hospital mri machine bed
}
