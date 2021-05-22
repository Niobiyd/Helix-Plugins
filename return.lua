local PLUGIN = PLUGIN
PLUGIN.Name = 'Return to death position.'
PLUGIN.Author = 'Chancer [NS] | MediQ [ix]'
PLUGIN.Schema = 'Any'

function PLUGIN:PlayerDeath( victim, inflictor, attacker )
	local char = victim:GetCharacter()
	
	if ( char ) then
		char:SetData( 'deathPos', victim:GetPos())
	end
end

ix.command.Add( 'ReturnDeathPos',
	{
	OnRun = function( client, arguments )
		if ( IsValid( client ) ) then
			if ( client:Alive() ) then
				local char = client:GetCharacter()
				local oldPos = char:GetData("deathPos")
				
				if ( oldPos ) then
					client:SetPos( oldPos )
					char:SetData( 'deathPos', nil )
				else
					client:Notify( 'No death position saved.' )
				end
			else
				client:Notify( 'Wait until you respawn.' )
			end
		end
	end
	}
)
