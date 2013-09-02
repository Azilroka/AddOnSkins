﻿local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'BGDefenderSkin'
function AS:SkinBGDefender()
	local function OnEnter(f)
		local text
		if f:GetName() == "Button9" then
			text = "Close"
		elseif f:GetName() == "Button10" then
			text = "Options"
		elseif f:GetName() == "Button11" then
			text = "Lock or Make Moveable"
		end
		GameTooltip:SetOwner(f, "ANCHOR_CURSOR")
		GameTooltip:AddLine(text, 1, 1, 1)
		GameTooltip:Show()
	end

	local function OnLeave()
		GameTooltip:Hide()
	end

	AS:SkinFrame(BGDefenderFrame)

	local StripAllTextures = {
		"Button9",
		"Button10",
		"Button11",
	}

	local buttons = {
		"Button1",
		"Button2",
		"Button3",
		"Button4",
		"Button5",
		"Button6",
		"Button7",
		"Button8",
		"Button9",
		"Button10",
		"Button11",
	}

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end	

	for _, button in pairs(buttons) do
		AS:SkinButton(_G[button])
	end	

	BGDefenderFrame:SetWidth(160)
	BGDefenderFrame:SetHeight(72)
	Button9:SetWidth(16)
	Button9:SetHeight(16)
	Button10:SetWidth(16)
	Button10:SetHeight(16)
	Button11:SetWidth(16)
	Button11:SetHeight(16)

	Text1:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -3)
	Button1:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -25)
	Button2:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 30, -25)
	Button3:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 55, -25)
	Button4:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 80, -25)
	Button5:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 105, -25)
	Button6:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 130, -25)
	Button7:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 5, -48)
	Button8:Point("TOPLEFT", BGDefenderFrame, "TOPLEFT", 97, -48)

	AS:SkinDropDownBox(DropDown1, 200)
	AS:SkinDropDownBox(DropDown2, 200)
	AS:SkinDropDownBox(DropDown3, 200)
	AS:SkinCheckBox(BGDefenderPrefaceButton)
	Text1:SetTextColor(23/255, 132/255, 209/255)
	Button1:SetNormalFontObject("GameFontHighlight")
	local font = Button1:GetNormalFontObject()
	font:SetTextColor(1, 1, 1, 1)
	Button1:SetNormalFontObject(font)
	Button9:SetScript("OnEnter", OnEnter)
	Button9:SetScript("OnLeave", OnLeave)
	Button10:SetScript("OnEnter", OnEnter)
	Button10:SetScript("OnLeave", OnLeave)
	Button11:SetScript("OnEnter", OnEnter)
	Button11:SetScript("OnLeave", OnLeave)
end

AS:RegisterSkin(name, AS.SkinBGDefender)