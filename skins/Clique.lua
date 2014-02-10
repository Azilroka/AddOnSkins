local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('Clique') then return end

local name = "CliqueSkin"
function AS:SkinClique()
	local Frames = {
		CliqueDialog,
		CliqueConfig,
		CliqueConfigPage1,
		CliqueConfigPage2,
		CliqueClickGrabber,
	}

	for _, object in pairs(Frames) do
		AS:SkinBackdropFrame(object)
	end
	
	local CliqueButtons = {
		CliqueConfigPage1ButtonSpell,
		CliqueConfigPage1ButtonOther,
		CliqueConfigPage1ButtonOptions,
		CliqueConfigPage2ButtonBinding,
		CliqueDialogButtonAccept,
		CliqueDialogButtonBinding,
		CliqueConfigPage2ButtonSave,
		CliqueConfigPage2ButtonCancel,
	}

	for _, object in pairs(CliqueButtons) do
		AS:SkinButton(object, true)
	end

	AS:SkinCloseButton(CliqueDialog.CloseButton)
	AS:SkinCloseButton(CliqueConfigCloseButton)

	local CliqueTabs = {
		CliqueConfigPage1Column1,
		CliqueConfigPage1Column2,
	}

	for _, object in pairs(CliqueTabs) do
		object:StripTextures(true)
	end

	CliqueConfigPage1:SetScript("OnShow", function(self)
		for i = 1, 12 do
			if _G["CliqueRow"..i] then
				AS:SkinTexture(_G["CliqueRow"..i.."Icon"])
				_G["CliqueRow"..i.."Bind"]:ClearAllPoints()
				if _G["CliqueRow"..i] == CliqueRow1 then
					_G["CliqueRow"..i.."Bind"]:SetPoint("RIGHT", _G["CliqueRow"..i], 8,0)
				else
					_G["CliqueRow"..i.."Bind"]:SetPoint("RIGHT", _G["CliqueRow"..i], -9,0)
				end
				_G["CliqueRow"..i]:GetHighlightTexture():SetDesaturated(1)
			end
		end
		CliqueRow1:ClearAllPoints()
		CliqueRow1:SetPoint("TOPLEFT",5,-(CliqueConfigPage1Column1:GetHeight() +3))
	end)

	CliqueConfigPage1_VSlider:StripTextures(true)
	CliqueConfigPage1ButtonSpell:SetPoint('BOTTOMLEFT', CliqueConfig, 'BOTTOMLEFT', 3, 2)
	CliqueConfigPage1ButtonOptions:SetPoint('BOTTOMRIGHT', CliqueConfig, 'BOTTOMRIGHT', -5, 2)
	CliqueConfigPage2ButtonSave:SetPoint("BOTTOMLEFT", CliqueConfig,"BOTTOMLEFT", 3, 2)
	CliqueConfigPage2ButtonCancel:SetPoint('BOTTOMRIGHT', CliqueConfig, 'BOTTOMRIGHT', -5, 2)
	AS:SkinScrollBar(CliqueScrollFrameScrollBar)
	AS:SkinIconButton(CliqueSpellTab)
	CliqueSpellTab:SetNormalTexture([[Interface\AddOns\Clique\images\icon_square_64]])
	AS:SkinTexture(CliqueSpellTab:GetNormalTexture())
	CliqueSpellTab:GetNormalTexture():ClearAllPoints()
	CliqueSpellTab:GetNormalTexture():SetInside()
	CliqueConfigInset:StripTextures()
end

AS:RegisterSkin(name, AS.SkinClique)