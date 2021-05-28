// ██████████████████████████████████████████████████████████████████████████████████████████████████████████████
// █─▄▄▄─█─▄▄─█▄─▄▄▀█▄─▄▄─███▄─█▀▀▀█─▄█▄─▄▄▀█▄─▄█─▄─▄─█▄─▄▄─█▄─▄▄▀███▄─▄─▀█▄─█─▄███▄─▀█▀─▄█▄─▄▄─█▄─▄▄▀█▄─▄█─▄▄▄─█
// █─███▀█─██─██─██─██─▄█▀████─█─█─█─███─▄─▄██─████─████─▄█▀██─██─████─▄─▀██▄─▄█████─█▄█─███─▄█▀██─██─██─██─██▀─█
// ▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▀▄▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▀▀▀▀▄▄▄▄▀▀▀▄▄▄▀▀▀▀▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▄▄▄▀───▄▄▀


//  Copyright [2021] [MediQ]

//  Licensed under the Apache License, Version 2.0 (the 'License');
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an 'AS IS' BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

// Code writen by MEDIQ 
// File created: 28.05.2021
// Last Edit: 28.05.2021
// My contacts:

// Discord     :       .Медий#9657
// Github      :       https://github.com/Niobiyd
// Steam       :       https://steamcommunity.com/profiles/76561198843899799/

// 1 = CW
// 2 = IX                                                  

player
client

Clockwork.kernel:IncludePrefixed("sh_config.lua")
ix.util.Include("sh_config.lua", "shared")

player:SetCharacterData(
client:GetCharacter():SetData(

//----------------------// Config //----------------------//

Clockwork.config:Get("cfg"):Get();
ix.config.Get("cfg")


Clockwork.config:Add(
ix.config.Add(

//----------------------// Anims //----------------------//

Clockwork.animation:AddCivilProtectionModel(
ix.anim.SetModelClass(

//----------------------// Money //----------------------//

Clockwork.config:SetKey(
ix.currency.Set(

//----------------------// netstreams //----------------------//

Clockwork.datastream:Start(
netstream.Start(

Clockwork.datastream:Hook(
netstream.Hook(

//----------------------// flags //----------------------//

Clockwork.flag:Add(
ix.flag.Add(

Clockwork.player:GiveFlags(
client:GetCharacter():GiveFlags(

Clockwork.player:TakeFlags(
client:GetCharacter():TakeFlags(

Clockwork.player:HasFlags(
client:GetCharacter():HasFlags(

//----------------------// ITEM //----------------------//

-- CW
function ITEM:OnUse(player, entity)
end 

-- IX
ITEM.functions.Use = {
    OnRun = function( item )
    end
}
//----------------------------------//

Clockwork.item:CreateInstance(
ix.item.Instance(

player:GiveItem(Clockwork.item:CreateInstance(
client:GetCharacter():GetInventory():Add(

Clockwork.entity:CreateItem(player, Clockwork.item:CreateInstance(
ix.item.Spawn(

function Schema:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
    -- ...
end
    
function Schema:GetPlayerPainSound(client)
    -- ...
end

ITEM.cost
ITEM.price

//----------------------// font //----------------------//

Clockwork.fonts:Add("CwExampleFont", {
    font		= "Arial",
    size		= Clockwork.kernel:FontScreenScale(7),
    weight		= 700
});

surface.CreateFont( 'ixExampleFont', {	
    font = 'Arial',
    size = ScreenScale( 9 ),
    extended = true,
    weight = 0,
})

//----------------------// Notice //----------------------//

Clockwork.player:Notify(player, L(player, "CannotTakeItemStored"));
client:NotifyLocalized("CannotTakeItemStored")

Clockwork.player:Notify(player, "CannotTakeItemStored"));
client:Notify("CannotTakeItemStored")

//----------------------// Plugin //----------------------//

// file names
-- plugin.ini 
-- sh_plugin.lua

[Plugin]
name="Cross Server Chat";
author="Alex Grist";
description="Allows players to chat across servers.";
compatibility="0.93";

local PLUGIN = PLUGIN
PLUGIN.Name = "Cross Server Chat"
PLUGIN.Author = "Alex Grist"
PLUGIN.description = "Allows players to chat across servers."

//----------------------// Language //----------------------//

CW_ENGLISH = Clockwork.lang:GetTable("English");
CW_ENGLISH["CrossServerChatEnabled"] = "Cross Server Chat Enabled";
CW_ENGLISH["CrossServerChatEnabledDesc"] = "Whether or not cross server chat is enabled.";
CW_ENGLISH["CrossServerChatName"] = "Cross Server Chat Name";
CW_ENGLISH["CrossServerChatNameDesc"] = "A unique server name for cross server chat.";

LANGUAGE = {
    CrossServerChatEnabled = 'Cross Server Chat Enabled.',
    CrossServerChatEnabledDesc = 'Whether or not cross server chat is enabled.',
    CrossServerChatName = 'Cross Server Chat Name',
    CrossServerChatNameDesc = 'A unique server name for cross server chat.',
}
