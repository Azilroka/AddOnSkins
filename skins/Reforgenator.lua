if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Reforgenator") then return end
local U = unpack(select(2,...))
local c = U.c
local name = "ReforgenatorSkin"
local function SkinReforgenator(self)
	cSkinFrame(ReforgenatorPanel)
	cSkinFrame(ReforgenatorMessageFrame)
	cSkinFrame(ReforgenatorMessageTextFrame)
	cSkinDropDownBox(ReforgenatorPanel_ModelSelection)
	cSkinDropDownBox(ReforgenatorPanel_SandboxSelection)
	cSkinDropDownBox(ReforgenatorPanel_TargetLevelSelection)
	cSkinCloseButton(ReforgenatorPanel_CloseButton)
	hooksecurefunc(Reforgenator,"UpdateWindowItem",function(self, index, itemDescriptor)
		if not itemDescriptor then return end
		local item = _G["ReforgenatorPanel_Item"..index]
		local iconTexture = _G["ReforgenatorPanel_Item" .. index .. "IconTexture"]
		local checked = _G["ReforgenatorPanel_Item" .. index .. "Checked"]
		item:StripTextures()
		item:CreateBackdrop("Default")
	    local texture = select(10, GetItemInfo(itemDescriptor.itemLink))
	    iconTexture:SetTexture(texture)
		cSkinCheckBox(checked)
	end)
end

cRegisterSkin(name,SkinReforgenator)