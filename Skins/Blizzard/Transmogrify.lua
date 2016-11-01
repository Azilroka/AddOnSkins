local AS = unpack(AddOnSkins)

function AS:Blizzard_Transmogrify(event, addon)
	if addon ~= 'Blizzard_ItemAlterationUI' then return end

	AS:SkinFrame(TransmogrifyArtFrame)
	AS:StripTextures(TransmogrifyModelFrame)
	TransmogrifyModelFrame:SetFrameLevel(TransmogrifyArtFrame:GetFrameLevel())

	AS:StripTextures(TransmogrifyFrameButtonFrame)

	AS:SkinButton(TransmogrifyApplyButton, true)
	TransmogrifyApplyButton:SetPoint("BOTTOMRIGHT", TransmogrifyFrame, "BOTTOMRIGHT", -4, 4)
	AS:SkinCloseButton(TransmogrifyArtFrameCloseButton)

	local Slots = {"Head", "Shoulder", "Chest", "Waist", "Legs", "Feet", "Wrist", "Hands", "Back", "MainHand", "SecondaryHand"}

	for _, Slot in pairs(Slots) do
		local Button = _G["TransmogrifyFrame"..Slot.."Slot"]
		_G["TransmogrifyFrame"..Slot.."SlotBorder"]:SetTexture('')
		_G["TransmogrifyFrame"..Slot.."SlotGrabber"]:SetTexture('')
		AS:SkinFrame(Button, nil, true)
		Button:SetBackdropColor(0, 0, 0, 0)
		AS:StyleButton(Button)

		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
	end
	
	AS:SkinFrame(TransmogrifyConfirmationPopup)
	AS:SkinButton(TransmogrifyConfirmationPopup.Button1)
	AS:SkinButton(TransmogrifyConfirmationPopup.Button2)

	for i = 1, 2 do
		local Button = TransmogrifyConfirmationPopup['ItemFrame'..i]
		AS:SkinFrame(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()
	end

	TransmogrifyConfirmationPopup:HookScript('OnShow', function(self)
		for i = 1, 2 do
			local Button = TransmogrifyConfirmationPopup['ItemFrame'..i]
			Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			if Button.link then
				local Quality = select(3, GetItemInfo(Button.link))
				if Quality and (Quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[Quality]) then
					Button:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
				end
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_Transmogrify', AS.Blizzard_Transmogrify, 'ADDON_LOADED')