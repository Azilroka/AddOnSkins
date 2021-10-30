local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Bartender4') then return end

function AS:Bartender4()
	local function StyleNormalButton(self)
		local Name = self:GetName()
		local Action = self.action
		local Button = self
		local Icon = _G[Name.."Icon"]
		local Count = _G[Name.."Count"]
		local Flash	 = _G[Name.."Flash"]
		local HotKey = _G[Name.."HotKey"]
		local Border  = _G[Name.."Border"]
		local Btname = _G[Name.."Name"]
		local Normal  = _G[Name.."NormalTexture"]
		local BtnBG = _G[Name.."FloatingBG"]

		Flash:SetTexture("")
		Button:SetNormalTexture("")

		Count:ClearAllPoints()
		Count:SetPoint("BOTTOMRIGHT", 0, 2)

		HotKey:ClearAllPoints()
		HotKey:SetPoint("TOPRIGHT", 0, -3)

		if Border and Button.isSkinned then
			Border:SetTexture('')
			if Border:IsShown() then
				Button:SetBackdropBorderColor(.08, .70, 0)
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end

		if Btname and Normal then
			local String = Action and GetActionText(Action)

			if String then
				local Text = string.sub(String, 1, 5)
				Btname:SetText(Text)
			end
		end

		if (Button.isSkinned) then
			return
		end

		if (Btname) then
			Btname:ClearAllPoints()
			Btname:SetPoint("BOTTOM", 1, 1)
		end

		if (BtnBG) then
			AS:Kill(BtnBG)
		end

		AS:SetTemplate(Button)
		Button:UnregisterEvent("ACTIONBAR_SHOWGRID")
		Button:UnregisterEvent("ACTIONBAR_HIDEGRID")

		AS:SkinTexture(Icon)
		AS:SetInside(Icon)

		if (Normal) then
			Normal:ClearAllPoints()
			Normal:SetPoint("TOPLEFT")
			Normal:SetPoint("BOTTOMRIGHT")

			if (Button:GetChecked()) then
				ActionButton_UpdateState(Button)
			end
		end

		AS:StyleButton(Button)
		Button.isSkinned = true
	end

	for i = 1, 10 do
		if _G['BT4Bar'..i] and _G['BT4Bar'..i].buttons then
			for k, button in pairs(_G['BT4Bar'..i].buttons) do
				StyleNormalButton(button)
			end
		end
		if _G['BT4StanceButton'..i] then
			StyleNormalButton(_G['BT4StanceButton'..i])
		end
		if MainMenuBarBackpackButton then
			local Texture = MainMenuBarBackpackButton.icon:GetTexture()
			AS:SkinIconButton(MainMenuBarBackpackButton, true)
			MainMenuBarBackpackButton.icon.SetTexCoord = function() end
			MainMenuBarBackpackButton.icon:SetTexture(Texture)
			for i = 0, 3 do
				if _G['CharacterBag'..i..'Slot'] then
					AS:SkinIconButton(_G['CharacterBag'..i..'Slot'], true)
					_G['CharacterBag'..i..'Slot'].icon.SetTexCoord = function() end
				end
			end
		end
	end
end

AS:RegisterSkin('Bartender4', AS.Bartender4)
