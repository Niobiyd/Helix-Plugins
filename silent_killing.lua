local PLUGIN = PLUGIN
PLUGIN.name = 'Silent-Kill'
PLUGIN.author = 'SuperMicronde | MediQ (ix)'
PLUGIN.schema = 'Any'

ix.config.Add('silentkill', true, 'Silent-Kill enable?', nil, {
	category = 'server'
})

function PlayerTakeDamageAtHead( target, dmg )

	if ix.config.Get( 'silentkill', true ) then

		local victimHealth = target:Health()

		if IsValid( target ) && target:IsPlayer() && dmg:GetDamage() <= victimHealth && dmg:IsDamageType( DMG_BULLET ) then

			local shootPos = dmg:GetDamagePosition()
			local bonePos = target:GetBonePosition( target:LookupBone( 'bip01_head' ) || target:GetBonePosition(target:LookupBone( 'ValveBiped.Bip01_Head1' ) ) )

			if shootPos:Distance( bonePos ) < 10 then

				dmg:SetDamage( victimHealth + math.random( 1, 23 ) )
			end
		end
	end	
end
