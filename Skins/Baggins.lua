local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Baggins') then return end

function AS:Baggins()
	local AddOnSkins_BagginsSkin = {
		BagLeftPadding = 10,
		BagRightPadding = 10,
		BagTopPadding = 32,
		BagBottomPadding = 10,
		TitlePadding = 32+48,
		SectionTitleHeight = 13,
		EmptySlotTexture = 'Interface\\AddOns\\Baggins\\Textures\\EmptySlot',
	}

	function AddOnSkins_BagginsSkin:SkinBag(frame)
		frame:SetTemplate('Transparent')
		frame.closebutton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
		AS:SkinCloseButton(frame.closebutton)
		frame.compressbutton:ClearAllPoints()
		frame.compressbutton:SetPoint("TOPRIGHT", frame.closebutton, "TOPLEFT", -4, -2)
		frame.title:SetVertexColor(1,1,1,1)
		frame.title:ClearAllPoints()
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
		frame.title:SetPoint("RIGHT", frame.closebutton, "LEFT", 0, 0)
		frame.title:SetHeight(12)
		frame.title:SetJustifyH('LEFT')
	end

	function AddOnSkins_BagginsSkin:SkinItem(button)
		if button.IsSkinned then return end

		local Icon = _G[button:GetName().."IconTexture"]
		AS:SkinTexture(Icon)
		Icon:SetInside(button, 2, 2)

		button:SetNormalTexture("")
		button:SetPushedTexture("")
		AS:SetTemplate(button)
		AS:StyleButton(button)
		button.IsSkinned = true
	end

	function AddOnSkins_BagginsSkin:SetBankVisual(frame, isBank)
		local color = AS.BorderColor
		if isBank then
			color = { 0, .5, 1 }
		end
		frame:SetBackdropBorderColor(unpack(color))
	end

	function AddOnSkins_BagginsSkin:SkinSection(frame)
		frame.title:SetVertexColor(1, 1, 1, 1)
		frame.title:SetText("")
		frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		frame.title:SetHeight(13)
	end

	Baggins:RegisterSkin('AddOnSkins', AddOnSkins_BagginsSkin)
	Baggins:ApplySkin('AddOnSkins')
end

AS:RegisterSkin('Baggins', AS.Baggins)
