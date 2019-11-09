local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ItemRack') then return end

function AS:ItemRack()
	local function SkinButton(idx,itemID)
		if _G["ItemRackMenu"..idx] then
			AS:SkinIconButton(_G["ItemRackMenu"..idx])
		end
	end

	hooksecurefunc(ItemRack, 'CreateMenuButton', SkinButton)
	SkinButton(1)
end

AS:RegisterSkin('ItemRack', AS.ItemRack)
