-- You can contribute to adding more languages on this website: https://github.com/sbzlzh/TTT-Player-Info-Role-Counter

local L = LANG.CreateLanguage("English")

-- Role names
L["innocent"] = "Innocent"
L["detective"] = "Detective"
L["traitor"] = "Traitor"
L["spectator"] = "Spectator"

-- Additional phrases
L["this_round_has"] = "This round has"
L["round_name"] = " "
L["round_and"] = " and "

L["symbol"] = ": "
L["symbol2"] = "s"
L["symbol3"] = ","
L["symbol4"] = "."
L["symbol5"] = ""

L["round_player_info"] = "The role distribution this round"
L["innocent"] = "Innocent"
L["traitor"] = "Traitor"
L["detective"] = "Detective"

-- Colors
L["color_innocent"] = Color(0, 255, 0, 255)
L["color_detective"] = Color(0, 0, 255, 255)
L["color_traitor"] = Color(255, 0, 0, 255)
L["color_spectator"] = Color(255, 255, 0, 255)

-- Save the language
LANG.AddToLanguage("English", L)
