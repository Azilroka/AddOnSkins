local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:WIM(event)
	local WIMMenu = _G["WIM3Menu"]
	local WIMGroup1 = _G["WIM3MenuGroup1"]
	local WIMGroup1T = _G["WIM3MenuGroup1Title"]

	local function wimHookSkinDialog()
		S:StripTextures(WIMMenu)
		S:HandleFrame(WIMMenu)

		S:StripTextures(WIMGroup1)
		S:StripTextures(WIMGroup1T)

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
		S:StripTextures(winopthook)
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

AS:RegisterSkin('WIM')
