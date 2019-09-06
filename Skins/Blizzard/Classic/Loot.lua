if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_LootFrames()

	--GroupLootContainer.reservedSize = 32

	--for i = 1, NUM_GROUP_LOOT_FRAMES do
	--	local Frame = _G['GroupLootFrame'..i]
	--	AS:StripTextures(Frame)
	--	Frame:SetSize(328, 28)
	--	Frame:SetFrameStrata('MEDIUM')
	--	Frame:SetFrameLevel(1)

	--	Frame.Timer:ClearAllPoints()
	--	Frame.Timer:SetInside()
	--	AS:SkinStatusBar(Frame.Timer)

	--	Frame.IconFrame:ClearAllPoints()
	--	Frame.IconFrame:SetSize(28, 28)
	--	Frame.IconFrame:SetPoint('RIGHT', Frame, 'LEFT', -3, 0)

	--	AS:SetTemplate(Frame.IconFrame)
	--	AS:SkinTexture(Frame.IconFrame.Icon)
	--	Frame.IconFrame.Icon:SetInside()
	--	Frame.IconFrame.Border:SetAlpha(0)

	--	for _, Button in pairs({'NeedButton', 'GreedButton', 'PassButton', 'DisenchantButton'}) do
	--		Frame[Button]:ClearAllPoints()
	--		Frame[Button]:SetSize(24, 24)
	--	end

	--	Frame.NeedButton:SetPoint("LEFT", 5, -2)
	--	Frame.GreedButton:SetPoint("LEFT", Frame.NeedButton, "RIGHT", 5, 0)
	--	Frame.DisenchantButton:SetPoint("LEFT", Frame.GreedButton, "RIGHT", 5, 0)
	--	Frame.PassButton:SetPoint("LEFT", Frame.DisenchantButton, "RIGHT", 5, 2)

	--	Frame.Name:ClearAllPoints()
	--	Frame.Name:SetWordWrap(false)
	--	Frame.Name:SetWidth(200)
	--	Frame.Name:SetPoint('LEFT', Frame.PassButton, 'RIGHT', 5, 0)
	--end

	--hooksecurefunc('GroupLootFrame_OnShow', function(self)
	--	local texture, name, count, quality, bindOnPickUp = GetLootRollItemInfo(self.rollID)
	--	if (name == nil) then
	--		return
	--	end

	--	self.Name:SetText((bindOnPickUp and "BoP" or "BoE")..' |cFFFFFFFF'..name)
	--	self.Name:SetVertexColor(bindOnPickUp and 1 or .3, bindOnPickUp and .3 or 1, bindOnPickUp and .1 or .3)
	--	self.Timer:SetStatusBarColor(GetItemQualityColor(quality))
	--end)

	--[[
	AS:SkinFrame(MissingLootFrame)
	MissingLootFrame:CreateShadow()

	AS:SkinCloseButton(MissingLootFramePassButton)

	local function SkinButton()
		local number = GetNumMissingLootItems()
		for i = 1, number do
			local slot = _G["MissingLootFrameItem"..i]
			local icon = slot.icon
			if not slot.isSkinned then
				AS:StripTextures(slot)
				AS:SetTemplate(slot, 'Default')
				AS:StyleButton(slot)
				AS:SkinTexture(icon)
				icon:ClearAllPoints()
				icon:SetPoint("TOPLEFT", 2, -2)
				icon:SetPoint("BOTTOMRIGHT", -2, 2)

				slot.isSkinned = true
			end

			local quality = select(4, GetMissingLootItemInfo(i))
			local color = (GetItemQualityColor(quality)) or (unpack(C.media.bordercolor))
			frame:SetBackdropBorderColor(color)
		end
	end
	hooksecurefunc("MissingLootFrame_Show", SkinButton)

	-- loot history frame
	AS:StripTextures(LootHistoryFrame)
	AS:SkinCloseButton(LootHistoryFrame.CloseButton)
	AS:StripTextures(LootHistoryFrame)
	AS:SetTemplate(LootHistoryFrame)
	AS:SkinCloseButton(LootHistoryFrame.ResizeButton)
	LootHistoryFrame.ResizeButton.t:SetText("v v v v")
	AS:SetTemplate(LootHistoryFrame.ResizeButton)
	LootHistoryFrame.ResizeButton:SetWidth(LootHistoryFrame:GetWidth())
	LootHistoryFrame.ResizeButton:SetHeight(19)
	LootHistoryFrame.ResizeButton:ClearAllPoints()
	LootHistoryFrame.ResizeButton:SetPoint("TOP", LootHistoryFrame, "BOTTOM", 0, -2)
	AS:SkinScrollBar(LootHistoryFrameScrollFrameScrollBar)

	local function UpdateLoots(self)
		local numItems = C_LootHistory.GetNumItems()
		for i=1, numItems do
			local frame = self.itemFrames[i]

			if not frame.isSkinned then
				frame.NameBorderLeft:Hide()
				frame.NameBorderRight:Hide()
				frame.NameBorderMid:Hide()
				frame.IconBorder:Hide()
				frame.Divider:Hide()
				frame.ActiveHighlight:Hide()
				AS:SkinTexture(frame.Icon)
				frame.Icon:SetDrawLayer("ARTWORK")

				-- create a backdrop around the icon
				AS:CreateBackdrop(frame, 'Default')
				frame.Backdrop:SetPoint("TOPLEFT", frame.Icon, -2, 2)
				frame.Backdrop:SetPoint("BOTTOMRIGHT", frame.Icon, 2, -2)
				frame.Backdrop:SetBackdropColor(0,0,0,0)
				frame.isSkinned = true
			end
		end
	end
	hooksecurefunc("LootHistoryFrame_FullUpdate", UpdateLoots)

	-- master loot frame
	AS:StripTextures(MasterLooterFrame)
	AS:SetTemplate(MasterLooterFrame)

	hooksecurefunc("MasterLooterFrame_Show", function()
		local b = MasterLooterFrame.Item
		if b then
			local i = b.Icon
			local icon = i:GetTexture()
			local c = ITEM_QUALITY_COLORS[LootFrame.selectedQuality]

			AS:StripTextures(b)
			i:SetTexture(icon)
			AS:SkinTexture(i)
			AS:CreateBackdrop(b)
			b.Backdrop:SetOutside(i)
			b.Backdrop:SetBackdropBorderColor(c.r, c.g, c.b)
		end

		for i=1, MasterLooterFrame:GetNumChildren() do
			local child = select(i, MasterLooterFrame:GetChildren())
			if child and not child.isSkinned and not child:GetName() then
				if child:GetObjectType() == "Button" then
					if child:GetPushedTexture() then
						AS:SkinCloseButton(child)
					else
						AS:SetTemplate(child)
						AS:StyleButton(child)
					end
					child.isSkinned = true
				end
			end
		end
	end)

	-- bonus
	AS:StripTextures(BonusRollFrame)
	AS:CreateBackdrop(BonusRollFrame)
	BonusRollFrame.Backdrop:SetFrameLevel(0)
	AS:SkinTexture(BonusRollFrame.PromptFrame.Icon)
	BonusRollFrame.PromptFrame.IconBackdrop = CreateFrame("Frame", nil, BonusRollFrame.PromptFrame)
	BonusRollFrame.PromptFrame.IconBackdrop:SetFrameLevel(BonusRollFrame.PromptFrame.IconBackdrop:GetFrameLevel() - 1)
	BonusRollFrame.PromptFrame.IconBackdrop:SetOutside(BonusRollFrame.PromptFrame.Icon)
	AS:SetTemplate(BonusRollFrame.PromptFrame.IconBackdrop)
	BonusRollFrame.PromptFrame.Timer.Bar:SetTexture(75/255,  175/255, 76/255)
	BonusRollFrame.PromptFrame.Timer.Bar:SetVertexColor(75/255,  175/255, 76/255)
	AS:StripTextures(BonusRollFrame.BlackBackgroundHoist)
	AS:CreateBackdrop(BonusRollFrame.PromptFrame.Timer)]]
end

AS:RegisterSkin('Blizzard_LootFrames', AS.Blizzard_LootFrames)
