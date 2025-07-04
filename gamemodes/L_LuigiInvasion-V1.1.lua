G_AddGametype({
    name = "Luigi Invasion",
    identifier = "luigitag",
    typeoflevel = TOL_MATCH,
    rules = GTR_SPECTATORS|GTR_SPAWNINVUL|GTR_TAG|GTR_TIMELIMIT|GTR_POINTLIMIT|GTR_HURTMESSAGES|GTR_STARTCOUNTDOWN|GTR_BLINDFOLDED|GTR_RESPAWNDELAY,
    intermissiontype = int_match,
    rankingtype = GT_TAG,
    defaulttimelimit = 5,
    headerleftcolor = 113,
    headerrightcolor = 36,
    description = "Luigis are tagging Marios to turn them into Luigis, be sure avoid Luigis or you'll become one of them"
})

local hidetime = CV_FindVar("hidetime")
addHook("PlayerThink", function(player)
    if (gametype == GT_LUIGITAG) and (player.mo and player.valid) and not (timelimit == 0)
    
        if not (player.beeptimer)
            player.beeptimer = 0
        end
        
        if player.beeptimer >= TICRATE
            player.beeptimer = 0
        end
        
        if not (player.pflags & PF_TAGIT) and (player.realtime >= (hidetime.value+(timelimit*60)-29)*TICRATE)
            if (player.beeptimer == 0)
                S_StartSound(player.mo, sfx_emfind)
            end
            player.beeptimer = $ + 1
            end
        
        if (player.pflags & PF_TAGIT) or (player.realtime <= (hidetime.value+(timelimit*60)-30)*TICRATE)
            player.beeptimer = 0
        end
        
    end
end)

local luigimode = 0
local touchtag = CV_FindVar("touchtag")
local forceskin = CV_FindVar("forceskin")
addHook("ThinkFrame", do
    if (gametype == GT_LUIGITAG) and (luigimode == 0)
        luigimode = 1
    end
    
    if (luigimode == 1) and not (touchtag.value == 1 and forceskin.string == "mario")
        CV_StealthSet(touchtag, 1)
        CV_StealthSet(forceskin, "mario")
    end
    
    if not (gametype == GT_LUIGITAG) and (luigimode == 1)
        CV_StealthSet(touchtag, 0)
        CV_StealthSet(forceskin, "none")
        luigimode = 0
    end
end)

addHook("PlayerThink", function(player)
    if (gametype == GT_LUIGITAG) and (player.mo and player.valid)
        if (player.pflags & PF_TAGIT) and not (player.mo.skin == "luigi")
            R_SetPlayerSkin(player, "luigi")
        elseif not (player.pflags & PF_TAGIT) and not (player.mo.skin == "mario")
            R_SetPlayerSkin(player, "mario")
        end
    end
end)

addHook("ThinkFrame", do
    for player in players.iterate
        if (player.mo and player.valid) and (gametype == GT_LUIGITAG) and not (timelimit == 0)
    
        if not (player.pflags & PF_TAGIT) and (player.realtime >= (hidetime.value+(timelimit*60)-29)*TICRATE)
            for i=3,5
                if not (aura and aura.valid)
                    local aura = P_SpawnMobjFromMobj(player.mo, 0, 0, 0, MT_MAURA)
                    aura.color = SKINCOLOR_JET
                    aura.scale = player.mo.scale*i/2
                    aura.blendmode = AST_ADD
                    aura.fuse = 1
                    aura.spritexscale = player.mo.spritexscale
                    aura.spriteyscale = player.mo.spriteyscale
                    aura.spritexoffset = player.mo.spritexoffset
                    aura.spriteyoffset = player.mo.spriteyoffset-(aura.scale*i)
                end
            if (aura and aura.valid)
                P_TeleportMove(aura, player.mo.x, player.mo.y, player.mo.z)
                    end
                end
            end
        end
    end
end)

freeslot("MT_MAURA", "S_MAURA")

mobjinfo[MT_MAURA] = {
	doomednum = -1,
	spawnstate = S_MAURA,
	dispoffset = 4,
	flags = MF_NOCLIP|MF_NOCLIPHEIGHT|MF_SCENERY|MF_NOGRAVITY
}

states[S_MAURA] = {
	sprite = SPR_THOK,
	frame = FF_FULLBRIGHT|A,
	tics = 1,
	nextstate = S_MAURA
}