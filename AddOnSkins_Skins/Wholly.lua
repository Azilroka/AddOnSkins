local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Wholly') then return end

local name = 'WhollySkin'
function AS:SkinWholly()
	AS:SkinTooltip(com_mithrandir_WhollyTooltip)
	com_mithrandir_whollyFrame:HookScript('OnShow', function(self)
		if not self.isSkinned then
			AS:SkinFrame(self)
			AS:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
			com_mithrandir_whollyFrameZoneButton:ClearAllPoints()
			com_mithrandir_whollyFrameZoneButton:Point('TOP', com_mithrandir_whollyFrame, 'TOP', 60, -40)

			local buttons = {
				'SwitchZoneButton',
				'PreferencesButton',
				'SortButton'
			}

			for button, _ in pairs(buttons) do
				AS:SkinButton(_G['com_mithrandir_whollyFrame'..button])
			end

			self.isSkinned = true
		end

		if com_mithrandir_whollyFrameScrollBar and not com_mithrandir_whollyFrameScrollBar.isDone then
			AS:SkinScrollBar(com_mithrandir_whollyFrameScrollBar)
			com_mithrandir_whollyFrameScrollBar.isDone = true
		end
	end)
end

AS:RegisterSkin(name, AS.SkinWholly)