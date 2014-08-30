local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Reforenator') then return end

local name = 'ReforgenatorSkin'
function AS:SkinReforgenator()
	AS:SkinFrame(ReforgenatorPanel)
	AS:SkinFrame(ReforgenatorMessageFrame)
	AS:SkinFrame(ReforgenatorMessageTextFrame)
	AS:SkinDropDownBox(ReforgenatorPanel_ModelSelection)
	AS:SkinDropDownBox(ReforgenatorPanel_SandboxSelection)
	AS:SkinDropDownBox(ReforgenatorPanel_TargetLevelSelection)
	AS:SkinCloseButton(ReforgenatorPanel_CloseButton)
	hooksecurefunc(Reforgenator,'UpdateWindowItem', function(self, index, itemDescriptor)
		if not itemDescriptor then return end
		local item = _G['ReforgenatorPanel_Item'..index]
		local iconTexture = _G['ReforgenatorPanel_Item' .. index .. 'IconTexture']
		local checked = _G['ReforgenatorPanel_Item' .. index .. 'Checked']
		AS:SkinBackdropFrame(item)
		local texture = select(10, GetItemInfo(itemDescriptor.itemLink))
		iconTexture:SetTexture(texture)
		AS:SkinCheckBox(checked)
	end)
end

AS:RegisterSkin(name, AS.SkinReforgenator)