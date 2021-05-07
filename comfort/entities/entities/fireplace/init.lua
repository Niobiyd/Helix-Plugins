AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.FirePlaceOn = false
ENT.FirePlaceTurnOn2T = 0
ENT.FirePlacetime = 0

util.AddNetworkString("turn_on_f")
util.AddNetworkString("turn_on_s")

function ENT:Initialize()
	self:SetModel("models/z-o-m-b-i-e/st/fireplace/st_fireplace_01_1.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow( false )

	self:DropToFloor()

	if (IsValid(self:GetPhysicsObject())) then
		self:GetPhysicsObject():EnableMotion(false)
	end
end

function ENT:Think()
	if self.FirePlaceOn == true then
		if !self.FirePlaceSOUND or self.FirePlaceSOUND < CurTime() then
			self:EmitSound("interface/fire2_extinguished.ogg")
			self.FirePlaceSOUND = CurTime() + 8.1
		end
		if self.FirePlacetime < CurTime() then
			self.FirePlaceOn = false
			self:StopParticles()
			self.FirePlacetime = 0
			if self.firesound1 then self.firesound1:Stop() end
		end
		if CurTime() > self.FirePlaceTurnOn2T then
			net.Start("turn_on_s")
			net.WriteEntity(self)
			net.Broadcast()
			self.FirePlaceTurnOn2T = CurTime() + 999999999999*99999999999
		end
		net.Start("turn_on_f")
		net.WriteEntity(self)
		net.Broadcast()
	else
		if self.firesound1 then self.firesound1:Stop() end
		self:StopParticles()
	end
end

function ENT:Use(activator, caller)
	if self.FirePlaceOn == false then
		local items = activator:GetCharactertChar():GetInventory():HasItem("tinderbox")
		if (items) then
			local inv = activator:GetCharacter():GetInventory() 
			for k, v in pairs(inv:GetItems()) do
				local itemTable = ix.item.instances[v.id]
				if (itemTable:GetData("tinderboxAmount", 0) > 0) then
					itemTable:SetData("tinderboxAmount", itemTable:GetData("tinderboxAmount", 0) - 1)
					self.FirePlaceOn = true
					self.FirePlacetime = CurTime() + 1000
					self.FirePlaceTurnOn2T = 0
					self:EmitSound(Sound("interface/inv_matches.ogg"),60,100)

				--	activator:ForceSequence()
					activator:Freeze(true)
					timer.Create("frizitem"..activator:UniqueID(),5,1,function()
						activator:Freeze(false)
					end)
					activator:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 )
					timer.Simple(1,function()
					activator:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 )
					end)
				end
			end
		end
	else
		self.FirePlaceOn = false
		self:StopParticles()
		self.FirePlacetime = 0
		if self.firesound1 then self.firesound1:Stop() end
	end
end

function ENT:OnRemove()
	self:StopParticles()
	if self.firesound1 then self.firesound1:Stop() end
end