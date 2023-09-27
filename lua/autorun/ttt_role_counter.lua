local isTerrorTown = engine.ActiveGamemode() == "terrortown"

if not isTerrorTown then
    local gm = gmod.GetGamemode()
    if gm then
        isTerrorTown = gm.Name == "Trouble in Terrorist Town"
    end
end

if isTerrorTown then
    if SERVER then
        AddCSLuaFile("autorun/client/cl_init.lua")
        include("init.lua")
    end
end
