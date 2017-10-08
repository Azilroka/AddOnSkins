local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GupPet') then return end

function AS:GupPet()
--[[
	if GupPet_IngameFrameTemplateAuto then
		AS:SkinIconButton(GupPet_IngameFrameTemplateAuto)
		GupPet_IngameFrameTemplateAutoIcon:SetTexture("Interface\\Icons\\Ability_Mount_Drake_Azure")
		GupPet_IngameFrameTemplateAutoIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateGround then
		AS:SkinIconButton(GupPet_IngameFrameTemplateGround)
		GupPet_IngameFrameTemplateGroundIcon:SetTexture("Interface\\Icons\\Ability_Mount_Mammoth_Black")
		GupPet_IngameFrameTemplateGroundIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateFly then
		AS:SkinIconButton(GupPet_IngameFrameTemplateFly)
		GupPet_IngameFrameTemplateFlyIcon:SetTexture("Interface\\Icons\\Ability_Mount_Drake_Bronze")
		GupPet_IngameFrameTemplateFlyIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateCompanion then
		AS:SkinIconButton(GupPet_IngameFrameTemplateCompanion)
		GupPet_IngameFrameTemplateCompanionIcon:SetTexture("Interface\\Icons\\INV_Box_PetCarrier_01")
		GupPet_IngameFrameTemplateCompanionIcon:SetDrawLayer('ARTWORK')
	end
]]

	AS:SkinFrame(GupPet_InterfaceOptionsFrame)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameOptions)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameMountsCompanions)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameHelp)
	-- AS:SkinButton(GupPet_IngameFrameTemplateMoveBottomRight)
	-- AS:SkinButton(GupPet_IngameFrameTemplateMoveTopRight)
	-- AS:SkinButton(GupPet_IngameFrameTemplateMoveBottomLeft)
	-- AS:SkinButton(GupPet_IngameFrameTemplateMoveTopLeft)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab1)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab2)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab3)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab4)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabAdd)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabRemove)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabAquatic)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabGround)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabFly)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabCompanion)
end

AS:RegisterSkin('GupPet', AS.GupPet)
