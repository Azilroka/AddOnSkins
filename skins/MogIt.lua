local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "MogItSkin"
function AS:SkinMogIt()
	AS:SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(true)
	AS:SkinFrame(MogItFilters)
	MogItFiltersInset:StripTextures(true)
	local function SkinMogItPreview()
		for i = 1, 99 do
			local MogItGearSlots = {
				"HeadSlot",
				"ShoulderSlot",
				"BackSlot",
				"ChestSlot",
				"ShirtSlot",
				"TabardSlot",
				"WristSlot",
				"HandsSlot",
				"WaistSlot",
				"LegsSlot",
				"FeetSlot",
				"MainHandSlot",
				"SecondaryHandSlot",
			}

			for _, object in pairs(MogItGearSlots) do
				if _G["MogItPreview"..i..object] then
					AS:SkinIconButton(_G["MogItPreview"..i..object])
					_G["MogItPreview"..i..object]:SetPushedTexture(nil)
					_G["MogItPreview"..i..object]:SetHighlightTexture(nil)
				end
			end

			if _G["MogItPreview"..i] then AS:SkinFrame(_G["MogItPreview"..i]) end
			if _G["MogItPreview"..i.."CloseButton"] then AS:SkinCloseButton(_G["MogItPreview"..i.."CloseButton"]) end
			if _G["MogItPreview"..i.."Inset"] then _G["MogItPreview"..i.."Inset"]:StripTextures(true) end
			if _G["MogItPreview"..i.."Activate"] then AS:SkinButton(_G["MogItPreview"..i.."Activate"], true) end
		end
	end

	hooksecurefunc(MogIt, "CreatePreview", SkinMogItPreview)
	AS:SkinTooltip(MogItTooltip)
	AS:SkinCloseButton(MogItFrameCloseButton)
	AS:SkinCloseButton(MogItFiltersCloseButton)
	MogItFrameFiltersDefaults:StripTextures(true)
	AS:SkinButton(MogItFrameFiltersDefaults, true)
	AS:SkinScrollBar(MogItScroll)
	AS:SkinScrollBar(MogItFiltersScrollScrollBar)
end

AS:RegisterSkin(name, AS.SkinMogIt)