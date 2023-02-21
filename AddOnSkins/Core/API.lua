local AS = unpack(AddOnSkins)
local S = AS.Skins

-- Deprecated - Moved to Skins Module
function AS:Kill(object)
	return S:Kill(object)
end

function AS:SetInside(obj, anchor, xOffset, yOffset, anchor2)
	return S:SetInside(obj, anchor, xOffset, yOffset, anchor2)
end

function AS:SetOutside(obj, anchor, xOffset, yOffset, anchor2)
	return S:SetOutside(obj, anchor, xOffset, yOffset, anchor2)
end

function AS:StripTextures(object, kill, zero)
	return S:StripTextures(object, kill, zero)
end

function AS:CreateBackdrop(frame, template, glossTex)
	return S:CreateBackdrop(frame, template, glossTex)
end

function AS:CreateShadow(frame)
	return S:CreateShadow(frame)
end

function AS:GradientHighlight(frame, layer, color)
	return S:HandleButtonHighlight(frame, layer, color)
end

function AS:SkinArrowButton(btn, arrowDir)
	return S:HandleNextPrevButton(btn, arrowDir)
end

function AS:SetTemplate(frame, template, glossTex)
	return S:SetTemplate(frame, template, glossTex)
end

function AS:SkinButton(button, strip)
	return S:HandleButton(button, strip)
end

function AS:SkinCheckBox(checkBox)
	return S:HandleCheckBox(checkBox)
end

function AS:SkinCloseButton(button, point)
	return S:HandleCloseButton(button, point)
end

function AS:SkinDropDownBox(frame, width, pos)
	return S:HandleDropDownBox(frame, width, pos)
end

function AS:SkinEditBox(editBox)
	return S:HandleEditBox(editBox)
end

function AS:SkinIconButton(button)
	return S:HandleItemButton(button, true)
end

function AS:SkinRadioButton(Button)
	return S:HandleRadioButton(Button)
end

function AS:SkinSlideBar(frame)
	return S:HandleSliderFrame(frame)
end

function AS:SkinMaxMinFrame(frame)
	return S:HandleMaxMinFrame(frame)
end

function AS:SkinTab(tab)
	return S:HandleTab(tab)
end

function AS:SkinTrimScrollBar(frame)
	return S:HandleTrimScrollBar(frame)
end

function AS:SkinScrollBar(scrollBar)
	return S:HandleScrollBar(scrollBar)
end

function AS:StyleButton(button)
	return S:StyleButton(button)
end

function AS:SkinTexture(icon, backdrop)
	return S:HandleIcon(icon, backdrop)
end

function AS:SkinFrame(frame, template)
	return S:HandleFrame(frame, nil, template)
end

function AS:SkinBackdropFrame(frame, template)
	return S:HandleFrame(frame, true, template)
end

function AS:SkinStatusBar(frame, color)
	return S:HandleStatusBar(frame, color)
end

function AS:CleanTexture(Object, Kill, Alpha)
	return S:CleanTexture(Object, Kill, Alpha)
end

function AS:StripTexture(Object, Texture, Kill, Alpha)
	return S:StripTexture(Object, Texture, Kill, Alpha)
end

function AS:Desaturate(frame)
	return S:Desaturate(frame)
end

function AS:SkinTooltip(tooltip, scale)
	return AS:SkinTooltip(tooltip, scale)
end

function AS:AdjustForTheme(number, offset)
	return S:AdjustForTheme(number, offset)
end

function AS:EnumObjects(enumFuncs, yieldFunc)
	return S:EnumObjects(enumFuncs, yieldFunc)
end
