local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MogIt') then return end

function AS:MogIt()
	AS:SkinFrame(MogItFrame)
	AS:StripTextures(MogItFrameInset, true)
	AS:SkinFrame(MogItFilters)
	AS:StripTextures(MogItFiltersInset, true)

	local function SkinMogItPreview()
		for i = 1, 99 do
			if _G['MogItPreview'..i] and not _G['MogItPreview'..i].isSkinned then
				for _, object in pairs(_G['MogItPreview'..i].slots) do
					AS:CreateBackdrop(object)
					object.icon:ClearAllPoints()
					AS:SkinTexture(object.icon)
					AS:SetInside(object.icon, object.Backdrop)
					object:SetNormalTexture(nil)
					AS:StyleButton(object)
				end

				if _G['MogItPreview'..i] then AS:SkinFrame(_G['MogItPreview'..i]) end
				if _G['MogItPreview'..i..'CloseButton'] then AS:SkinCloseButton(_G['MogItPreview'..i..'CloseButton']) end
				if _G['MogItPreview'..i..'Inset'] then AS:StripTextures(_G['MogItPreview'..i..'Inset'], true) end
				if _G['MogItPreview'..i..'Activate'] then AS:SkinButton(_G['MogItPreview'..i..'Activate'], true) end
				_G['MogItPreview'..i].isSkinned = true
			end
		end
	end

	hooksecurefunc(MogIt, 'CreatePreview', SkinMogItPreview)
	SkinMogItPreview()
	AS:SkinTooltip(MogItTooltip)
	AS:SkinCloseButton(MogItFrameCloseButton)
	AS:SkinCloseButton(MogItFiltersCloseButton)
	AS:StripTextures(MogItFrameFiltersDefaults, true)
	AS:SkinButton(MogItFrameFiltersDefaults, true)
	AS:SkinScrollBar(MogItScroll)
	AS:SkinScrollBar(MogItFiltersScrollScrollBar)
end

AS:RegisterSkin('MogIt', AS.MogIt)
