local AS, ASL = unpack(AddOnSkins)
if not AS:CheckAddOn('Tukui') then return end

-- Cache global variables
--Lua functions
local select, floor = select, floor
--WoW API / Variables
local CreateFrame = CreateFrame
local IsAddOnLoaded = IsAddOnLoaded
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
-- GLOBALS:

local T, C = Tukui:unpack()

function AS:UpdateMedia()
	AS.HideShadows = C['General']['HideShadows']

	AS.DataTextFontSize = 12 -- T['DataTexts']['Size']
	AS.DataTexts = T['DataTexts']
	AS.InfoLeft = T['Panels']['DataTextLeft']
	AS.InfoRight = T['Panels']['DataTextRight']
	AS.ChatBackgroundRight = T['Panels']['RightChatBG']
	AS.ChatBackgroundLeft = T['Panels']['LeftChatBG']
	AS.TabsRightBackground = T['Panels']['TabsBGRight']
	AS.TabsLeftBackground = T['Panels']['TabsBGLeft']
	AS.Minimap = T['Maps']['Minimap']
	AS.ActionBar1 = T['Panels']['ActionBar1']
	AS.ActionBar2 = T['Panels']['ActionBar2']
	AS.ActionBar3 = T['Panels']['ActionBar3']
	AS.ActionBar4 = T['Panels']['ActionBar4']

	AS.Blank = C['Medias']['Blank']
	AS.NormTex = C['Medias']['Normal']
	AS.Font = C['Medias']['Font']
	AS.BackdropColor = C['General']['BackdropColor']
	AS.BorderColor = C['General']['BorderColor']
end
