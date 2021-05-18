local PLUGIN = PLUGIN
PLUGIN.name = 'Comfort++'
PLUGIN.author = 'Kek1ch | MediQ (ix)'
PLUGIN.schema = 'Any'

ix.util.Include( 'sv_plugin.lua', 'server' )

-- if (CLIENT) then
	--[[function Schema:Think()
		local client = LocalPlayer()
		if (client:Alive() and client:GetCharacter()) then
			if client:GetCharacter():GetData('sleep_need') < 10 then
				if (!client.sleepnow or client.sleepnow < CurTime()) then
					client:ScreenFade( SCREENFADE.IN, Color(255, 255, 255, 4 ), 1, 1 )
					timer.Simple(1, function()
						client:ScreenFade( SCREENFADE.OUT, Color( 255, 255, 255, 4 ), 1, 1 )
					end)
					client.sleepnow = CurTime() + 2.1
				end
			end
			if (!client.sleep or client.sleep < CurTime()) then
				if client:GetCharacter():GetData('sleep_need') > 5 then
					netstream.Start('sleep_need')
				end
				client.sleep = CurTime() + 900
			end
		end
	end]]
-- end
