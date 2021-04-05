local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:Blizzard_AddonManager()
	AS:SkinFrame(_G.AddonList)
	AS:CreateShadow(_G.AddonList)

	AS:SkinBackdropFrame(_G.AddonListScrollFrame)
	AS:SkinScrollBar(_G.AddonListScrollFrameScrollBar)

	_G.AddonListScrollFrame.Backdrop:SetPoint('TOPLEFT', -14, 0)
	_G.AddonListScrollFrame.Backdrop:SetPoint('BOTTOMRIGHT', 0, -1)
	AS:SkinButton(_G.AddonList.EnableAllButton, true)
	AS:SkinButton(_G.AddonList.DisableAllButton, true)
	AS:SkinButton(_G.AddonList.OkayButton, true)
	AS:SkinButton(_G.AddonList.CancelButton, true)

	AS:SkinCheckBox(_G.AddonListForceLoad)
	_G.AddonListForceLoad:SetSize(26, 26)
	AS:SkinDropDownBox(_G.AddonCharacterDropDown, 165)

	for i = 1, _G.MAX_ADDONS_DISPLAYED do
		AS:SkinCheckBox(_G["AddonListEntry"..i.."Enabled"])
		AS:SkinButton(_G["AddonListEntry"..i].LoadAddonButton)
	end
end

AS:RegisterSkin('Blizzard_AddonManager', AS.Blizzard_AddonManager)
