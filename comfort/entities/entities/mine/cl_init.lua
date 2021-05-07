include("shared.lua")

function ENT:Draw() 
	self:DrawModel()
end

function ENT:Initialize() 
	self:SetModel("models/hardbass/bomb_c4.mdl") 
end