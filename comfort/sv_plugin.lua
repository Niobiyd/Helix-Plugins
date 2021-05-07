local PLUGIN = PLUGIN

local saveEnts = {
    ['fireplace'] = true,
    ['mine'] = true,
    ['spalnit'] = true,
    ['ix_kerosinka'] = true,
    ['ix_tent'] = true,
    ['multipechka'] = true,
    ['pechka'] = true
}

function Schema:SaveData()
    local savedEntities = {}

    for k, v in ipairs(ents.GetAll()) do
        local class = v:GetClass():lower()
            
        if (saveEnts[class]) then
            table.insert(savedEntities, {
                class = class, 
                pos = v:GetPos(),
                ang = v:GetAngles(),
            })
        end
    end

    self:SetData(savedEntities)
end

function Schema:LoadData()
    local savedEntities = self:GetData() or {}
    
    for k, v in ipairs(ents.GetAll()) do
        local class = v:GetClass():lower()
        if (saveEnts[class]) then
            v:Remove()
        end
    end
    
    for k, v in ipairs(savedEntities) do
        local ent = ents.Create(v.class)
        ent:SetPos(v.pos)
        ent:SetAngles(v.ang)
        ent:Spawn()
        ent:Activate()

        local phys = ent:GetPhysicsObject()
        if (IsValid(phys)) then
            phys:Wake()
            phys:EnableMotion()
        end

    end
end

--[[netstream.Hook('start_sleep2', function(client, amount)
    x = (amount * 4) + client:GetCharacter():GetData('sleep_need', 0)
    client:GetCharacter():SetData('sleep_need', math.Clamp(x, 0, 100))
 end)

netstream.Hook('sleep_need', function(client)
    client:GetCharacter():SetData('sleep_need', client:GetCharacter():GetData('sleep_need') - 5)
 end)

function PLUGIN:PlayerSpawn(client)
    if client:GetCharacter() then
        client:GetCharacter():SetData('sleep_need', 100)
    end
end]]
