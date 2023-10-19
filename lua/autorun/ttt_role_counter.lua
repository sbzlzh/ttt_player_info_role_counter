include("check.lua")

if IsTerrorTown() then
    if SERVER then
        AddCSLuaFile("autorun/client/cl_init.lua")
        AddCSLuaFile("autorun/client/round_end_info_handler.lua")
        include("init.lua")
    end
end
