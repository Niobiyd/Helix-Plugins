AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

function ENT:Initialize()
	self:SetSolid(SOLID_VPHYSICS)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetModel("models/kek1ch/bomb_c4.mdl")
	self:SetTrigger( true )
	self:DrawShadow( false )
	self:DropToFloor()

	if (IsValid(self:GetPhysicsObject())) then
		self:GetPhysicsObject():EnableMotion(false)
	end
end

function ENT:EndTouch( )
	local effectData = EffectData()
	effectData:SetStart( self:GetPos() )
	effectData:SetOrigin( self:GetPos() )
	effectData:SetScale(0.2)
	util.Effect("HelicopterMegaBomb", effectData, true, true)
	self:EmitSound("ssk/weapons/f1_explode.wav")
	
	self:Remove()
	
	for k, v in pairs( ents.FindInSphere( self:GetPos(), 25 ) ) do
		v:TakeDamage(100)
	end
end

function ENT:StartTouch()
	self:EmitSound("ssk/weapons/mine_on.wav")
end