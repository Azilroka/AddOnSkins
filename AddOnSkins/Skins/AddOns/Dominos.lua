local AS, L, S, R = unpack(AddOnSkins)

function R:Dominos()
	local function StyleNormalButton(self)
		local name = self:GetName()
		if strmatch(name, "ExtraActionButton") then return end
		local button = self
		local icon = _G[name.."Icon"]
		local count = _G[name.."Count"]
		local flash = _G[name.."Flash"]
		local hotkey = _G[name.."HotKey"]
		local border = _G[name.."Border"]
		local btname = _G[name.."Name"]
		local normal = _G[name.."NormalTexture"]

		flash:SetTexture("")
		button:SetNormalTexture("")

		if border then
			border:SetAlpha(0)
		end

		if count then
			count:ClearAllPoints()
			count:SetPoint("BOTTOMRIGHT", 0, 2)
		end

		if btname then
			btname:ClearAllPoints()
			btname:SetPoint("BOTTOM", 0, 0)
		end

		if hotkey then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetWidth(button:GetWidth() - 1)
		end

		if not button.isSkinned then
			S:CreateBackdrop(button)
			S:StyleButton(button)
			button.backdrop:SetAllPoints()

			S:HandleIcon(icon)
			S:SetInside(icon)

			button.isSkinned = true
		end

		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end
	end

	local function StyleSmallButton(button, icon, name, hotkey, pet)
		if not button then return end
		local flash = _G[name.."Flash"]
		S:StyleButton(button)
		button:SetNormalTexture("")

		if flash then
			flash:SetTexture(0.8, 0.8, 0.8, 0.5)
			S:SetOutside(flash, button, 2, 2)
		end

		if hotkey then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetWidth(button:GetWidth() - 1)
		end

		if not button.isSkinned then
			S:CreateBackdrop(button)
			S:StyleButton(button)
			button.backdrop:SetAllPoints()

			S:HandleIcon(icon)
			S:SetInside(icon)

			if pet then
				local autocast = _G[name.."AutoCastable"]
				autocast:SetSize((button:GetWidth() * 2) - 10, (button:GetWidth() * 2) - 10)
				autocast:ClearAllPoints()
				autocast:SetPoint("CENTER", button, 0, 0)

				_G[name.."Shine"]:SetSize(button:GetWidth(), button:GetWidth())
				_G[name.."Cooldown"]:SetSize(button:GetWidth() - 2, button:GetWidth() - 2)
			end

			button.isSkinned = true
		end
	end

	hooksecurefunc("ActionButton_Update", StyleNormalButton)

	do
		for i = 1, 60 do
			if _G["DominosActionButton"..i] then
				ActionButton_Update(_G["DominosActionButton"..i])
			end
		end

		for i = 1, 12 do
			ActionButton_Update(_G["ActionButton"..i])
			ActionButton_Update(_G["MultiBarBottomLeftButton"..i])
			ActionButton_Update(_G["MultiBarBottomRightButton"..i])
			ActionButton_Update(_G["MultiBarLeftButton"..i])
			ActionButton_Update(_G["MultiBarRightButton"..i])
		end

		for i = 1, NUM_STANCE_SLOTS do
			local name = "StanceButton"..i
			local button = _G[name]
			local icon = _G[name.."Icon"]
			local hotkey = _G[name.."HotKey"]
			StyleSmallButton(button, icon, name, hotkey)
		end

		if MainMenuBarBackpackButton then
			local Texture = MainMenuBarBackpackButton.icon:GetTexture()
			S:HandleItemButton(MainMenuBarBackpackButton, true)
			MainMenuBarBackpackButton.icon:SetTexture(Texture)
			for i = 0, 3 do
				S:HandleItemButton(_G['CharacterBag'..i..'Slot'], true)
			end
		end

		for i = 1, NUM_PET_ACTION_SLOTS do
			local name = "PetActionButton"..i
			local button = _G[name]
			local icon = _G[name.."Icon"]
			local hotkey = _G[name.."HotKey"]
			StyleSmallButton(button, icon, name, hotkey, true)
		end

		if DominosFramexp then
			S:CreateBackdrop(DominosFramexp)
		end
	end
end

AS:RegisterSkin('Dominos')
