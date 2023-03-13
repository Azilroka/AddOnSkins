local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:BtWQuests()
	S:HandleFrame(BtWQuestsFrame, true)

	S:HandleFrame(BtWQuestsFrame.navBar, true, nil, -2)
	S:StripTextures(BtWQuestsFrame.navBar.overlay, true)

	S:HandleButton(BtWQuestsFrameHomeButton, true)
	BtWQuestsFrameHomeButton.xoffset = 1
	BtWQuestsFrameHomeButton.isSkinned = true

	S:StripTextures(BtWQuestsFrame.Inset, true)

	S:HandleCloseButton(BtWQuestsFrame.CloseButton)

	S:HandleScrollBar(BtWQuestsChainScrollFrameScrollBar)
	S:HandleScrollBar(BtWQuestsFrameCategoryScrollBar)

	local function SkinQuests()
		local b1 = _G["BtWQuestsFrameQuestSelectScrollFrameScrollChildCategory1"]
		if b1 and not b1.isSkinned then
			S:HandleButton(b1)
			S:SetInside(b1.bgImage)
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("ARTWORK")
			b1.isSkinned = true
		end

		local b2 = _G["BtWQuestsFrameQuestSelectScrollFrameScrollChildChain1"]
		if b2 and not b2.isSkinned then
			S:HandleButton(b2)
			S:SetInside(b2.bgImage)
			b2.bgImage:SetTexCoord(.08, .6, .08, .6)
			b2.bgImage:SetDrawLayer("ARTWORK")
			b2.isSkinned = true
		end

		for i = 1, 10 do
			local BtWQuestsFrameCategory = _G["BtWQuestsFrameQuestSelectScrollFramecategory"..i]
			if BtWQuestsFrameCategory and not BtWQuestsFrameCategory.isSkinned then
				S:HandleButton(BtWQuestsFrameCategory)
				S:SetInside(BtWQuestsFrameCategory.bgImage)
				BtWQuestsFrameCategory.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsFrameCategory.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsFrameCategory.isSkinned = true
			end
		end

		for i = 1, 10 do
			local BtWQuestsFrameChain = _G["BtWQuestsFrameQuestSelectScrollFramechain"..i]
			if BtWQuestsFrameChain and not BtWQuestsFrameChain.isSkinned then
				S:HandleButton(BtWQuestsFrameChain)
				S:SetInside(BtWQuestsFrameChain.bgImage)
				BtWQuestsFrameChain.bgImage:SetTexCoord(.08, .6, .08, .6)
				BtWQuestsFrameChain.bgImage:SetDrawLayer("ARTWORK")
				BtWQuestsFrameChain.isSkinned = true
			end
		end
	end

--	hooksecurefunc("BtWQuests_ListCategories", SkinQuests)
--	BtWQuests_ListCategories()
end

AS:RegisterSkin('BtWQuests')
