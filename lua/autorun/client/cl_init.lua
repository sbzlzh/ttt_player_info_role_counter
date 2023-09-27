local isTerrorTown = engine.ActiveGamemode() == "terrortown"

if not isTerrorTown then
    local gm = gmod.GetGamemode()

    if gm then
        isTerrorTown = gm.Name == "Trouble in Terrorist Town"
    end
end

if isTerrorTown then
    local ROLE_INNOCENT = 0
    local ROLE_TRAITOR = 1
    local ROLE_DETECTIVE = 2
    local ROLE_SPECTATOR = 3

    local function GetLanguageTable()
        local ply = LocalPlayer()
        local lang = ply:GetNWString("Language", "English")

        return LANG.GetUnsafeLanguageTable(lang)
    end

    net.Receive("TTT_RoleCount_Start", function()
        local L = GetLanguageTable()
        local innocents = net.ReadUInt(6)
        local detectives = net.ReadUInt(6)
        local traitors = net.ReadUInt(6)
        local spectators = net.ReadUInt(6)

        local function roleSuffix(count)
            return count > 1 and L["symbol2"] or L["symbol5"]
        end

        chat.AddText(
            color_white, L["this_round_has"] .. L["symbol"],
            L["color_traitor"], traitors .. L["round_name"] .. L["traitor"] .. roleSuffix(traitors), color_white, L["symbol3"],
            L["color_innocent"], innocents .. L["round_name"] .. L["innocent"] .. roleSuffix(innocents), color_white, L["symbol3"],
            L["color_detective"], detectives .. L["round_name"] .. L["detective"] .. roleSuffix(detectives), color_white, L["round_and"],
            L["color_spectator"], spectators .. L["round_name"] .. L["spectator"] .. roleSuffix(spectators), color_white, L["symbol4"]
        )
    end)
end
