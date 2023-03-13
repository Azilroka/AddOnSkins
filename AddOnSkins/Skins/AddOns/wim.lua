local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:WIM(event)
	if event == 'PLAYER_ENTERING_WORLD' then

		WIM:ShowOptions()
		if WIM3_Options:IsShown() then
			WIM3_Options:Hide()
		else
			WIM:ShowOptions()
			WIM3_Options:Hide()
		end

		local WIMMenu = _G["WIM3Menu"]
		local WIMGroup1 = _G["WIM3MenuGroup1"]
		local WIMGroup1T = _G["WIM3MenuGroup1Title"]

		local function wimHookSkinDialog()
			WIMMenu:StripTextures()
			S:HandleFrame(WIMMenu)

			WIMGroup1:StripTextures()
			WIMGroup1T:StripTextures()

			for i = 1,99 do
				local button =_G["WIM3MenuButton"..i]
				if button then
					S:HandleButton(button)
				else
					break
				end
			end
		end
		WIMMenu:HookScript("OnShow", wimHookSkinDialog)

		local winopthook = _G["WIM3_Options"]
		local function wimHookSkinOpt()
			winopthook:StripTextures()
			S:HandleFrame(winopthook)

			for i = 1,4 do
				local button = _G["WIM3_OptionsNavCat"..i]
				if button then
					S:HandleButton(button)
				end
			end

			for i = 1,13 do
				local button = _G["WIM3_OptionsNavSubButton"..i]
				if button then
					S:HandleButton(button)
				else
					break
				end
			end
		end
		winopthook:HookScript("OnShow",wimHookSkinOpt)
	end
end

AS:RegisterSkin('WIM')
