// Sprites

var SPR_PATH = MOD_PATH + "/sprites/"

MOD_GLOBAL.icon = sprite_add(SPR_PATH + "icon.png", 1, 0, 0, 0, 0)

MOD_GLOBAL.clock_normal = sprite_add(SPR_PATH + "collects/clock_normal.png", 17, false, false, 32, 32)
MOD_GLOBAL.clock_escape = sprite_add(SPR_PATH + "collects/clock_escape.png", 17, false, false, 32, 32)

MOD_GLOBAL.spr_pizzaface_scoutdigo =
{
    docile: sprite_add(SPR_PATH + "pizzaface/scoutdigo/docile.png", 18, false, false, 150, 150),
    to_angry: sprite_add(SPR_PATH + "pizzaface/scoutdigo/to_angry.png", 17, false, false, 150, 150),
    angry: sprite_add(SPR_PATH + "pizzaface/scoutdigo/angry.png", 17, false, false, 150, 150),
    to_docile: sprite_add(SPR_PATH + "pizzaface/scoutdigo/to_docile.png", 18, false, false, 150, 150)
}
MOD_GLOBAL.spr_pizzaface_docile =
{
    cu: sprite_add(SPR_PATH + "pizzaface/modern/cu_docile.png", 18, false, false, 60, 61),
    pantheon: sprite_add(SPR_PATH + "pizzaface/modern/pantheon_docile.png", 4, false, false, 69, 69),
}

MOD_GLOBAL.spr_pizzacator_docile = sprite_add(SPR_PATH + "pizzacator/cu_docile.png", 2, false, false, 57, 56)
MOD_GLOBAL.baddie_healthbar = sprite_add(SPR_PATH + "healthbar/spr_baddie_healthbar.png", 6, false, false, 57, 56)

MOD_GLOBAL.deathrank =
{
    normal: sprite_add(SPR_PATH + "ranks/death.png", 6, false, false, 50, 55),
    fill: sprite_add(SPR_PATH + "ranks/deathfill.png", 5, false, false, 50, 55),
}

MOD_GLOBAL.options_bg = sprite_add(SPR_PATH + "settings/dmoptionsBG.png", 1, false, false, 0, 0)

// Variables

MOD_GLOBAL.timer_reached_zero = false
MODIFIERS.DeathMode = false
MOD_GLOBAL.playerid = obj_player1

// Audio

MOD_GLOBAL.sfx_collect_orig = fmod_event_create_instance("event:/deathmode/sounds/deathcollect")
MOD_GLOBAL.mus_dm_orig = fmod_event_create_instance("event:/deathmode/music/dmmusic")

MOD_GLOBAL.sfx_collect = MOD_GLOBAL.sfx_collect_orig
MOD_GLOBAL.mus_dm = MOD_GLOBAL.mus_dm_orig

// Overrides

global.death_mode =
{
    docile: MOD_GLOBAL.spr_pizzaface_docile.cu,
    to_angry: spr_pizzaface_attackend,
    angry: spr_pizzaface,
    to_docile: spr_pizzaface_recovering
}

// Objects

MOD_GLOBAL.core = instance_create(0, 0, obj_dm_con)
MOD_GLOBAL.gui = instance_create(0, 0, obj_guidraw)

// Functions

MOD_GLOBAL.clock_coll_create = function()
{
    with other
    {
        image_speed = 0.85

        time = 10

        depth = 10

        var _inst = instance_place(x, y, any)

        if _inst != -4
        {
            with _inst
            {
                switch object_index
                {
                    case obj_collect:
                    case obj_bigcollect:
                    case obj_escapecollect:
                    case obj_escapecollectbig:
                        instance_destroy(id, false)
                        break
                    default:
                        other.depth = depth + 10
                        break
                }
            }
        }
    }
}
MOD_GLOBAL.clock_coll_step = function()
{
    with other
    {
        with obj_player1
        {
            if (place_meeting(x, y, other))
            {
                if global.option_sfx_volume > 0.05 {
                    sound_play_3d(MOD_GLOBAL.sfx_collect, x, y)
                    fmod_event_instance_set_volume(MOD_GLOBAL.sfx_collect, global.option_sfx_volume)
                }

                MOD_GLOBAL.core.time_add(other.time)

                global.heattime += 10
                global.heattime = clamp(global.heattime, 0, 60)
                global.combotime = 60

                var coll = MOD_GLOBAL.core.collect_data[other.entrynum].positions
                for (var i = 0; i < array_length(coll); i++)
                {
                    if MOD_GLOBAL.core.room_string(coll[i].colroom) == other.roomID
                        coll[i].data[other.ID].blockspawn = true
                }

                create_collect(x, y, other.sprite_index)
                var num = instance_create(x + 16, y, obj_smallnumber)
                num.number = "+" + string(other.time)
                instance_destroy(other)
            }
        }
    }
}


