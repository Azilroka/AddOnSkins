local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LinkWrangler') then return end

function AS:LinkWrangler()
	local Path = [[Interface\AddOns\AddOnSkins\Media\Textures\Buttons\]]

	local function LWSkin_SkinButton(button, tex, distex)
		if not button then return end

		button:SetNormalTexture(tex)
		button:SetDisabledTexture(distex or tex)
		button:SetPushedTexture(tex)
		button:SetHighlightTexture(tex)
	end

	local function LWSkin(frame, link)
		if frame.isSkinned then return end

		local framename = frame:GetName()

		LWSkin_SkinButton(_G[framename.."CloseButton"], Path.."close")
		LWSkin_SkinButton(_G[framename.."MinButton"], Path.."min")
		LWSkin_SkinButton(_G[framename.."CompButton"], Path.."compare", Path.."compareDisable")
		LWSkin_SkinButton(_G[framename.."WhisperButton"], Path.."whisper")
		LWSkin_SkinButton(_G[framename.."RelinkButton"], Path.."relink")
		LWSkin_SkinButton(_G[framename.."DressupButton"], Path.."dress")

		frame.isSkinned = true
	end

	LinkWrangler.RegisterCallback("LinkWrangler_Skin", LWSkin, "show", "showcomp")
end

AS:RegisterSkin('LinkWrangler', AS.LinkWrangler)
