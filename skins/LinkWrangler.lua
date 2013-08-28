local AS = ElvUI[1]:GetModule('AddOnSkins')
local AddOnName = ...

local name = "LinkWranglerSkin"
function AS:SkinLinkWrangler()
	local Path = "Interface\\AddOns\\"..AddOnName.."\\Skins\\Buttons\\"

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
		local r, g, b = GetItemInfo(link) and GetItemQualityColor(select(3,GetItemInfo(link))) or 1, 1, 0
		frame:SetTemplate("Default")
		frame:SetBackdropBorderColor(r,g,b)
		LWSkin_SkinButton(_G[frame:GetName().."CloseButton"], Path.."close")
		LWSkin_SkinButton(_G[frame:GetName().."MinButton"], Path.."min")
		LWSkin_SkinButton(_G[frame:GetName().."CompButton"], Path.."compare", Path.."compareDisable")
		LWSkin_SkinButton(_G[frame:GetName().."WhisperButton"], Path.."whisper")
		LWSkin_SkinButton(_G[frame:GetName().."RelinkButton"], Path.."relink")
		LWSkin_SkinButton(_G[frame:GetName().."DressupButton"], Path.."dress")
		LWSkin_SkinButton(_G[frame:GetName().."CaptureButton"], Path.."compare")
	end

	LinkWrangler.RegisterCallback("LinkWrangler_Skin", LWSkin, "show", "showcomp")
end

AS:RegisterSkin(name, AS.SkinLinkWrangler)