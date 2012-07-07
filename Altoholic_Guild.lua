local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameGuildMembers:StripTextures()
AltoholicFrameGuildMembers:SetTemplate("Default")
AltoholicFrameGuildBank:StripTextures()
AltoholicFrameGuildBank:SetTemplate("Default")
cSkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
AltoholicFrameGuildMembersScrollFrame:StripTextures()

--Guild
for i = 1, 2 do
	_G["AltoholicTabGuildMenuItem"..i]:StripTextures()
	_G["AltoholicTabGuildMenuItem"..i]:SetTemplate("Default")
end
for i = 1, 14 do
	_G["AltoholicFrameGuildBankEntry1Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry2Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry3Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry4Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry5Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry6Item"..i]:StripTextures()
	_G["AltoholicFrameGuildBankEntry7Item"..i]:StripTextures()
end
for i = 1, 19 do
	_G["AltoholicFrameGuildMembersItem"..i]:StripTextures()
end

--Sorts
for i = 1, 5 do
	_G["AltoholicTabGuild_Sort"..i]:StripTextures()
	_G["AltoholicTabGuild_Sort"..i]:SetTemplate("Default")
end

end
if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then 
	s.SkinFuncs["Altoholic_Guild"] = LoadSkin
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Guild', LoadSkin)
end
