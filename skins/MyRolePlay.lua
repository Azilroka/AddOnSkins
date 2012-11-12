local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "MyRolePlaySkin"
local function SkinMyRolePlay(self)
	hooksecurefunc(mrp, "CreateBrowseFrame", function()
		if (AS:CheckOption("MyRolePlaySkin")) then 
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

			AS:SkinTab(MyRolePlayBrowseFrameTab1)
			AS:SkinTab(MyRolePlayBrowseFrameTab2)

			MyRolePlayBrowseFramePortrait:Hide()

			AS:SkinCloseButton(MyRolePlayBrowseFrameCloseButton)
			AS:SkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
			AS:SkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
		end
	end)

	hooksecurefunc(mrp, "AddMRPTab", function()
		if (AS:CheckOption("MyRolePlaySkin")) then
			AS:SkinTab(CharacterFrameTab5)
		end
	end)

	hooksecurefunc(mrp, "CreateEditFrames", function()
		if (AS:CheckOption("MyRolePlaySkin")) then
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
			AS:SkinNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
			MyRolePlayCharacterFrame_ProfileComboBox:StripTextures()
			MyRolePlayCharacterFrame_ProfileComboBox:CreateBackdrop()
			MyRolePlayCharacterFrame_ProfileComboBox:Size(100,20)
			MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
			MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
		--	MyRolePlayComboEditFrameComboBox:StripTextures()
		--	MyRolePlayComboEditFrameComboBox:CreateBackdrop()
		--	AS:SkinEditBox(MyRolePlayComboEditFrameComboBox)
		--	MyRolePlayComboEditFrameComboBox:Size(100,20)
		--	MyRolePlayComboEditFrameComboBoxButton:ClearAllPoints()
		--	MyRolePlayComboEditFrameComboBoxButton:SetPoint("RIGHT", MyRolePlayComboEditFrameComboBox, "RIGHT", 0 , 0)
		--	AS:SkinNextPrevButton(MyRolePlayComboEditFrameComboBoxButton)
			AS:SkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)
		end
	end)

	hooksecurefunc(mrp, "CreateOptionsPanel", function()
		if (AS:CheckOption("MyRolePlaySkin")) then
			AS:SkinCheckBox(MyRolePlayOptionsPanel_Enable)
			AS:SkinCheckBox(MyRolePlayOptionsPanel_MRPButton)
			AS:SkinCheckBox(MyRolePlayOptionsPanel_RPChatName)
			AS:SkinCheckBox(MyRolePlayOptionsPanel_Biog)
			AS:SkinCheckBox(MyRolePlayOptionsPanel_FormAC)
			AS:SkinCheckBox(MyRolePlayOptionsPanel_EquipAC)
			AS:SkinDropDownBox(MyRolePlayOptionsPanel_TTStyle)
			AS:SkinDropDownBox(MyRolePlayOptionsPanel_HeightUnit)
			AS:SkinDropDownBox(MyRolePlayOptionsPanel_WeightUnit)
		end
	end)

	local function reskinHeader(c, field)
		if (AS:CheckOption("MyRolePlaySkin")) then
			for i = 1, field:GetNumChildren() do
				local f = select(i, field:GetChildren())
				if not f.reskinned then
					f.h.SetBackdrop = E.noop
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
	end

	hooksecurefunc(mrp, "CreateCFpfield", reskinHeader)
	hooksecurefunc(mrp, "CreateBFpfield", reskinHeader)
end

AS:RegisterSkin(name,SkinMyRolePlay)