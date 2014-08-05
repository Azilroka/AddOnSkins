local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LinkWrangler') then return end

local name = "LinkWranglerSkin"
function AS:SkinLinkWrangler()
	local Path = "Interface\\AddOns\\AddOnSkins_Skins\\Buttons\\"

	local function LWSkin_SkinButton(button, tex, distex)
		if (button == nil) then
			return
		end
		button:SetNormalTexture(tex)
		button:SetDisabledTexture(distex)
		button:SetPushedTexture(tex)
		button:SetHighlightTexture(tex)
		return button
	end

	local function LWSkin(frame, link)
		local r, g, b = 1, 1, 0
		if GetItemInfo(link) then
			local quality = select(3, GetItemInfo(link))
			r, g, b = GetItemQualityColor(tonumber(quality))
		end
		frame:SetTemplate("Default")
		frame:SetBackdropBorderColor(r,g,b)
		local framename = frame:GetName()
		LWSkin_SkinButton(_G[framename.."CloseButton"], Path.."close")
		LWSkin_SkinButton(_G[framename.."MinButton"], Path.."min")
		LWSkin_SkinButton(_G[framename.."CompButton"], Path.."compare", Path.."compareDisable")
		LWSkin_SkinButton(_G[framename.."WhisperButton"], Path.."whisper")
		LWSkin_SkinButton(_G[framename.."RelinkButton"], Path.."relink")
		LWSkin_SkinButton(_G[framename.."DressupButton"], Path.."dress")
		LWSkin_SkinButton(_G[framename.."CaptureButton"], Path.."compare")
	end

	LinkWrangler.RegisterCallback("LinkWrangler_Skin", LWSkin, "show", "showcomp")
end

AS:RegisterSkin(name, AS.SkinLinkWrangler)