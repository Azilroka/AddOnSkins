local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MyRolePlay') then return end

function AS:MyRolePlay()
	AS:SkinFrame(MyRolePlayBrowseFrame)

	AS:SkinTab(MyRolePlayBrowseFrameTab1)
	AS:SkinTab(MyRolePlayBrowseFrameTab2)
	MyRolePlayBrowseFramePortrait:Hide()
	AS:SkinCloseButton(MyRolePlayBrowseFrameCloseButton)
	AS:SkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
	AS:SkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
	AS:SkinTab(CharacterFrameTab4)

	MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
	MyRolePlayMultiEditFrameScrollFrameTop:Hide()
	MyRolePlayMultiEditFrameScrollFrameBottom:Hide()
	MyRolePlayCharacterFrame.ver:SetPoint("TOP", CharacterFrameInset, "TOP", -110, 17)
	AS:SkinButton(MyRolePlayMultiEditFrameOK)
	AS:SkinButton(MyRolePlayMultiEditFrameCancel)
	AS:SkinButton(MyRolePlayMultiEditFrameInherit)
	AS:SkinButton(MyRolePlayComboEditFrameOK)
	AS:SkinButton(MyRolePlayComboEditFrameCancel)
	AS:SkinButton(MyRolePlayComboEditFrameInherit)
	AS:SkinButton(MyRolePlayCharacterFrame_NewProfileButton)
	AS:SkinButton(MyRolePlayCharacterFrame_RenProfileButton)
	AS:SkinButton(MyRolePlayCharacterFrame_DelProfileButton)
	AS:SkinButton(MyRolePlayEditFrameOK)
	AS:SkinButton(MyRolePlayEditFrameCancel)
	AS:SkinButton(MyRolePlayEditFrameInherit)
	MyRolePlayCharacterFrame_NewProfileButton:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
	MyRolePlayEditFrame.editbox:SetHeight(25)
	AS:SetTemplate(MyRolePlayEditFrame.editbox)
	MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
	MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
	AS:SkinArrowButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
	AS:SkinBackdropFrame(MyRolePlayCharacterFrame_ProfileComboBox)
	MyRolePlayCharacterFrame_ProfileComboBox:SetSize(100,20)
	MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
	MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
	AS:SkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)

	local MRPFrames = {
		MyRolePlayBrowseFrame.Appearance,
		MyRolePlayBrowseFrame.Biography,
		MyRolePlayCharacterFrame_Fields
	}

	for _, object in pairs(MRPFrames) do
		for i = 1, object:GetNumChildren() do
			local f = select(i, object:GetChildren())
			if f and not f.reskinned and f:IsObjectType('Frame') then
				AS:StripTextures(f, true)
				if f.h then
					AS:SkinBackdropFrame(f.h)
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

AS:RegisterSkin('MyRolePlay', AS.MyRolePlay)
