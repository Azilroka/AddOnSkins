local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MogIt') then return end

local name = 'MogItSkin'
function AS:SkinMogIt()
	AS:SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(true)
	AS:SkinFrame(MogItFilters)
	MogItFiltersInset:StripTextures(true)

	local function SkinMogItPreview()
		for i = 1, 99 do
			if _G['MogItPreview'..i] and not _G['MogItPreview'..i].isSkinned then
				for _, object in pairs(_G['MogItPreview'..i].slots) do
					object:CreateBackdrop()
					local Backdrop = object.backdrop or object.Backdrop
					object.icon:ClearAllPoints()
					AS:SkinTexture(object.icon)
					object.icon:SetInside(Backdrop)
					object:SetNormalTexture(nil)
					object:StyleButton()
				end

				if _G['MogItPreview'..i] then AS:SkinFrame(_G['MogItPreview'..i]) end
				if _G['MogItPreview'..i..'CloseButton'] then AS:SkinCloseButton(_G['MogItPreview'..i..'CloseButton']) end
				if _G['MogItPreview'..i..'Inset'] then _G['MogItPreview'..i..'Inset']:StripTextures(true) end
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
	MogItFrameFiltersDefaults:StripTextures(true)
	AS:SkinButton(MogItFrameFiltersDefaults, true)
	AS:SkinScrollBar(MogItScroll)
	AS:SkinScrollBar(MogItFiltersScrollScrollBar)
end

AS:RegisterSkin(name, AS.SkinMogIt)