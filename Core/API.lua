local AS = unpack(AddOnSkins)

function AS:InitAPI()
	-- [[ API FUNCTIONS ]] --

	local function SkinIconButton(b, shrinkIcon)
		if b.isSkinned then return end

		b:StripTextures()
		b:CreateBackdrop("Default", true)
		local backdrop = b.backdrop or b.Backdrop
		b:StyleButton()

		local icon = b.icon
		if b:GetName() and _G[b:GetName().."IconTexture"] then
			icon = _G[b:GetName().."IconTexture"]
		elseif b:GetName() and _G[b:GetName().."Icon"] then
			icon = _G[b:GetName().."Icon"]
		end

		if icon then
			icon:SetTexCoord(.08,.88,.08,.88)

			-- create a backdrop around the icon

			if shrinkIcon then
				backdrop:SetAllPoints()
				icon:SetInside(b)
			else
				backdrop:SetOutside(icon)
			end
			icon:SetParent(backdrop)
		end
		b.isSkinned = true
	end

	local function SkinRotateButton(btn)
		btn:SetTemplate("Default")
		btn:Size(btn:GetWidth() - 14, btn:GetHeight() - 14)	

		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	

		btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)

		btn:GetNormalTexture():ClearAllPoints()
		btn:GetNormalTexture():SetInside()
		btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
		btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
	end

	local function FontString(parent, name, fontName, fontHeight, fontStyle)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFont(fontName, fontHeight, fontStyle)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(AS.Mult, -AS.Mult)

		if not name then
			parent.Text = fs
		else
			parent[name] = fs
		end

		return fs
	end

	local function AddAPI(object)
		local mt = getmetatable(object).__index

		-- Need for ElvUI
		if not object.FontString then mt.FontString = FontString end
		-- Remove these once implemented in Tukui 16
		if not object.SkinIconButton then mt.SkinIconButton = SkinIconButton end
		if not object.SkinRotateButton then mt.SkinRotateButton = SkinRotateButton end
	end

	local Handled = {["Frame"] = true}

	local Object = CreateFrame("Frame")
	AddAPI(Object)
	AddAPI(Object:CreateTexture())
	AddAPI(Object:CreateFontString())

	Object = EnumerateFrames()

	while Object do
		if (not Handled[Object:GetObjectType()]) then
			AddAPI(Object)
			Handled[Object:GetObjectType()] = true
		end

		Object = EnumerateFrames(Object)
	end
end