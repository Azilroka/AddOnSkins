local AS = unpack(select(2, ...))
local type, strlower, unpack = type, strlower, unpack

function AS:SkinButton(frame, strip)
	frame:SkinButton(strip)
end

function AS:SkinScrollBar(frame)
	frame:SkinScrollBar()
	_G[frame:GetName().."ScrollUpButton"]:StripTextures()
	_G[frame:GetName().."ScrollUpButton"]:SetTemplate("Default", true)
	_G[frame:GetName().."ScrollDownButton"]:StripTextures()
	_G[frame:GetName().."ScrollDownButton"]:SetTemplate("Default", true)
	if not _G[frame:GetName().."ScrollUpButton"].text then
		_G[frame:GetName().."ScrollUpButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollUpButton"].text:SetText("▲")
		_G[frame:GetName().."ScrollUpButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollUpButton"].text:SetTextColor(unpack(AS.BorderColor))
	end	
	if not _G[frame:GetName().."ScrollDownButton"].text then
		_G[frame:GetName().."ScrollDownButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollDownButton"].text:SetText("▼")
		_G[frame:GetName().."ScrollDownButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollDownButton"].text:SetTextColor(unpack(AS.BorderColor))
	end
end

function AS:SkinTab(frame, strip)
	if strip then frame:StripTextures(true) end
	frame:SkinTab()
end

function AS:SkinNextPrevButton(frame, horizonal)
	frame:SkinNextPrevButton(horizonal)
end

function AS:SkinRotateButton(frame)
	frame:SkinRotateButton()
end

function AS:SkinEditBox(frame, width, height)
	frame:SkinEditBox()
	if width then frame:Width(width) end
	if height then frame:Height(height) end
end

function AS:SkinDropDownBox(frame, width)
	frame:SkinDropDownBox(width)
end

function AS:SkinCheckBox(frame)
	frame:SkinCheckBox()
end

function AS:SkinCloseButton(frame, point)
	frame:SkinCloseButton(point)
end

function AS:SkinSlideBar(frame, height, movetext)
	frame:SkinSlideBar(height, movetext)
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template)
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:CreateBackdrop(template)
	if setpoints then frame.backdrop:SetAllPoints() end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template, true)
end

function AS:SkinStatusBar(frame, ClassColor)
	AS:SkinBackdropFrame(frame)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function AS:SkinTooltip(tooltip, scale)
	tooltip:HookScript('OnShow', function(frame)
		frame:SetTemplate('Transparent')
		if scale then frame:SetScale(AS.UIScale) end
	end)
end

function AS:SkinIconButton(frame, shrinkIcon)
	frame:SkinIconButton(shrinkIcon)
	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName()..'IconTexture'] then
		icon = _G[frame:GetName()..'IconTexture']
	elseif frame:GetName() and _G[frame:GetName()..'Icon'] then
		icon = _G[frame:GetName()..'Icon']
	end

	if icon then
		AS:SkinTexture(icon)
	end
end

function AS:Desaturate(frame, point)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:IsObjectType('Texture') then
			local Texture = region:GetTexture()
			if type(Texture) == 'string' and strlower(Texture) == 'interface\\dialogframe\\ui-dialogbox-corner' then
				region:SetTexture(nil)
				region:Kill()
			else
				region:SetDesaturated(true)
			end
		end
	end	
	frame:HookScript('OnUpdate', function(self)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetDesaturated(true)
		end
		if self:GetPushedTexture() then
			self:GetPushedTexture():SetDesaturated(true)
		end
		if self:GetHighlightTexture() then
			self:GetHighlightTexture():SetDesaturated(true)
		end
	end)
end
