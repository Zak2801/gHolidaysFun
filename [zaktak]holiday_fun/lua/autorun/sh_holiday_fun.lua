
if SERVER then
	resource.AddSingleFile("sound/holiday/pop.wav")
	resource.AddSingleFile("sound/holiday/confe.wav")
end

hook.Add("PlayerSay", "Holiday Handle CMDs", function(ply, text)
	if ( string.lower(text) == "/festive" ) then
		ply.HolidayDelayC = ply.HolidayDelayC or 0
		if ( ply.HolidayDelayC < CurTime() ) then
			local mdl = ply:GetModel()
			local models = { "models/player/bunny/zephyr_christmas_2019/elf/elf_trooper.mdl", "models/player/bunny/zephyr_christmas_2019/hannukah/hannukah_trooper.mdl", "models/player/bunny/zephyr_christmas_2019/reindeer/reindeer_trooper.mdl", "models/player/bunny/zephyr_christmas_2019/santa/santa_trooper.mdl", "models/player/bunny/zephyr_christmas_2019/snowman/snowman_trooper.mdl", "models/player/bunny/zephyr_christmas_2019/tree/tree_trooper.mdl" }
			for k, v in pairs(models) do
				if ( v == mdl ) then
					table.remove( models, k )
				end
			end
			ply:SetModel( table.Random(models) )

			ply:EmitSound("holiday/pop.wav")
			ply:Give( "zk_confetti_gun" )

			local vPoint = ply:WorldSpaceCenter() + Vector( 0, 0, 10 )
			local effectdata = EffectData()
			effectdata:SetOrigin( vPoint )
			util.Effect( "holiday_pop", effectdata )
			util.Effect( "StunstickImpact", effectdata )
			ply.HolidayDelayC = CurTime() + (15 * 60)
		else
			ply:ChatPrint( "You're currently on cooldown." )
		end
		return ""
	end
end)