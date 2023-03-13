local AS, L, S, R = unpack(AddOnSkins)

function R:Wholly()
	S:HandleTooltip(com_mithrandir_WhollyTooltip)
	com_mithrandir_whollyFrame:HookScript('OnShow', function(self)
		if not self.isSkinned then
			S:HandleFrame(self)
			S:HandleCloseButton(com_mithrandir_whollyFrameCloseButton)
			S:HandleDropDownBox(com_mithrandir_whollyFrameZoneButton)
			com_mithrandir_whollyFrameZoneButtonText:ClearAllPoints()
			com_mithrandir_whollyFrameZoneButtonText:SetPoint('LEFT', com_mithrandir_whollyFrameZoneButton, 'LEFT', 32, 2)
			com_mithrandir_whollyFrameZoneButtonText:SetDrawLayer('OVERLAY')

			local buttons = {
				'SwitchZoneButton',
				'PreferencesButton',
				'SortButton'
			}

			for _, button in pairs(buttons) do
				local btn = _G['com_mithrandir_whollyFrame'..button]
				if btn then
					S:HandleButton(btn)
				end
			end

			self.isSkinned = true
		end
		local ScrollBar = com_mithrandir_whollyFrameScrollFrameScrollBar
		if ScrollBar and not ScrollBar.isDone then
			S:HandleScrollBar(ScrollBar)
			ScrollBar.isDone = true
		end
	end)
end

AS:RegisterSkin('Wholly')
