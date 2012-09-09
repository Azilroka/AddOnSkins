if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("MyRolePlay") then return end
local SkinMyRolePlay = CreateFrame("Frame")
	SkinMyRolePlay:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinMyRolePlay:SetScript("OnEvent", function(self)
	if (UISkinOptions.MyRolePlaySkin == "Disabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

hooksecurefunc(mrp, "CreateBrowseFrame", function()
	local bg = CreateFrame("Frame", nil, MyRolePlayBrowseFrame)
	bg:SetPoint("TOPLEFT")
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetFrameLevel(MyRolePlayBrowseFrame:GetFrameLevel()-1)
	bg:SetTemplate("Transparent")

	MyRolePlayBrowseFrame:DisableDrawLayer("BACKGROUND")
	MyRolePlayBrowseFrame:DisableDrawLayer("BORDER")
	MyRolePlayBrowseFramePortraitFrame:Hide()
	MyRolePlayBrowseFrameTopBorder:Hide()
	MyRolePlayBrowseFrameTopRightCorner:Hide()
	MyRolePlayBrowseFrameInset:DisableDrawLayer("BORDER")
	MyRolePlayBrowseFrameInsetBg:Hide()

	cSkinTab(MyRolePlayBrowseFrameTab1)
	cSkinTab(MyRolePlayBrowseFrameTab2)

	MyRolePlayBrowseFramePortrait:Hide()

	cSkinCloseButton(MyRolePlayBrowseFrameCloseButton)
	cSkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
	cSkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
end)

hooksecurefunc(mrp, "AddMRPTab", function()
	cSkinTab(CharacterFrameTab5)
end)

hooksecurefunc(mrp, "CreateEditFrames", function()
	MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
	MyRolePlayMultiEditFrameBg:Hide()
	MyRolePlayMultiEditFrameScrollFrameTop:Hide()
	MyRolePlayMultiEditFrameScrollFrameBottom:Hide()

	MyRolePlayCharacterFrame.ver:SetPoint("TOP", CharacterFrameInset, "TOP", -110, 17)
	cSkinButton(MyRolePlayMultiEditFrameOK)
	cSkinButton(MyRolePlayMultiEditFrameCancel)
	cSkinButton(MyRolePlayMultiEditFrameInherit)
	cSkinButton(MyRolePlayComboEditFrameOK)
	cSkinButton(MyRolePlayComboEditFrameCancel)
	cSkinButton(MyRolePlayComboEditFrameInherit)
	cSkinButton(MyRolePlayCharacterFrame_NewProfileButton)
	cSkinButton(MyRolePlayCharacterFrame_RenProfileButton)
	cSkinButton(MyRolePlayCharacterFrame_DelProfileButton)
	cSkinButton(MyRolePlayEditFrameOK)
	cSkinButton(MyRolePlayEditFrameCancel)
	cSkinButton(MyRolePlayEditFrameInherit)
	MyRolePlayCharacterFrame_NewProfileButton:Point("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
	MyRolePlayEditFrame.editbox:Height(25)
	MyRolePlayEditFrame.editbox:SetBackdrop({
				bgFile = "",
				edgeFile = "",
				tile = true,
				tileSize = 0,
				edgeSize = 0,
				insets = { left = 0, right = 0, top = 0, bottom = 0	},
		} )
	MyRolePlayEditFrame.editbox:CreateBackdrop()
	MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
	MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
	cSkinNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
	MyRolePlayCharacterFrame_ProfileComboBox:StripTextures()
	MyRolePlayCharacterFrame_ProfileComboBox:CreateBackdrop()
	MyRolePlayCharacterFrame_ProfileComboBox:Size(100,20)
	MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
	MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
--	MyRolePlayComboEditFrameComboBox:StripTextures()
--	MyRolePlayComboEditFrameComboBox:CreateBackdrop()
--	cSkinEditBox(MyRolePlayComboEditFrameComboBox)
--	MyRolePlayComboEditFrameComboBox:Size(100,20)
--	MyRolePlayComboEditFrameComboBoxButton:ClearAllPoints()
--	MyRolePlayComboEditFrameComboBoxButton:SetPoint("RIGHT", MyRolePlayComboEditFrameComboBox, "RIGHT", 0 , 0)
--	cSkinNextPrevButton(MyRolePlayComboEditFrameComboBoxButton)
	cSkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)
end)

hooksecurefunc(mrp, "CreateOptionsPanel", function()
	cSkinCheckBox(MyRolePlayOptionsPanel_Enable)
	cSkinCheckBox(MyRolePlayOptionsPanel_MRPButton)
	cSkinCheckBox(MyRolePlayOptionsPanel_RPChatName)
	cSkinCheckBox(MyRolePlayOptionsPanel_Biog)
	cSkinCheckBox(MyRolePlayOptionsPanel_FormAC)
	cSkinCheckBox(MyRolePlayOptionsPanel_EquipAC)
	cSkinDropDownBox(MyRolePlayOptionsPanel_TTStyle)
	cSkinDropDownBox(MyRolePlayOptionsPanel_HeightUnit)
	cSkinDropDownBox(MyRolePlayOptionsPanel_WeightUnit)
end)

local function reskinHeader(c, field)
	for i = 1, field:GetNumChildren() do
		local f = select(i, field:GetChildren())
		if not f.reskinned then
			local s = UIPackageSkinFuncs.s
			local z = UIPackageSkinFuncs.c
			if IsAddOnLoaded("ElvUI") then f.h.SetBackdrop = z.noop end
			if IsAddOnLoaded("Tukui") then f.h.SetBackdrop = s.dummy end
			f:StripTextures(True)
			f.h:CreateBackdrop()
			f.h:StripTextures(True)
			f.h.fs:SetPoint("TOPLEFT", f.h, "TOPLEFT", 0, 1)

		if f.sep then
			f.sep:SetAlpha(0)
		end

		f.reskinned = true
		end
	end
end

hooksecurefunc(mrp, "CreateCFpfield", reskinHeader)
hooksecurefunc(mrp, "CreateBFpfield", reskinHeader)

end)