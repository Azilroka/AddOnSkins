local AS, L, S, R = unpack(AddOnSkins)

function R:MogIt()
	S:HandleFrame(MogItFrame)
	S:StripTextures(MogItFrameInset, true)
	S:HandleFrame(MogItFilters)
	S:StripTextures(MogItFiltersInset, true)

	local function SkinMogItPreview()
		for i = 1, 99 do
			if _G['MogItPreview'..i] and not _G['MogItPreview'..i].isSkinned then
				for _, object in pairs(_G['MogItPreview'..i].slots) do
					S:CreateBackdrop(object)
					object.icon:ClearAllPoints()
					S:HandleIcon(object.icon)
					S:SetInside(object.icon, object.backdrop)
					object:SetNormalTexture(nil)
					S:StyleButton(object)
				end

				if _G['MogItPreview'..i] then S:HandleFrame(_G['MogItPreview'..i]) end
				if _G['MogItPreview'..i..'CloseButton'] then S:HandleCloseButton(_G['MogItPreview'..i..'CloseButton']) end
				if _G['MogItPreview'..i..'Inset'] then S:StripTextures(_G['MogItPreview'..i..'Inset'], true) end
				if _G['MogItPreview'..i..'Activate'] then S:HandleButton(_G['MogItPreview'..i..'Activate'], true) end
				_G['MogItPreview'..i].isSkinned = true
			end
		end
	end

	hooksecurefunc(MogIt, 'CreatePreview', SkinMogItPreview)
	SkinMogItPreview()
	S:HandleTooltip(MogItTooltip)
	S:HandleCloseButton(MogItFrameCloseButton)
	S:HandleCloseButton(MogItFiltersCloseButton)
	S:StripTextures(MogItFrameFiltersDefaults, true)
	S:HandleButton(MogItFrameFiltersDefaults, true)
	S:HandleScrollBar(MogItScroll)
	S:HandleScrollBar(MogItFiltersScrollScrollBar)
end

AS:RegisterSkin('MogIt')
