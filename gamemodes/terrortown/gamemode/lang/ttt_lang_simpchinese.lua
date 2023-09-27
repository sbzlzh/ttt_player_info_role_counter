-- 您可以在此网站上贡献添加更多语言：https://github.com/sbzlzh/TTT-Player-Info-Role-Counter

local L = LANG.CreateLanguage("简体中文")

-- Role names
L["innocent"] = "无辜者"
L["detective"] = "探长"
L["traitor"] = "叛徒"
L["spectator"] = "旁观者"

-- Additional phrases
L["this_round_has"] = "本轮有"
L["round_name"] = " 名"
L["round_and"] = " 和 "

L["symbol"] = "："
L["symbol2"] = ""
L["symbol3"] = "，"
L["symbol4"] = "。"
L["symbol5"] = ""

L["round_player_info"] = "本轮角色分配"
L["innocent"] = "无辜者"
L["traitor"] = "叛徒"
L["detective"] = "探长"

-- Colors
L["color_innocent"] = Color(0, 255, 0, 255)
L["color_detective"] = Color(0, 0, 255, 255)
L["color_traitor"] = Color(255, 0, 0, 255)
L["color_spectator"] = Color(255, 255, 0, 255)

-- Save the language
LANG.AddToLanguage("简体中文", L)
