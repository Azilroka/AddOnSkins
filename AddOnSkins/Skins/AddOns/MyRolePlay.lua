local AS, L, S, R = unpack(AddOnSkins)

function R:MyRolePlay()
	S:HandleFrame(MyRolePlayBrowseFrame)

	S:HandleTab(MyRolePlayBrowseFrameTab1)
	S:HandleTab(MyRolePlayBrowseFrameTab2)
	MyRolePlayBrowseFramePortrait:Hide()
	S:HandleCloseButton(MyRolePlayBrowseFrameCloseButton)
	S:HandleScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
	S:HandleScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
	S:HandleTab(CharacterFrameTab4)

	MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
	MyRolePlayMultiEditFrameScrollFrameTop:Hide()
	MyRolePlayMultiEditFrameScrollFrameBottom:Hide()
	MyRolePlayCharacterFrame.ver:SetPoint("TOP", CharacterFrameInset, "TOP", -110, 17)
	S:HandleButton(MyRolePlayMultiEditFrameOK)
	S:HandleButton(MyRolePlayMultiEditFrameCancel)
	S:HandleButton(MyRolePlayMultiEditFrameInherit)
	S:HandleButton(MyRolePlayComboEditFrameOK)
	S:HandleButton(MyRolePlayComboEditFrameCancel)
	S:HandleButton(MyRolePlayComboEditFrameInherit)
	S:HandleButton(MyRolePlayCharacterFrame_NewProfileButton)
	S:HandleButton(MyRolePlayCharacterFrame_RenProfileButton)
	S:HandleButton(MyRolePlayCharacterFrame_DelProfileButton)
	S:HandleButton(MyRolePlayEditFrameOK)
	S:HandleButton(MyRolePlayEditFrameCancel)
	S:HandleButton(MyRolePlayEditFrameInherit)
	MyRolePlayCharacterFrame_NewProfileButton:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
	MyRolePlayEditFrame.editbox:SetHeight(25)
	S:SetTemplate(MyRolePlayEditFrame.editbox)
	MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
	MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
	S:HandleNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
	S:HandleFrame(MyRolePlayCharacterFrame_ProfileComboBox, true)
	MyRolePlayCharacterFrame_ProfileComboBox:SetSize(100,20)
	MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
	MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
	S:HandleScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)

	local MRPFrames = {
		MyRolePlayBrowseFrame.Appearance,
		MyRolePlayBrowseFrame.Biography,
		MyRolePlayCharacterFrame_Fields
	}

	for _, object in pairs(MRPFrames) do
		for i = 1, object:GetNumChildren() do
			local f = select(i, object:GetChildren())
			if f and not f.reskinned and f:IsObjectType('Frame') then
				S:StripTextures(f, true)
				if f.h then
					S:HandleFrame(f.h, true)
					f.h.SetBackdrop = function() end
					f.h.fs:SetPoint("TOPLEFT", f.h, "TOPLEFT", 0, 1)
				end
				if f.sep then
					f.sep:SetAlpha(0)
				end
				f.reskinned = true
			end
		end
	end
end

AS:RegisterSkin('MyRolePlay')
