local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Bartender4') then return end

local name = 'Bartender4Skin'
function AS:SkinBartender4()
	local function StyleNormalButton(self)
		local name = self:GetName()
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
			border:Hide()
			border = AS.Noop
		end

		if count then
			count:ClearAllPoints()
			count:SetPoint("BOTTOMRIGHT", 0, 2)
			count:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
		end

		if btname then
			btname:ClearAllPoints()
			btname:SetPoint("BOTTOM", 0, 0)
			btname:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
		end

		if hotkey then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
			hotkey:SetWidth(button:GetWidth() - 1)
		end

		if not button.isSkinned then
			button:CreateBackdrop("Transparent")
			button:StyleButton()
			local backdrop = button.backdrop or button.Backdrop
			backdrop:SetAllPoints()

			icon:SetTexCoord(unpack(AS.TexCoords))
			icon.SetTexCoord = function() end
			icon:SetInside()

			button.isSkinned = true
		end

		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end
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

AS:RegisterSkin(name, AS.SkinBartender4)