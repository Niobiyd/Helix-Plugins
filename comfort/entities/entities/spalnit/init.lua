AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/kek1ch/mattress02.mdl")
		self:SetSolid(MOVETYPE_VPHYSICS)
		self:PhysicsInit(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:DropToFloor()

		if (IsValid(self:GetPhysicsObject())) then
			self:GetPhysicsObject():EnableMotion(false)
		end
	end

	function ENT:Think()
		if (!self.timeheal or self.timeheal < CurTime()) then
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 200 ) ) do
				if (v:IsPlayer() and v:Health() > 0 and v:Health() < 110) then
					v:SetHealth(v:Health() + 1)
				end
			end
			self.timeheal = CurTime() + 3
		end
	end

	function ENT:Use(activator, caller)
		netstream.Start(activator, "sleep")
	end

	function ENT:OnRemove()
	end
end