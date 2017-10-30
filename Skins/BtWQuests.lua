local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BtWQuests') then return end

local _G = _G

function AS:BtWQuests()
	AS:SkinBackdropFrame(BtWQuests)

	AS:SkinBackdropFrame(BtWQuestsNavBar, nil, nil, true)
	AS:StripTextures(BtWQuestsNavBarOverlay, true)
	BtWQuestsNavBar.Backdrop:SetPoint("TOPLEFT", -2, 0)
	BtWQuestsNavBar.Backdrop:SetPoint("BOTTOMRIGHT")

	AS:SkinButton(BtWQuestsNavBarHomeButton, true)
	BtWQuestsNavBarHomeButton.xoffset = 1
	BtWQuestsNavBarHomeButton.isSkinned = true

	AS:StripTextures(BtWQuestsInset, true)

	AS:SkinCloseButton(BtWQuestsCloseButton)
	AS:SkinScrollBar(BtWQuestsQuestSelectScrollFrameScrollBar)

	AS:SkinScrollBar(BtWQuestsChainFrameScrollFrameScrollBar)

	local function SkinQuests()
		local b1 = _G["BtWQuestsQuestSelectScrollFrameScrollChildCategory1"]
		if b1 and not b1.isSkinned then
			AS:SkinButton(b1)
			b1.bgImage:SetInside()
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("ARTWORK")
			b1.isSkinned = true
		end

		local b2 = _G["BtWQuestsQuestSelectScrollFrameScrollChildChain1"]
		if b2 and not b2.isSkinned then
			AS:SkinButton(b2)
			b2.bgImage:SetInside()
			b2.bgImage:SetTexCoord(.08, .6, .08, .6)
			b2.bgImage:SetDrawLayer("ARTWORK")
			b2.isSkinned = true
		end

		for i = 1, 10 do
			local BtWQuestsCategory = _G["BtWQuestsQuestSelectScrollFramecategory"..i]
			if BtWQuestsCategory and not BtWQuestsCategory.isSkinned then
				AS:SkinButton(BtWQuestsCategory)
				BtWQuestsCategory.bgImage:SetInside()
				BtWQuestsCategory.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsCategory.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsCategory.isSkinned = true
			end
		end

		for i = 1, 10 do
			local BtWQuestsChain = _G["BtWQuestsQuestSelectScrollFramechain"..i]
			if BtWQuestsChain and not BtWQuestsChain.isSkinned then
				AS:SkinButton(BtWQuestsChain)
				BtWQuestsChain.bgImage:SetInside()
				BtWQuestsChain.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsChain.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsChain.isSkinned = true
			end
		end
	end
	hooksecurefunc("BtWQuests_ListCategories", SkinQuests)
	BtWQuests_ListCategories()

end

AS:RegisterSkin('BtWQuests', AS.BtWQuests)