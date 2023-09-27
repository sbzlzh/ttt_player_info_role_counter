local isTerrorTown = engine.ActiveGamemode() == "terrortown"

if not isTerrorTown then
    local gm = gmod.GetGamemode()
    if gm then
        isTerrorTown = gm.Name == "Trouble in Terrorist Town"
    end
end

if isTerrorTown then
    if SERVER then
        util.AddNetworkString("TTT_RoleCount_Start")
        util.AddNetworkString("TTT_RoundEndInfo")

        local plyInRound = {} -- the players that were active at round start

        local spamProtection = {}

        local function WriteRoleDistribution()
            local roles = {}

            roles[ROLE_INNOCENT] = 0
            roles[ROLE_DETECTIVE] = 0
            roles[ROLE_TRAITOR] = 0

            local role

            for _, ply in pairs(plyInRound) do
                role = ply:GetRole()
                roles[role] = roles[role] + 1
            end

            net.WriteUInt(roles[ROLE_INNOCENT], 6)
            net.WriteUInt(roles[ROLE_DETECTIVE], 6)
            net.WriteUInt(roles[ROLE_TRAITOR], 6)
        end

        hook.Add("TTTBeginRound", "TTT_RoleCount_Start", function()
            spamProtection = {}
            plyInRound = {}
            local spectators = 0

            for _, ply in pairs(player.GetAll()) do
                if (! ply:IsSpec()) then
                    plyInRound[ply:EntIndex()] = ply
                else
                    spectators = spectators + 1
                end
            end

            net.Start("TTT_RoleCount_Start")

            WriteRoleDistribution()

            net.WriteUInt(spectators, 6)
            net.Broadcast()
        end)

        hook.Add("TTTEndRound", "TTT_RoundEndInfo", function(result)
            net.Start("TTT_RoundEndInfo")

            net.WriteUInt(#player.GetAll(), 7)

            for _, ply in ipairs(player.GetAll()) do
                net.WriteString(ply:Nick())
                net.WriteUInt(ply:GetRole(), 2)
            end

            net.Broadcast()
        end)
    end
end
