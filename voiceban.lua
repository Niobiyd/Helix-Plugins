

-- ██████████████████████████████████████████████████████████████████████████████████████████████████████████████
-- █─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▄─█▀▀▀█─▄█▄─▄▄▀█▄─▄█─▄─▄─█▄─▄▄─█▄─▄▄▀███▄─▄─▀█▄─█─▄███▄─▀█▀─▄█▄─▄▄─█▄─▄▄▀█▄─▄█─▄▄▄─█
-- █─███▀█─██─██─██─██─▄█▀████─█─█─█─███─▄─▄██─████─████─▄█▀██─██─████─▄─▀██▄─▄█████─█▄█─███─▄█▀██─██─██─██─██▀─█
-- ▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▀▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▀▀▀▀▄▄▄▄▀▀▀▄▄▄▀▀▀▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▄▄▄▀───▄▄▀


--  Copyright [2021] [MediQ]

--  Licensed under the Apache License, Version 2.0 (the 'License');
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at

--     http://www.apache.org/licenses/LICENSE-2.0

--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an 'AS IS' BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.

--	Steam:   https://steamcommunity.com/profiles/76561198843899799/
--	github:  https://github.com/Niobiyd
--	discord: .Медий#9657


local PLUGIN = PLUGIN
PLUGIN.Author = 'MediQ'
PLUGIN.Name = 'Voice Ban'
PLUGIN.Schema = 'Any'

if (SERVER) then

    function GM:PlayerCanHearPlayersVoice( listener, speaker )
        if ( speaker:GetData('VoiceBan') || !speaker:Alive() ) then
            return false
        end
    end

end

ix.command.Add('VoiceUnBan', {
    description = 'Voice Mute Player.',
    adminOnly = true,
    arguments = { ix.type.player },
    OnRun = function( self, client, target )

       if ( target == client ) then
        client:Notify( 'You cannot unmute yourself.' )
        return false
    end) 
        client:Notify( 'You have unmute a player.' )
        target:Notify( 'You ve been unmuted by the admin.' )
    end,
})

ix.command.Add('VoiceBan', {
    description = 'Voice Mute Player.',
    adminOnly = true,
    arguments = { ix.type.player },
    OnRun = function( self, client, target )

       if ( target == client ) then
        client:Notify( 'You cannot mute yourself.' )
        return false
    end) 
        client:Notify( 'You have mute a player.' )
        target:Notify( 'You ve been muted by the admin.' )
    end,
})
