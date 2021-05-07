ENT.Base 			= "base_gmodentity"
ENT.Type 			= "anim"
ENT.Author 			= "Kek1ch"
ENT.Category		= "Helix"
ENT.PrintName		= "Fire Place"
ENT.Spawnable = true
ENT.AdminSpawnable = true

net.Receive("turn_on_f", function()
	local ent = net.ReadEntity()
end)

game.AddParticles( "particles/vfire_flames_medium_lod.pcf" )
PrecacheParticleSystem( "vfire_flames_medium_lod" )

net.Receive("turn_on_s", function()
	--local ent = net.ReadEntity()
	--ParticleEffectAttach("vfire_flames_medium_lod", PATTACH_ABSORIGIN_FOLLOW, ent, 0)
	--ParticleEffectAttach("vfire_flames_medium_lod", PATTACH_ABSORIGIN_FOLLOW, ent, 0)

	local ent = net.ReadEntity()
    local ID = ent:LookupAttachment("1")
    ParticleEffectAttach("vfire_flames_medium_lod",PATTACH_POINT_FOLLOW,ent,ID)
end)

