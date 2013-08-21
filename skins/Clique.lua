local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CliqueSkin"
function AS:SkinClique()
	local Frames = {
		"CliqueDialog",
		"CliqueConfig",
		"CliqueConfigPage1",
		"CliqueConfigPage2",
		"CliqueClickGrabber",
	}

	for _, object in pairs(Frames) do
		AS:SkinBackdropFrame(_G[object])
		if _G[object] == CliqueConfig then
			_G[object].backdrop:SetPoint("TOPLEFT",0,0)
			_G[object].backdrop:SetPoint("BOTTOMRIGHT",0,-5)
		elseif _G[object] == CliqueClickGrabber or _G[object] == CliqueScrollFrame then
			_G[object].backdrop:SetPoint("TOPLEFT",4,0)
			_G[object].backdrop:SetPoint("BOTTOMRIGHT",-2,4)
		else
			_G[object]:SetFrameLevel(_G[object]:GetFrameLevel()+1)
			_G[object].backdrop:SetPoint("TOPLEFT",0,0)
			_G[object].backdrop:SetPoint("BOTTOMRIGHT",2,0)
		end
	end
	
	local CliqueButtons = {
		"CliqueConfigPage1ButtonSpell",
		"CliqueConfigPage1ButtonOther",
		"CliqueConfigPage1ButtonOptions",
		"CliqueConfigPage2ButtonBinding",
		"CliqueDialogButtonAccept",
		"CliqueDialogButtonBinding",
		"CliqueConfigPage2ButtonSave",
		"CliqueConfigPage2ButtonCancel",
	}

	for _, object in pairs(CliqueButtons) do
		AS:SkinButton(_G[object], true)
	end

	AS:SkinCloseButton(CliqueDialog.CloseButton)

	local CliqueTabs = {
		"CliqueConfigPage1Column1",
		"CliqueConfigPage1Column2",
	}

	for _, object in pairs(CliqueTabs) do
		_G[object]:StripTextures(true)
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
	CliqueDialog:SetSize(CliqueDialog:GetWidth()-1, CliqueDialog:GetHeight()-1)
	CliqueConfigPage1ButtonSpell:ClearAllPoints()
	CliqueConfigPage1ButtonOptions:ClearAllPoints()
	CliqueConfigPage1ButtonSpell:SetPoint("TOPLEFT", CliqueConfigPage1,"BOTTOMLEFT",0,-4)
	CliqueConfigPage1ButtonOptions:SetPoint("TOPRIGHT", CliqueConfigPage1,"BOTTOMRIGHT",2,-4)
	CliqueConfigPage2ButtonSave:ClearAllPoints()
	CliqueConfigPage2ButtonCancel:ClearAllPoints()
	CliqueConfigPage2ButtonSave:SetPoint("TOPLEFT", CliqueConfigPage2,"BOTTOMLEFT",0,-4)
	CliqueConfigPage2ButtonCancel:SetPoint("TOPRIGHT", CliqueConfigPage2,"BOTTOMRIGHT",2,-4)
	CliqueSpellTab:GetRegions():SetSize(.1,.1)
	AS:SkinTexture(CliqueSpellTab:GetNormalTexture())
	CliqueSpellTab:GetNormalTexture():ClearAllPoints()
	CliqueSpellTab:GetNormalTexture():SetInside()
	AS:SkinBackdropFrame(CliqueSpellTab)
	CliqueSpellTab.backdrop:SetAllPoints()
	CliqueSpellTab:StyleButton(true)
end

AS:RegisterSkin(name, AS.SkinClique)