local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BtWQuests') then return end

local _G = _G

function AS:BtWQuests()
	AS:SkinBackdropFrame(BtWQuestsFrame)

	AS:SkinBackdropFrame(BtWQuestsFrame.navBar, nil, nil, true)
	AS:StripTextures(BtWQuestsFrame.navBar.overlay, true)
	BtWQuestsFrame.navBar.Backdrop:SetPoint("TOPLEFT", -2, 0)
	BtWQuestsFrame.navBar.Backdrop:SetPoint("BOTTOMRIGHT")

	AS:SkinButton(BtWQuestsFrameHomeButton, true)
	BtWQuestsFrameHomeButton.xoffset = 1
	BtWQuestsFrameHomeButton.isSkinned = true

	AS:StripTextures(BtWQuestsFrame.Inset, true)

	AS:SkinCloseButton(BtWQuestsFrame.CloseButton)

	AS:SkinScrollBar(BtWQuestsChainScrollFrameScrollBar)
	AS:SkinScrollBar(BtWQuestsFrameCategoryScrollBar)

	local function SkinQuests()
		local b1 = _G["BtWQuestsFrameQuestSelectScrollFrameScrollChildCategory1"]
		if b1 and not b1.isSkinned then
			AS:SkinButton(b1)
			AS:SetInside(b1.bgImage)
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("ARTWORK")
			b1.isSkinned = true
		end

		local b2 = _G["BtWQuestsFrameQuestSelectScrollFrameScrollChildChain1"]
		if b2 and not b2.isSkinned then
			AS:SkinButton(b2)
			AS:SetInside(b2.bgImage)
			b2.bgImage:SetTexCoord(.08, .6, .08, .6)
			b2.bgImage:SetDrawLayer("ARTWORK")
			b2.isSkinned = true
		end

		for i = 1, 10 do
			local BtWQuestsFrameCategory = _G["BtWQuestsFrameQuestSelectScrollFramecategory"..i]
			if BtWQuestsFrameCategory and not BtWQuestsFrameCategory.isSkinned then
				AS:SkinButton(BtWQuestsFrameCategory)
				AS:SetInside(BtWQuestsFrameCategory.bgImage)
				BtWQuestsFrameCategory.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsFrameCategory.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsFrameCategory.isSkinned = true
			end
		end

		for i = 1, 10 do
			local BtWQuestsFrameChain = _G["BtWQuestsFrameQuestSelectScrollFramechain"..i]
			if BtWQuestsFrameChain and not BtWQuestsFrameChain.isSkinned then
				AS:SkinButton(BtWQuestsFrameChain)
				AS:SetInside(BtWQuestsFrameChain.bgImage)
				BtWQuestsFrameChain.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsFrameChain.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsFrameChain.isSkinned = true
			end
		end
	end

--	hooksecurefunc("BtWQuests_ListCategories", SkinQuests)
--	BtWQuests_ListCategories()
end

AS:RegisterSkin('BtWQuests', AS.BtWQuests)
