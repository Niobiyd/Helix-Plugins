ITEM.name = "Керосиновая лампа"
ITEM.description = "Керосиновая малпа из-за своих больших размеров не пользуется особой популярностью среди сталкеров, но достаточно удобна и практична в качестве статичного источника освещения в лагере. \n\nХАРАКТЕРИСТИКИ: \n-технологическое приспособление \n-не требует заправки"
ITEM.price = 678
ITEM.model = "models/kek1ch/dev_kerosinka.mdl"
ITEM.width = 1
ITEM.height = 2
--ITEM.weight = 1.33

ITEM.functions.Use = { 
	name = "Use",
	OnRun = function( item )
		local client = item.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local trace = util.TraceLine(data)
		
		local lamp = ents.Create("ix_kerosinka")
		lamp:SetPos(trace.HitPos + trace.HitNormal * 10)
		lamp:Spawn()
		client:EmitSound( Sound("interface/inv_put_up_tent.ogg"), Entity(1):GetPos(), 1, CHAN_AUTO, 1, 20, 0, 100)
		client:ScreenFade(SCREENFADE.OUT, Color(0, 0, 0), 1, 3)
		timer.Simple(1,function()
			client:ScreenFade(SCREENFADE.IN, Color(0, 0, 0), 1, 3)
		end)
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

