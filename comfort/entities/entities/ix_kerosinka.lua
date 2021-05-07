AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Керосиновая лампа"
ENT.Category = "Helix"
ENT.Spawnable = true

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/kek1ch/dev_kerosinka.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:DropToFloor()

		if (IsValid(self:GetPhysicsObject())) then
			self:GetPhysicsObject():EnableMotion(false)
		end

		timer.Simple(2000, function()
			if IsValid(self) then
				self:Remove()
			end
		end)

	end
end

if (CLIENT) then
	function ENT:Think()
		local dist = LocalPlayer():GetPos():Distance(self:GetPos())
		if(dist < 500) then
			self.Light = DynamicLight(self:EntIndex())
			if (self.Light) then
				self.Light.pos = (self:GetPos() + Vector(0, 0, 30))
				self.Light.r = 131
				self.Light.g = 77
				self.Light.b = 24
				self.Light.brightness = 2
				self.Light.Decay = 1000
				self.Light.Size = 362
				self.Light.DieTime = CurTime() + 1
			end
		end
	end
end
