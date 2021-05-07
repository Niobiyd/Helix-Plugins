AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Tent"
ENT.Category = "Helix"
ENT.Spawnable = true

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/kek1ch/tent.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetAngles(self:GetAngles() - Angle(0, 180, 0))
		self:DropToFloor()

		if (IsValid(self:GetPhysicsObject())) then
			self:GetPhysicsObject():EnableMotion(false)
		end
	end

	function ENT:Use(activator, caller)
		activator:GetCharacter():GetInventory():Add("tent")
		self:Remove()
	end

	function ENT:Think()
		if (!self.timeheal || self.timeheal < CurTime()) then
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 200 ) ) do
				if (v:IsPlayer() and v:Health() > 0) then
					v:SetHealth(v:Health() + 4)
				end
			end
			self.timeheal = CurTime() + 6
		end
	end
end
