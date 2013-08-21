local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "MyRolePlaySkin"
function AS:SkinMyRolePlay()
	hooksecurefunc(mrp, "CreateBrowseFrame", function()
		local bg = CreateFrame("Frame", nil, MyRolePlayBrowseFrame)
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
		bg:SetFrameLevel(MyRolePlayBrowseFrame:GetFrameLevel()-1)
		AS:SkinFrame(bg)
		MyRolePlayBrowseFrame:DisableDrawLayer("BACKGROUND")
		MyRolePlayBrowseFrame:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFramePortraitFrame:Hide()
		MyRolePlayBrowseFrameTopBorder:Hide()
		MyRolePlayBrowseFrameTopRightCorner:Hide()
		MyRolePlayBrowseFrameInset:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFrameInsetBg:Hide()
		AS:SkinTab(MyRolePlayBrowseFrameTab1)
		AS:SkinTab(MyRolePlayBrowseFrameTab2)
		MyRolePlayBrowseFramePortrait:Hide()
		AS:SkinCloseButton(MyRolePlayBrowseFrameCloseButton)
		AS:SkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
		AS:SkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
	end)

	hooksecurefunc(mrp, "AddMRPTab", function()
		AS:SkinTab(CharacterFrameTab5)
	end)

	hooksecurefunc(mrp, "CreateEditFrames", function()
		MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
		MyRolePlayMultiEditFrameBg:Hide()
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
		MyRolePlayCharacterFrame_NewProfileButton:Point("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
		MyRolePlayEditFrame.editbox:Height(25)
		MyRolePlayEditFrame.editbox:SetTemplate()
		MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
		MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
		AS:SkinNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
		AS:SkinBackdropFrame(MyRolePlayCharacterFrame_ProfileComboBox)
		MyRolePlayCharacterFrame_ProfileComboBox:Size(100,20)
		MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
		MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
		AS:SkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)
	end)

	hooksecurefunc(mrp, "CreateOptionsPanel", function()
		AS:SkinCheckBox(MyRolePlayOptionsPanel_Enable)
		AS:SkinCheckBox(MyRolePlayOptionsPanel_MRPButton)
		AS:SkinCheckBox(MyRolePlayOptionsPanel_RPChatName)
		AS:SkinCheckBox(MyRolePlayOptionsPanel_Biog)
		AS:SkinCheckBox(MyRolePlayOptionsPanel_FormAC)
		AS:SkinCheckBox(MyRolePlayOptionsPanel_EquipAC)
		AS:SkinDropDownBox(MyRolePlayOptionsPanel_TTStyle)
		AS:SkinDropDownBox(MyRolePlayOptionsPanel_HeightUnit)
		AS:SkinDropDownBox(MyRolePlayOptionsPanel_WeightUnit)
	end)

	local function reskinHeader(c, field)
		for i = 1, field:GetNumChildren() do
			local f = select(i, field:GetChildren())
			if not f.reskinned then
				f.h.SetBackdrop = function() end
				f:StripTextures(true)
				AS:SkinBackdropFrame(f.h)
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
end

AS:RegisterSkin(name, AS.SkinMyRolePlay)