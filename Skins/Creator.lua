-- Check these files for DecUI-specific edits - Decard
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Creator') then return end

function AS:Creator()
	AS:SkinFrame(CreatorFrameMain)
	CreatorFrameMain:SetTemplate("Transparent")
	AS:SkinButton(Race_Button)
	AS:SkinButton(Armor_Button)
	AS:SkinButton(Weapon_Button)
	AS:SkinButton(Enchant_Button)
	AS:SkinButton(Morph_Button)
	AS:SkinButton(Mount_Button)
	AS:SkinButton(Mount_Button)
	AS:SkinButton(Spells_Button)
	AS:SkinButton(DruidFormsButton)
	AS:SkinCloseButton(CreatorFrameMain.CloseButton)
end

AS:RegisterSkin('Creator', AS.Creator)