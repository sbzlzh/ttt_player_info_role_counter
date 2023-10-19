include("check.lua")

if IsTerrorTown() then
    local ROLE_INNOCENT = 0
    local ROLE_TRAITOR = 1
    local ROLE_DETECTIVE = 2
    local ROLE_SPECTATOR = 3

    local function GetLanguageTable()
        local ply = LocalPlayer()
        local lang = ply:GetNWString("Language", "English")

        return LANG.GetUnsafeLanguageTable(lang)
    end

    local ROLE_STRINGS = {
        [ROLE_INNOCENT] = "无辜者",
        [ROLE_DETECTIVE] = "探长",
        [ROLE_TRAITOR] = "叛徒",
        [ROLE_SPECTATOR] = "旁观者"
    }

    local ROLE_COLORS = {
        [ROLE_INNOCENT] = Color(0, 255, 0, 255),
        [ROLE_DETECTIVE] = Color(0, 0, 255, 255),
        [ROLE_TRAITOR] = Color(255, 0, 0, 255),
        [ROLE_SPECTATOR] = Color(128, 128, 128, 255)
    }

    net.Receive("TTT_RoundEndInfo", function()
        local playerCount = net.ReadUInt(7)
        local innocentPlayers = {}
        local detectivePlayers = {}
        local traitorPlayers = {}
        local spectatorPlayers = {}
        local namecolor = Color(255, 235, 135, 255)

        for i = 1, playerCount do
            local plyName = net.ReadString()
            local plyRole = net.ReadUInt(2)

            if plyRole == ROLE_SPECTATOR then
                table.insert(spectatorPlayers, plyName)
            elseif plyRole == ROLE_INNOCENT then
                table.insert(innocentPlayers, plyName)
            elseif plyRole == ROLE_DETECTIVE then
                table.insert(detectivePlayers, plyName)
            elseif plyRole == ROLE_TRAITOR then
                table.insert(traitorPlayers, plyName)
            end
        end

        local L = GetLanguageTable()

        chat.AddText(color_white, L["round_player_info"], L["symbol"])

        local roleStrings = {
            [ROLE_INNOCENT] = L["innocent"],
            [ROLE_TRAITOR] = L["traitor"],
            [ROLE_DETECTIVE] = L["detective"]
        }

        local roleColors = {
            [ROLE_INNOCENT] = L["color_innocent"],
            [ROLE_TRAITOR] = L["color_traitor"],
            [ROLE_DETECTIVE] = L["color_detective"]
        }

        for role, players in pairs({
            [ROLE_INNOCENT] = innocentPlayers,
            [ROLE_TRAITOR] = traitorPlayers,
            [ROLE_DETECTIVE] = detectivePlayers
        })

        do
            if #players > 0 then
                chat.AddText(roleColors[role], roleStrings[role], namecolor, L["symbol"] .. table.concat(players, L["symbol3"]))
            end
        end
    end)
end
