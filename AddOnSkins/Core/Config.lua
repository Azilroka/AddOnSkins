local AS = unpack(AddOnSkins)
if AS:CheckAddOn('ProjectAzilroka') or AS:CheckAddOn('ElvUI') then return end

local AC = AS:NewModule("AddOnSkinsConfig", 'AceConsole-3.0', 'AceEvent-3.0')
_G.AddOnSkins_Config = AC

AC.Title = "|cff1784d1AddOnSkins Config|r"
AC.Authors = "Azilroka"

local DEVELOPERS = {
	'Elv',
	'Tukz',
	'Hydrazine',
	'Whiro',
}

local DEVELOPER_STRING = ''

sort(DEVELOPERS, function(a,b) return a < b end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..'\n'..devName
end

AC.Options = {
	type = 'group',
	name = AS.Title,
	order = 205,
	args = {
		credits = {
			type = 'group',
			name = 'Credits',
			order = -1,
			args = {
				text = {
					order = 1,
					type = 'description',
					fontSize = 'medium',
					name = 'Coding:\n'..DEVELOPER_STRING,
				},
			},
		},
	},
}

function AC:PositionGameMenuButton()
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + GameMenuButtonLogout:GetHeight() - 4)

	if AS:CheckAddOn('Tukui') and Tukui[1].Miscellaneous.GameMenu.Tukui then
		GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + GameMenuButtonLogout:GetHeight() - 4)
	end

	local _, relTo, _, _, offY = GameMenuButtonLogout:GetPoint()
	if relTo ~= GameMenuFrame['AC'] then
		GameMenuFrame['AC']:ClearAllPoints()
		GameMenuFrame['AC']:SetPoint("TOPLEFT", AS:CheckAddOn('Tukui') and Tukui[1].Miscellaneous.GameMenu.Tukui or relTo, "BOTTOMLEFT", 0, -1)
		GameMenuButtonLogout:ClearAllPoints()
		GameMenuButtonLogout:SetPoint("TOPLEFT", GameMenuFrame['AC'], "BOTTOMLEFT", 0, offY)
	end
end

function AC.OnConfigClosed(widget, event)
	AS.Libs.ACD.OpenFrames['AddOnSkins_Config'] = nil
	AS.Libs.GUI:Release(widget)
end

function AC:ToggleConfig()
	if not AS.Libs.ACD.OpenFrames['AddOnSkins_Config'] then
		local Container = AS.Libs.GUI:Create('Frame')
		AS:CreateShadow(Container.frame)
		AS.Libs.ACD.OpenFrames['AddOnSkins_Config'] = Container
		Container:SetCallback('OnClose', AC.OnConfigClosed)
		AS.Libs.ACD:Open('AddOnSkins_Config', Container)
	end

	GameTooltip:Hide()
end

function AC:ADDON_LOADED(event, addon)
	if addon == 'Tukui' then
		Tukui[1].Miscellaneous.GameMenu.EnableTukuiConfig = function() end
		Tukui[1].Miscellaneous.GameMenu.AddHooks = function() end
		AC:UnregisterEvent(event)
	end
end

function AC:Initialize()
	local GameMenuButton = CreateFrame("Button", nil, GameMenuFrame, "GameMenuButtonTemplate")
	GameMenuButton:SetText(AS.Title)
	GameMenuButton:SetScript("OnClick", function()
		AC:ToggleConfig()
		HideUIPanel(GameMenuFrame)
	end)
	GameMenuFrame['AC'] = GameMenuButton

	if not IsAddOnLoaded("ConsolePortUI_Menu") then
		GameMenuButton:SetSize(GameMenuButtonLogout:GetWidth(), GameMenuButtonLogout:GetHeight())
		GameMenuButton:SetPoint("TOPLEFT", GameMenuButtonAddons, "BOTTOMLEFT", 0, -1)
		hooksecurefunc('GameMenuFrame_UpdateVisibleButtons', self.PositionGameMenuButton)
	end

	AS.Libs.AC:RegisterOptionsTable('AddOnSkins_Config', AC.Options)
	AS.Libs.ACD:SetDefaultSize('AddOnSkins_Config', 1200, 800)
	AC:RegisterChatCommand('addonskins', 'ToggleConfig')

	AC:RegisterEvent('ADDON_LOADED')
end

AC:Initialize()
