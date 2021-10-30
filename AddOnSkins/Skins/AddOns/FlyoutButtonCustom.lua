local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FlyoutButtonCustom') then return end

function AS:FlyoutButtonCustom()
	if FlyoutButtonCustom_Settings then
		FlyoutButtonCustom_Settings.Highlight = false
		FlyoutButtonCustom_Settings.ShowBorders = false
		FlyoutButtonCustom_Settings.ButtonsScale = 1
	end

	local function CreateBorder(self)
		local name = self:GetName()
		local button = self
		local icon = _G[name.."Icon"]
		local cooldown = _G[name.."Cooldown"]
		local border = _G[name.."Border"]
		local count = _G[name.."Count"]
		local btname = _G[name.."Name"]
		local hotkey = _G[name.."HotKey"]
		local normal = _G[name.."NormalTexture"]

		AS:StyleButton(button)
		button:SetNormalTexture("")

		if border then
			border:Hide()
			border.Show = border.Hide
		end

		count:ClearAllPoints()
		count:SetPoint("BOTTOMRIGHT", 0, 2)

		if btname then
			btname:ClearAllPoints()
			btname:SetPoint("BOTTOM", 0, 0)
		end

		hotkey:ClearAllPoints()
		hotkey:SetPoint("TOPRIGHT", 0, 0)
		hotkey.ClearAllPoints = AS.Noop
		hotkey.SetPoint = AS.Noop

		if not button.isSkinned then
			AS:CreateBackdrop(button)
			button.Backdrop:SetAllPoints()

			AS:SkinTexture(icon)
			AS:SetInside(icon)

			button.isSkinned = true
		end

		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end
	end

	hooksecurefunc(FlyoutListButton, "UpdateButton", CreateBorder)
	hooksecurefunc(FlyoutListButton, "OnReceiveDrag", CreateBorder)
	hooksecurefunc(FlyoutListButton, "UpdateTexture", CreateBorder)
end

AS:RegisterSkin('FlyoutButtonCustom', AS.FlyoutButtonCustom)
