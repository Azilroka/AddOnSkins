local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "MogItSkin"
function AS:SkinMogIt()

	AS:SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(True)

	AS:SkinFrame(MogItFilters)
	MogItFiltersInset:StripTextures(True)

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
				if _G["MogItPreview"..i] then AS:SkinIconButton(_G["MogItPreview"..i..object], true) end
				if _G["MogItPreview"..i] then _G["MogItPreview"..i..object]:SetPushedTexture(nil) end
				if _G["MogItPreview"..i] then _G["MogItPreview"..i..object]:SetHighlightTexture(nil) end
			end

			if _G["MogItPreview"..i] then AS:SkinFrame(_G["MogItPreview"..i]) end
			if _G["MogItPreview"..i] then S:HandleCloseButton(_G["MogItPreview"..i.."CloseButton"]) end
			if _G["MogItPreview"..i] then _G["MogItPreview"..i.."Inset"]:StripTextures(True) end
			if _G["MogItPreview"..i] then S:HandleButton(_G["MogItPreview"..i.."Activate"], true) end
		end
	end

	hooksecurefunc(MogIt, "CreatePreview", SkinMogItPreview)

	AS:SkinTooltip(MogItTooltip)

	S:HandleCloseButton(MogItFrameCloseButton)
	S:HandleCloseButton(MogItFiltersCloseButton)
	MogItFrameFiltersDefaults:StripTextures(True)
	S:HandleButton(MogItFrameFiltersDefaults, true)

	S:HandleScrollBar(MogItScroll)
	S:HandleScrollBar(MogItFiltersScrollScrollBar)

end

AS:RegisterSkin(name,AS.SkinMogIt)