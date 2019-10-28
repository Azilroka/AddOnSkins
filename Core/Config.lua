local AS = unpack(AddOnSkins)
if AS:CheckAddOn('ProjectAzilroka') or AS:CheckAddOn('ElvUI') then return end

local EC = AS:NewModule("EnhancedConfig", 'AceConsole-3.0', 'AceEvent-3.0')
_G.Enhanced_Config = EC

EC.Title = "|cff1784d1Enhanced Config|r"
EC.Authors = "Azilroka"

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

EC.Options = {
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

function EC:PositionGameMenuButton()
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + GameMenuButtonLogout:GetHeight() - 4)

	if AS:CheckAddOn('Tukui') and Tukui[1].Miscellaneous.GameMenu.Tukui then
		GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + GameMenuButtonLogout:GetHeight() - 4)
	end

	local _, relTo, _, _, offY = GameMenuButtonLogout:GetPoint()
	if relTo ~= GameMenuFrame['EC'] then
		GameMenuFrame['EC']:ClearAllPoints()
		GameMenuFrame['EC']:SetPoint("TOPLEFT", AS:CheckAddOn('Tukui') and Tukui[1].Miscellaneous.GameMenu.Tukui or relTo, "BOTTOMLEFT", 0, -1)
		GameMenuButtonLogout:ClearAllPoints()
		GameMenuButtonLogout:SetPoint("TOPLEFT", GameMenuFrame['EC'], "BOTTOMLEFT", 0, offY)
	end
end

function EC.OnConfigClosed(widget, event)
	AS.ACD.OpenFrames['Enhanced_Config'] = nil
	AS.GUI:Release(widget)
end

function EC:ToggleConfig()
	if not AS.ACD.OpenFrames['Enhanced_Config'] then
		local Container = AS.GUI:Create('Frame')
		AS:CreateShadow(Container.frame)
		AS.ACD.OpenFrames['Enhanced_Config'] = Container
		Container:SetCallback('OnClose', EC.OnConfigClosed)
		AS.ACD:Open('Enhanced_Config', Container)
	end

	GameTooltip:Hide()
end

function EC:ADDON_LOADED(event, addon)
	if addon == 'Tukui' then
		Tukui[1].Miscellaneous.GameMenu.EnableTukuiConfig = function() end
		Tukui[1].Miscellaneous.GameMenu.AddHooks = function() end
		EC:UnregisterEvent(event)
	end
end

function EC:Initialize()
	local GameMenuButton = CreateFrame("Button", nil, GameMenuFrame, "GameMenuButtonTemplate")
	GameMenuButton:SetText(AS.Title)
	GameMenuButton:SetScript("OnClick", function()
		EC:ToggleConfig()
		HideUIPanel(GameMenuFrame)
	end)
	GameMenuFrame['EC'] = GameMenuButton

	if not IsAddOnLoaded("ConsolePortUI_Menu") then
		GameMenuButton:SetSize(GameMenuButtonLogout:GetWidth(), GameMenuButtonLogout:GetHeight())
		GameMenuButton:SetPoint("TOPLEFT", GameMenuButtonAddons, "BOTTOMLEFT", 0, -1)
		hooksecurefunc('GameMenuFrame_UpdateVisibleButtons', self.PositionGameMenuButton)
	end

	AS.AC:RegisterOptionsTable('Enhanced_Config', EC.Options)
	AS.ACD:SetDefaultSize('Enhanced_Config', 1200, 800)
	EC:RegisterChatCommand('ec', 'ToggleConfig')

	EC:RegisterEvent('ADDON_LOADED')
end

EC:Initialize()
