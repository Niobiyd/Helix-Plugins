local PLUGIN = PLUGIN
PLUGIN.Name = 'Return to death position.'
PLUGIN.Author = 'Chancer [NS] | MediQ [ix]'
PLUGIN.Schema = 'Any'

ix.lang.AddTable('russian', 
	{
		Wait = 'Подождите, пока вы возродитесь.',
		noDeathPos = 'Положение смерти не сохранено!',
	}
)

ix.lang.AddTable('english',
	{
		Wait = 'Wait until you respawn.',
		noDeathPos = 'No death position saved!',
	}
)

function PLUGIN:PlayerDeath( victim, inflictor, attacker )
	local char = victim:GetCharacter()
	
	if ( char ) then
		char:SetData( 'deathPos', victim:GetPos())
	end
end

ix.command.Add( 'ReturnDeathPos',
	{
		adminOnly = true,	
		OnRun = function( client, target, arguments )
			if ( IsValid( client ) ) then
				if ( client:Alive() ) then
					local char = client:GetCharacter()
					local oldPos = char:GetData('deathPos')
					
					if ( oldPos ) then
						client:SetPos( oldPos )
						char:SetData( 'deathPos', nil )
					else
						client:NotifyLocalized( noDeathPos )
					end
				else
					client:NotifyLocalized( Wait )
				end
			end
		end
	}
)