MOD_GLOBAL.get_level_settings = function(leveltoload)
{
    var level_props = {level: "none"}
    
    #region clock data

    var found = false

    var props_database = [ // vanilla levels database
    {
            level: "tutorial", // Default Tutorial
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: tower_tutorial2, data:[{x:1408, y:352},{x:2272, y:352}]},
                        {colroom: tower_tutorial4, data:[{x:1728, y:640}]},
                        {colroom: tower_tutorial5, data:[{x:4576, y:1024}]},
                        {colroom: tower_tutorial6, data:[{x:2304, y:832}]},
                        {colroom: tower_tutorial7, data:[{x:832, y:576},{x:1568, y:1024}]},
                        {colroom: tower_tutorial8, data:[{x:1472, y:448}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: tower_tutorial1, data:[{x:1200, y:400}]}
                    ]
                }
            ]
        },
        {
            level: "entrance", // John Gutter
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: entrance_2, data:[{x:816, y:432}]},
                        {colroom: entrance_4, data:[{x:672, y:512}]},
                        {colroom: entrance_5, data:[{x:192, y:512}]},
                        {colroom: entrance_7, data:[{x:2592, y:1088}]},
                        {colroom: entrance_8, data:[{x:1536, y:576}]},
                        {colroom: entrance_9, data:[{x:800, y:864}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: entrance_2, data:[{x:2016, y:224}]},
                        {colroom: entrance_5, data:[{x:2784, y:160}]},
                        {colroom: entrance_7, data:[{x:2336, y:1344}]},
                        {colroom: entrance_8, data:[{x:6208, y:384}]},
                        {colroom: entrance_9, data:[{x:896, y:416}]}
                    ]
                }
            ]
        },
        {
            level: "medieval", // Pizzascape
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: medieval_2, data:[{x:1504, y:896}]},
                        {colroom: medieval_3, data:[{x:1000, y:460}, {x:2368, y:338}]},
                        {colroom: medieval_3b, data:[{x:1952, y:1152}]},
                        {colroom: medieval_4, data:[{x:2496, y:704}, {x:4288, y:384}]},
                        {colroom: medieval_5, data:[{x:1168, y:832}, {x:2256, y:240}]},
                        {colroom: medieval_6, data:[{x:1442, y:336}]},
                        {colroom: medieval_7, data:[{x:512, y:576}]},
                        {colroom: medieval_8, data:[{x:800, y:576}, {x:608, y:1056}]},
                        {colroom: medieval_9, data:[{x:1920, y:672}, {x:2208, y:832}]},
                        {colroom: medieval_9b, data:[{x:1536, y:658}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: medieval_2, data:[{x:2592, y:608}]},
                        {colroom: medieval_3b, data:[{x:1216, y:992}]},
                        {colroom: medieval_4, data:[{x:576, y:640}]},
                        {colroom: medieval_7, data:[{x:1504, y:576}]},
                        {colroom: medieval_9b, data:[{x:160, y:928}]}
                    ]
                }
            ]
        },
        {
            level: "ruin", // Ancient Cheese
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: ruin_1, data:[{x:1952, y:336}]},
                        {colroom: ruin_2, data:[{x:1568, y:992}]},
                        {colroom: ruin_3, data:[{x:448, y:288}]},
                        {colroom: ruin_3b, data:[{x:512, y:512}, {x:640, y:640}]},
                        {colroom: ruin_4, data:[{x:960, y:672}]},
                        {colroom: ruin_5, data:[{x:1568, y:1152}, {x:384, y:1408}]},
                        {colroom: ruin_6, data:[{x:2068, y:497}, {x:1344, y:576}]},
                        {colroom: ruin_7, data:[{x:1952, y:672}, {x:288, y:800}]},
                        {colroom: ruin_8, data:[{x:1216, y:800}, {x:352, y:691}]},
                        {colroom: ruin_9, data:[{x:672, y:256}]},
                        {colroom: ruin_11, data:[{x:1760, y:288}, {x:96, y:256}]},
                        {colroom: ruin_12, data:[{x:736, y:384}, {x:1408, y:1920}]},
                        {colroom: ruin_13, data:[{x:1024, y:960}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: ruin_5, data:[{x:1152, y:1536}]},
                        {colroom: ruin_7, data:[{x:2592, y:992}]}
                    ]
                }
            ]
        },
        {
            level: "dungeon", // Bloodsauce Dungeon
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: dungeon_2, data:[{x:832, y:512}, {x:640, y:1792}, {x:512, y:2080}]},
                        {colroom: dungeon_3, data:[{x:512, y:2528}, {x:192, y:480}]},
                        {colroom: dungeon_4, data:[{x:206, y:696}, {x:544, y:1824}]},
                        {colroom: dungeon_5, data:[{x:672, y:416}, {x:384, y:2048}]},
                        {colroom: dungeon_6, data:[{x:608, y:768}, {x:1792, y:1664}]},
                        {colroom: dungeon_7, data:[{x:1440, y:1152}]},
                        {colroom: dungeon_8, data:[{x:960, y:960}, {x:864, y:2336}]},
                        {colroom: dungeon_9, data:[{x:1472, y:672}, {x:4032, y:800}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: dungeon_2, data:[{x:96, y:1312}]},
                        {colroom: dungeon_3, data:[{x:224, y:2240}]},
                        {colroom: dungeon_4, data:[{x:352, y:1344}, {x:384, y:224}]},
                        {colroom: dungeon_5, data:[{x:480, y:928}]},
                        {colroom: dungeon_6, data:[{x:1760, y:1312}]},
                        {colroom: dungeon_7, data:[{x:672, y:352}, {x:704, y:1984}]},
                        {colroom: dungeon_8, data:[{x:576, y:1792}]},
                        {colroom: dungeon_9, data:[{x:4320, y:608}]}
                    ]
                }
            ]
        },
        {
            level: "war", // WAR
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: war_1, data:[{x:2464, y:608, time:220}]}
                    ]
                },
                {
                    inst: obj_dmcollect,
                    escape: true,
                    positions: [
                        {colroom: war_1, data:[{x:2464, y:608, time:200, blockspawn:true}]}
                    ]
                }
            ]
        },
         {
            level: "farm", // Fun Farm (New Spliz)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: farm_1, data:[{x:255, y:600}]},
                        {colroom: farm_4, data:[{x:1580, y:350},{x:1240,y:1868}]},
                        {colroom: farm_4b,data:[{x:1564, y:656}]},
                        {colroom: farm_5, data:[{x:1375, y:360}]},
                        {colroom: farm_7, data:[{x:1740, y:700},{x:3000,y:1000}]},
                        {colroom: farm_8, data:[{x:2130, y:440}]},
                        {colroom: farm_6, data:[{x:1475, y:2096}]},
                        {colroom: farm_9, data:[{x:1000, y:900}]},
                        {colroom: farm_9b,data:[{x:3340, y:172}]},
                        {colroom: farm_10,data:[{x:500, y:1400}]},
                        {colroom: farm_9b,data:[{x:1320, y:594}]},
                        {colroom: farm_11,data:[{x:2116, y:1776}]},
                        {colroom: farm_13,data:[{x:928, y:716}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: farm_1, data:[{x:900, y:540}]},
                        {colroom: farm_12, data:[{x:3264, y:1328}]},
                        {colroom: farm_12b, data:[{x:2100, y:400}]},
                        {colroom: farm_13, data:[{x:1500, y:434},{x: 2960, y:770}]}
                    ]
                }
            ]
        },
        {
            level: "saloon", // Fast Food Saloon (Original)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: saloon_1, data:[{x:2084, y:1136},{x:4958, y:1244},{x:7492,y:1312}]},
                        {colroom: saloon_2, data:[{x:3744, y:430}]},
                        {colroom: saloon_2b, data:[{x:992, y:608},{x:2592,y:960},{x:4124,y:912},{x:192,y:416}]},
                        {colroom: saloon_3b, data:[{x:2688, y:800},{x:864,y:608}]},
                        {colroom: saloon_3, data:[{x:1600, y:352},{x:1952,y:584}]},
                        {colroom: saloon_4, data:[{x:2760, y:600},{x:5088,y:1344},{x:5920,y:560}]},
                        {colroom: saloon_4b, data:[{x:1216, y:448},{x:5888,y:736},{x:3808,y:1056}]},
                        {colroom: saloon_5b, data:[{x:1920, y:1428},{x:2816,y:614},{x:2624,y:880}]},
                        {colroom: saloon_5, data:[{x:2496, y:960},{x:1888,y:752},{x:1696,y:480}]},
                        {colroom: saloon_6b, data:[{x:1856, y:1184},{x:2272,y:430}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: saloon_2, data:[{x:320, y:1056}]},
                        {colroom: saloon_2b, data:[{x:192, y:416, time:20}]},
                        {colroom: saloon_3, data:[{x:2270, y:652}]},
                        {colroom: saloon_4, data:[{x:2240, y:1696}]},
                        {colroom: saloon_6, data:[{x:1024, y:690}]}
                    ]
                }
            ]
        },
        {
            level: "space", // Deep Dish 9 (medium size tweaks)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: space_1, data:[{x:3648, y:224},{x:2820, y:660}]},
                        {colroom: space_2, data:[{x:2976, y:3638},{x:2784, y:2614}]},
                        {colroom: space_3, data:[{x:1536, y:918},{x:1824, y:384},{x:8416, y:694}]},
                        {colroom: space_4, data:[{x:1824, y:2038},{x:800, y:672}]},
                        {colroom: space_5, data:[{x:3200, y:1142}]},
                        {colroom: space_6, data:[{x:2600, y:832}]},
                        {colroom: space_7, data:[{x:1920, y:886},{x:2046, y:2102},{x:1504, y:2400},{x:1536, y:480,time:25}]},
                        {colroom: space_8, data:[{x:3104, y:1174},{x:3232, y:736}]},
                        {colroom: space_9, data:[{x:1920, y:854}]},
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: space_10, data:[{x:672, y:2560}]},
                        {colroom: space_11b, data:[{x:1150, y:240},{x:224, y:896},{x:1024, y:1472},{x:1696, y:1472}]},
                        {colroom: space_12, data:[{x:1056, y:2272},{x:896, y:3840}]},
                    ]
                }
            ]
        },
        {
            level: "minigolf", // Golf [Floor 3] (Original)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: minigolf_1, data:[{x:6912, y:408}]},
                        {colroom: minigolf_2, data:[{x:4744, y:402}]},
                        {colroom: minigolf_3, data:[{x:2752, y:1508},{x:6752, y:1464}]},
                        {colroom: minigolf_4, data:[{x:1280, y:166},{x:2976, y:388},{x:3520, y:182},{x:8974,y:370}]},
                        {colroom: minigolf_5, data:[{x:5680, y:690},{x:3328, y:1152},{x:1120, y:1524}]},
                        {colroom: minigolf_6, data:[{x:7264, y:352},{x:4020, y:520},{x:2432, y:520},{x:1600, y:790},{x:832, y:790}]},
                        {colroom: minigolf_7, data:[{x:448, y:764},{x:2578, y:626},{x:4200, y:700},{x:5408, y:1024}]},
                        {colroom: minigolf_8, data:[{x:2016, y:370}]},

                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: minigolf_1, data:[{x:5184, y:384}]},
                        {colroom: minigolf_2, data:[{x:1742, y:401}]},
                        {colroom: minigolf_3, data:[{x:1764, y:900}]},
                        {colroom: minigolf_9, data:[{x:640, y:320}]},
                        {colroom: minigolf_10, data:[{x:4240, y:692}]},
                        {colroom: minigolf_11, data:[{x:1218, y:640},{x:6080, y:960},{x:13920, y:918}]},
                    ]
                }
            ]
        },
         {
            level: "street", // The Pig City (Original)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: street_intro, data:[{x:1390, y:630}]},
                        {colroom: street_1, data:[{x:2380, y:450}]},
                        {colroom: street_house1, data:[{x:1960, y:640}]},
                        {colroom: street_2, data:[{x:2000, y:780},{x:576, y:512}]},
                        {colroom: street_house2, data:[{x:3624, y:1700},{x:864, y:1548},{x:544, y:1088},{x:2368, y:448}]},
                        {colroom: street_3, data:[{x:3296, y:600},{x:512, y:256}]},
                        {colroom: street_house3, data:[{x:2304, y:1376},{x:1720, y:1100},{x:2176, y:800}]},
                        {colroom: street_jail, data:[{x:580, y:370}]},
                        {colroom: street_4, data:[{x:1376, y:1344},{x:3456, y:1184},{x:4848, y:523},{x:7200, y:704}]},
                        {colroom: street_house4, data:[{x:1440, y:2112},{x:3200, y:928},{x:4800, y:1120},{x:3008, y:544}]},
                        {colroom: street_5, data:[{x:1808, y:896},{x:1551, y:98}]},
                        {colroom: street_house5, data:[{x:3248, y:2900},{x:1568, y:3040},{x:1728, y:2224},{x:2176, y:1888},{x:1920, y:384}]},
                        {colroom: street_bacon, data:[{x:896, y:736}]},
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: street_1, data:[{x:3220, y:480}]},
                        {colroom: street_2, data:[{x:4352, y:528}]},
                        {colroom: street_3, data:[{x:1408, y:330}]},
                        {colroom: street_4, data:[{x:1600, y:768}]},
                        {colroom: street_5, data:[{x:1120, y:900}]},
                    ]
                }
            ]
        },
        {
            level: "chateau", // PizzaScare (Mid-small size tweaks)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: chateau_2 , data:[{x:2112, y:1536}]},
                        {colroom: chateau_3 , data:[{x:1888, y:448},{x:2336, y:1404}]},
                        {colroom: chateau_4 , data:[{x:5152, y:1334}]},
                        {colroom: chateau_5 , data:[{x:2944, y:662}]},
                        {colroom: chateau_6 , data:[{x:1600, y:3040},{x:800, y:1600},{x:1600, y:2304}]},
                        {colroom: chateau_7 , data:[{x:2432, y:2336}]},
                        {colroom: chateau_8 , data:[{x:3200, y:1696},{x:4128, y:1280},{x:800, y:1170},{x:1248, y:320}]},
                        {colroom: chateau_9 , data:[{x:1984, y:1174},{x:7420, y:470},{x:8600, y:2440}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: chateau_2 , data:[{x:2144, y:1334}]},
                        {colroom: chateau_5 , data:[{x:5632, y:448}]},
                        {colroom: chateau_7 , data:[{x:3648, y:4192}]},
                        {colroom: chateau_8 , data:[{x:3840, y:2144}]},
                        {colroom: chateau_9 , data:[{x:3552, y:1620}]}
                    ]
                }
            ]
        },
        {
            level: "etb", // Early Test Build/Formaggi Ruins
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: etb_1, data:[{x:96, y:1408},{x:3584, y:640}]},
                        {colroom: etb_2, data:[{x:3072, y:768}]},
                        {colroom: etb_4, data:[{x:1248, y:384}]},
                        {colroom: etb_5,data:[{x:1536, y:768}]},
                        {colroom: etb_5b, data:[{x:832, y:544}]},
                        {colroom: etb_6, data:[{x:1504, y:256}]},
                        {colroom: etb_7, data:[{x:4768, y:480},{x:4576, y:160}]},
                        {colroom: etb_7b, data:[{x:608, y:192}]},
                        {colroom: etb_8, data:[{x:420, y:410}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: etb_2b, data:[{x:420, y:460}]},
                        {colroom: etb_3, data:[{x:2368, y:832}]},
                        {colroom: etb_5, data:[{x:1984, y:608}]}
                    ]
                }
            ]
        },
        {
            level: "strongcold", // Strongcold, duh
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: strongcold_9, data:[{x:2975, y:400},{x:250, y:230}]},
                        {colroom: strongcold_8, data:[{x:680, y:1050},{x:675, y:4360}]},
                        {colroom: strongcold_7, data:[{x:215, y:850}]},
                        {colroom: strongcold_6, data:[{x:175, y:1600},{x:275, y:920}]},
                        {colroom: strongcold_5, data:[{x:1216, y:80},{x:880, y:235}]},
                        {colroom: strongcold_4, data:[{x:1015, y:1675},{x:350, y:720}]},
                        {colroom: strongcold_3, data:[{x:960, y:2340},{x:900, y:1350}]},
                        {colroom: strongcold_2, data:[{x:1000, y:1810},{x:835, y:495}]},
                        {colroom: strongcold_1, data:[{x:1555, y:100}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                      {colroom: strongcold_9, data:[{x:1675, y:400}]},
                      {colroom: strongcold_8, data:[{x:945, y:1980},{x:1500, y:6000}]},
                      {colroom: strongcold_7, data:[{x:1140, y:1000}]},
                      {colroom: strongcold_6, data:[{x:1050, y:750}]},
                      {colroom: strongcold_5, data:[{x:950, y:1645},{x:780, y:165}]},
                      {colroom: strongcold_4, data:[{x:800, y:1240}]},
                      {colroom: strongcold_3, data:[{x:1200, y:2200}]},
                      {colroom: strongcold_2, data:[{x:1000, y:780}]},
                      {colroom: strongcold_1, data:[{x:1806, y:780}]}
                    ]
                }
            ]
        },
        {
            level: "abyss", // John's Abyss (Outerfloor)
            collects: [
                {
                    inst: obj_dmcollect,
                    escape: false,
                    positions: [
                        {colroom: abyss_1, data:[{x:2100, y:1500},{x:1984, y:940}]},
                        {colroom: abyss_2, data:[{x:2400, y:580}]},
                        {colroom: abyss_3, data:[{x:1340, y:840},{x:2660, y:1392},{x:3904, y:192}]},
                        {colroom: abyss_4, data:[{x:1000, y:1100}]},
                        {colroom: abyss_5, data:[{x:700, y:930},{x:3520, y:608}]},
                        {colroom: abyss_6, data:[{x:1856, y:1096},{x:4140, y:1096}]},
                        {colroom: abyss_7, data:[{x:3520, y:1300},{x:5036, y:590},{x:1248, y:576}]},
                        {colroom: abyss_8, data:[{x:3392, y:666}]},
                        {colroom: abyss_9, data:[{x:1952, y:552}]},
                        {colroom: abyss_9b, data:[{x:896, y:588}]},
                        {colroom: abyss_10, data:[{x:2200, y:1036},{x:1536, y:840}]},
                        {colroom: abyss_lap, data:[{x:2400, y:580}]}
                    ]
                },
                {
                    inst: obj_dmcollect_escape,
                    escape: true,
                    positions: [
                        {colroom: abyss_2, data:[{x:2212, y:300},{x:1376, y:1100}]},
                        {colroom: abyss_3, data:[{x:1664, y:380}]},
                        {colroom: abyss_5, data:[{x:3584, y:880}]},
                        {colroom: abyss_6, data:[{x:2528, y:972}]},
                        {colroom: abyss_7, data:[{x:2652, y:1096}]},
                        {colroom: abyss_9, data:[{x:1840, y:680}]}
                    ]
                }
            ]
        },
        
    ]
    
    #endregion

    for (var i = 0; i < array_length(props_database); i++)
    {
        if props_database[i].level == leveltoload
        {
            level_props = props_database[i]
            found = true
            continue
        }
    }
    
    if !found // no locations? find them in files then
    {
        var index = 0
        var placefile = []

        var _file = file_find_first(MOD_PATH + "/levelprops/*.json", 0)

        {
            placefile[index] = _file
            index++
            _file = file_find_next()
        }

        file_find_close()

        for (var i = 0; i < array_length(placefile); i++)
        {
            var cyop_loaded_database = json_parse(scr_load_file(MOD_PATH + "/levelprops/" + placefile[i]))
            var len = array_length(cyop_loaded_database)

            for (var i = 0; i < len; i++)
            {
                if cyop_loaded_database[i].level == leveltoload
                {
                    level_props = cyop_loaded_database[i]
                    found = true
                    continue
                }
            }
        }
    }

    if !found
        return {level: "none"}
    return level_props
}

MOD_GLOBAL.pizza_time_stop = function()
{
    if instance_exists(obj_chunktimer)
    {
        with (obj_chunktimer)
        {
            instance_destroy()
        }
    }
}

MOD_GLOBAL.pizza_time_start = function()
{
    if !instance_exists(obj_chunktimer)
    {
        var ct = instance_create(0, 0, obj_chunktimer)
        ct.depth = -70
    }
}
