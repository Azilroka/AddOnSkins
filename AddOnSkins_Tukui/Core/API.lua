----------------------------------------------------------------
-- Modified Skinning Core till Tukz implements it back in T16 --
----------------------------------------------------------------
local AS = unpack(select(2,...))

local function SkinIconButton(b, shrinkIcon)
	if b.isSkinned then return end

	b:StripTextures()
	b:CreateBackdrop("Default", true)
	b:StyleButton()

	local icon = b.icon
	if b:GetName() and _G[b:GetName().."IconTexture"] then
		icon = _G[b:GetName().."IconTexture"]
	elseif b:GetName() and _G[b:GetName().."Icon"] then
		icon = _G[b:GetName().."Icon"]
	end

	if icon then
		icon:SetTexCoord(.08,.88,.08,.88)

		if shrinkIcon then
			b.Backdrop:SetAllPoints()
			icon:SetInside(b)
		else
			b.Backdrop:SetOutside(icon)
		end
		icon:SetParent(b.Backdrop)
	end
	b.isSkinned = true
end

local function SkinScrollBar(frame)
	if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
	if _G[frame:GetName().."Track"] then _G[frame:GetName().."Track"]:SetTexture(nil) end

	if _G[frame:GetName().."Top"] then
		_G[frame:GetName().."Top"]:SetTexture(nil)
	end
	
	if _G[frame:GetName().."Bottom"] then
		_G[frame:GetName().."Bottom"]:SetTexture(nil)
	end
	
	if _G[frame:GetName().."Middle"] then
		_G[frame:GetName().."Middle"]:SetTexture(nil)
	end

	if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
		_G[frame:GetName().."ScrollUpButton"]:StripTextures()
		_G[frame:GetName().."ScrollUpButton"]:SetTemplate("Default", true)
		if not _G[frame:GetName().."ScrollUpButton"].text then
			_G[frame:GetName().."ScrollUpButton"]:FontString("text", AS.ActionBarFont, 12)
			_G[frame:GetName().."ScrollUpButton"].text:SetText("▲")
			_G[frame:GetName().."ScrollUpButton"].text:SetPoint("CENTER", 0, 0)
			_G[frame:GetName().."ScrollUpButton"].text:SetTextColor(unpack(AS.BorderColor))
		end	
		
		_G[frame:GetName().."ScrollDownButton"]:StripTextures()
		_G[frame:GetName().."ScrollDownButton"]:SetTemplate("Default", true)
	
		if not _G[frame:GetName().."ScrollDownButton"].text then
			_G[frame:GetName().."ScrollDownButton"]:FontString("text", AS.ActionBarFont, 12)
			_G[frame:GetName().."ScrollDownButton"].text:SetText("▼")
			_G[frame:GetName().."ScrollDownButton"].text:SetPoint("CENTER", 0, 0)
			_G[frame:GetName().."ScrollDownButton"].text:SetTextColor(unpack(AS.BorderColor))
		end				
		
		if not frame.trackbg then
			frame.trackbg = CreateFrame("Frame", nil, frame)
			frame.trackbg:Point("TOPLEFT", _G[frame:GetName().."ScrollUpButton"], "BOTTOMLEFT", 0, -1)
			frame.trackbg:Point("BOTTOMRIGHT", _G[frame:GetName().."ScrollDownButton"], "TOPRIGHT", 0, 1)
			frame.trackbg:SetTemplate("Transparent")
		end
		
		if frame:GetThumbTexture() then
			if not thumbTrim then thumbTrim = 3 end
			frame:GetThumbTexture():SetTexture(nil)
			if not frame.thumbbg then
				frame.thumbbg = CreateFrame("Frame", nil, frame)
				frame.thumbbg:Point("TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, -thumbTrim)
				frame.thumbbg:Point("BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, thumbTrim)
				frame.thumbbg:SetTemplate("Default", true)
				if frame.trackbg then
					frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel())
				end
			end
		end	
	end	
end

local tabs = {
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"Left",
	"Middle",
	"Right",
}

local function SkinTab(tab)
	if not tab then return end
	for _, object in pairs(tabs) do
		local tex = _G[tab:GetName()..object]
		if tex then
			tex:SetTexture(nil)
		end
	end
	
	if tab.GetHighlightTexture and tab:GetHighlightTexture() then
		tab:GetHighlightTexture():SetTexture(nil)
	else
		tab:StripTextures()
	end
	
	tab:CreateBackdrop()
	tab.Backdrop:Point("TOPLEFT", 10, -3)
	tab.Backdrop:Point("BOTTOMRIGHT", -10, 3)				
end

local function SkinRotateButton(btn)
	btn:SetTemplate("Default")
	btn:Size(btn:GetWidth() - 14, btn:GetHeight() - 14)	
	
	btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	
	
	btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	
	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():Point("TOPLEFT", 2, -2)
	btn:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

local function SkinSlideBar(frame, height, movetext)
	frame:SetTemplate("Default")
	frame:SetBackdropColor(0, 0, 0, .8)

	if not height then
		height = frame:GetHeight()
	end

	if movetext then
		if(_G[frame:GetName().."Low"]) then _G[frame:GetName().."Low"]:Point("BOTTOM", 0, -18) end
		if(_G[frame:GetName().."High"]) then _G[frame:GetName().."High"]:Point("BOTTOM", 0, -18) end
		if(_G[frame:GetName().."Text"]) then _G[frame:GetName().."Text"]:Point("TOP", 0, 19) end
	end

	_G[frame:GetName()]:SetThumbTexture(AS.Blank)
	_G[frame:GetName()]:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
	if(frame:GetWidth() < frame:GetHeight()) then
		frame:Width(height)
		_G[frame:GetName()]:GetThumbTexture():Size(frame:GetWidth(), frame:GetWidth() + 4)
	else
		frame:Height(height)
		_G[frame:GetName()]:GetThumbTexture():Size(height + 4, height)
	end
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

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.SkinIconButton then mt.SkinIconButton = SkinIconButton end
	if not object.SkinScrollBar then mt.SkinScrollBar = SkinScrollBar end
	if not object.SkinTab then mt.SkinTab = SkinTab end
	if not object.SkinRotateButton then mt.SkinRotateButton = SkinRotateButton end
	if not object.SkinSlideBar then mt.SkinSlideBar = SkinSlideBar end
	if not object.FontString then mt.FontString = FontString end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end
