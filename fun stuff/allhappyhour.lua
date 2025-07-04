addHook("MapLoad", function(mapid)
	if (gametype ~= GT_COOP) then return end
	if (G_IsSpecialStage(mapid)) then return end
	if (maptol & TOL_NIGHTS) then return end

	local hasexit = false

	--remove exitsectors
	local SSF_REALEXIT = 1<<7
	for sec in sectors.iterate
		if (sec.specialflags & SSF_REALEXIT)
		or (GetSecSpecial(sec.special, 4) == 2)
			sec.specialflags = $ &~SSF_REALEXIT
			hasexit = true
		end
	end

	if hasexit
		for mt in mapthings.iterate
			if mt.type == 1
				print("ASDSD")
				print(mt.angle,mt.angle*FU)
				local x,y = ReturnTrigAngles(FixedAngle(mt.angle*FU))
				local px,py,pz  = mt.x*FU,mt.y*FU,mt.z*FU
				local door = P_SpawnMobj(px-(100*x),py-(100*y),pz*FU,MT_HHEXIT)
			end
			
			if mt.type == 501 then
				local trig = P_SpawnMobj(
					mt.x*FU, 
					mt.y*FU, 
					mt.z*FU,
					MT_HHTRIGGER
				)
				if mt.options & MTF_OBJECTFLIP then
					trig.flags2 = $ | MF2_OBJECTFLIP
				end
				if (mt.mobj and mt.mobj.valid) then P_RemoveMobj(mt.mobj) end
			end

		end	
	end
end)
