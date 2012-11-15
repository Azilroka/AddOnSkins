local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ReforgenatorSkin"
local function SkinReforgenator(self)
	AS:SkinFrame(ReforgenatorPanel)
	AS:SkinFrame(ReforgenatorMessageFrame)
	AS:SkinFrame(ReforgenatorMessageTextFrame)
	S:HandleDropDownBox(ReforgenatorPanel_ModelSelection)
	S:HandleDropDownBox(ReforgenatorPanel_SandboxSelection)
	S:HandleDropDownBox(ReforgenatorPanel_TargetLevelSelection)
	S:HandleCloseButton(ReforgenatorPanel_CloseButton)
	hooksecurefunc(Reforgenator,"UpdateWindowItem",function(self, index, itemDescriptor)
		if not itemDescriptor then return end
		local item = _G["ReforgenatorPanel_Item"..index]
		local iconTexture = _G["ReforgenatorPanel_Item" .. index .. "IconTexture"]
		local checked = _G["ReforgenatorPanel_Item" .. index .. "Checked"]
		item:StripTextures()
		item:CreateBackdrop("Default")
	    local texture = select(10, GetItemInfo(itemDescriptor.itemLink))
	    iconTexture:SetTexture(texture)
		S:HandleCheckBox(checked)
	end)
end

AS:RegisterSkin(name,SkinReforgenator)