AddCSLuaFile()

function IsTerrorTown()
    local isTerrorTown = engine.ActiveGamemode() == "terrortown"

    if not isTerrorTown then
        local gm = gmod.GetGamemode()

        if gm then
            isTerrorTown = gm.Name == "Trouble in Terrorist Town"
        end
    end

    return isTerrorTown
end
