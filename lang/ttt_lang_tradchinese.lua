local L = LANG.CreateLanguage("正體中文 ")

-- Role names
L["innocent"] = "無辜者"
L["detective"] = "探長"
L["traitor"] = "叛徒"
L["spectator"] = "旁觀者"

-- Additional phrases
L["this_round_has"] = "本輪有"
L["round_name"] = " 名"
L["round_and"] = " 和 "

L["symbol"]= "："
L["symbol2"]= ""
L["symbol3"]= "，"
L["symbol4"]= "。"
L["symbol5"]= ""

L["round_player_info"] = "本輪角色分配"
L["innocent"] = "無辜者"
L["traitor"] = "叛徒"
L["detective"] = "探長"

-- Colors
L["color_innocent"] = Color(0, 255, 0, 255)
L["color_detective"] = Color(0, 0, 255, 255)
L["color_traitor"] = Color(255, 0, 0, 255)
L["color_spectator"] = Color(255, 255, 0, 255)

-- Save the language
LANG.AddToLanguage("正體中文 ", L)
