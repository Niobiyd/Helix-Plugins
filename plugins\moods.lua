local PLUGIN = PLUGIN
PLUGIN.name = 'Emote moods'
PLUGIN.author = 'DrodA (NS 1.1), MediQ (ix)'
PLUGIN.description = 'With this plugin, characters can set their mood.'
PLUGIN.schema = 'Any'

local stored = PLUGIN.moods or {}
PLUGIN.moods = stored

local defaultIndex = 'unidentified'
function PLUGIN:GetPlayerMood(client)
	return client:GetNetVar('mood', defaultIndex)
end

function PLUGIN:ResetPlayerMood(client)
	return client:SetNetVar('mood', defaultIndex)
end

function PLUGIN:SetPlayerMood(client, strIndex)
	return (self.moods[strIndex] and client:SetNetVar('mood', self.moods[strIndex].index))
end

function PLUGIN:GetMood(strIndex)
	return (strIndex and PLUGIN.moods[strIndex]) or self.moods
end

function PLUGIN:AddMood(strIndex, tblData)
	strIndex = strIndex or 'unidentified'
	tblData = tblData or {}
	tblData.index = tblData.index or strIndex

	self.moods[strIndex] = tblData
end

local tblWorkaround = {['ix_keys'] = true, ['ix_hands'] = true}
function PLUGIN:CalcMainActivity(client, velocity)
	if (PLUGIN:GetPlayerMood(client) != defaultIndex and tblWorkaround[client:GetActiveWeapon():GetClass()]) then
		local modelClass = self.moods[PLUGIN:GetPlayerMood(client)][ix.anim.GetModelClass(client:GetModel())]

		if (client.CalcSeqOverride ~= -1) then
			client.CalcSeqOverride = client:LookupSequence(client.CalcSeqOverride)

			return client.CalcIdeal, client.CalcSeqOverride
		end
	end
end

PLUGIN:AddMood('Test',
{
	--					-- 	
	-- Your body 		-- ["citizen_male"] = {["idle"] = "LineIdle02", ["walk"] = "pace_all"},
	--					--
})

PLUGIN:AddMood('Test_1',
{
	--					-- 	
	-- Your body 		-- ["citizen_male"] = {["idle"] = "LineIdle02", ["walk"] = "pace_all"},
	--					--
})

for k, v in pairs(PLUGIN.moods) do

	local command_data = {}
	command_data.arguments = { ix.type.anim }

	command_data.OnRun = function( self, client, arguments )

	local model_class = v[ix.anim.GetModelClass(client:GetModel())]

	
		if (model_class) then
			if (PLUGIN:GetPlayerMood(client) == k) then
				return PLUGIN:ResetPlayerMood(client)
			end

			return PLUGIN:SetPlayerMood(client, k)
		end
	end

	ix.command.Add( 'mood'..k, command_data )
end
