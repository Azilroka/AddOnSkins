local AS = ElvUI[1]:GetModule('AddOnSkins')

if not (AS:CheckAddOn('Wholly') and AS:CheckAddOn('Grail')) then return end

local name = "WhollySkin"
function AS:SkinWholly()

	local function SkinWhollyFrame()
		if com_mithrandir_whollyFrame.IsSkinned then return end
		AS:SkinFrame(com_mithrandir_whollyFrame)
		AS:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
		AS:SkinFrame(com_mithrandir_whollyFrameScrollFrame)
		AS:SkinScrollBar(com_mithrandir_whollyFrameScrollFrameScrollBar)
		AS:SkinDropDownBox(com_mithrandir_whollyFrameZoneButton, 240)
		UIDropDownMenu_JustifyText(com_mithrandir_whollyFrameZoneButton, "CENTER")
		AS:SkinButton(com_mithrandir_whollyFrameSwitchZoneButton)
		AS:SkinButton(com_mithrandir_whollyFrameSortButton)
		AS:SkinButton(com_mithrandir_whollyFramePreferencesButton)
		com_mithrandir_whollyFrame.IsSkinned = true
	end

	com_mithrandir_whollyFrame:HookScript("OnShow", function(self) SkinWhollyFrame() end)
end

AS:RegisterSkin(name, AS.SkinWholly)