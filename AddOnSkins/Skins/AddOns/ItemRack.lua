local AS, L, S, R = unpack(AddOnSkins)

function R:ItemRack()
	-- ItemRack buttons inherit ActionButtonTemplate. The icon texture is
	-- $parentIcon (e.g. ItemRackButton0Icon / ItemRackMenu1Icon).
	-- HandleItemButton calls StripTextures on the whole button which wipes
	-- the icon before ItemRack has had a chance to set it, and the saved
	-- texture is nil at hook time. Use a targeted skin instead: backdrop +
	-- StyleButton only, then locate the icon and hook SetTexture so it
	-- stays visible after ItemRack updates it.
	local function SkinRackButton(button)
		if not button or button._irSkinned then return end
		button._irSkinned = true

		local name = button:GetName()
		local icon = name and _G[name .. 'Icon']

		-- Strip only the non-icon regions (border, gloss, etc.).
		for _, region in next, { button:GetRegions() } do
			if region and region ~= icon and region.IsObjectType and region:IsObjectType('Texture') then
				region:SetTexture('')
			end
		end

		S:CreateBackdrop(button, nil, true, nil, nil, nil, nil, nil, true)
		S:StyleButton(button)

		if icon then
			S:HandleIcon(icon)
			S:SetInside(icon, button)
			icon:SetParent(button.backdrop or button)
		end
	end

	local function SkinMenuButton(idx)
		SkinRackButton(_G['ItemRackMenu' .. idx])
	end

	local function SkinAllMainButtons()
		for i = 0, 20 do
			SkinRackButton(_G['ItemRackButton' .. i])
		end
	end

	hooksecurefunc(ItemRack, 'CreateMenuButton', function(idx) SkinMenuButton(idx) end)
	hooksecurefunc(ItemRack, 'InitButtons',       function()   SkinAllMainButtons() end)

	SkinMenuButton(1)
	SkinAllMainButtons()
end

AS:RegisterSkin('ItemRack')
