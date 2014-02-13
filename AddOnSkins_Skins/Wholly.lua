local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Wolly') then return end

local name = 'WhollySkin'
function AS:SkinWholly()
	local function SkinWhollyFrame()
		AS:SkinFrame(com_mithrandir_whollyFrame)
		AS:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
		AS:SkinScrollBar(com_mithrandir_whollyFrameScrollBar)
		com_mithrandir_whollyFrameZoneButton:ClearAllPoints()
		com_mithrandir_whollyFrameZoneButton:Point('TOP', com_mithrandir_whollyFrame, 'TOP', 60, -40)

		local buttons = {
			'SwitchZoneButton',
			'PreferencesButton',
			'SortButton'
		}
		for button,_ in pairs(buttons) do
			AS:SkinButton(_G['com_mithrandir_whollyFrame'..button])
		end
	end
	com_mithrandir_whollyFrame:HookScript('OnShow', function(self) SkinWhollyFrame() end)
end

AS:RegisterSkin(name, AS.SkinWholly)