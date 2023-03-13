local AS, L, S, R = unpack(AddOnSkins)

function R:GupPet()
--[[
	if GupPet_IngameFrameTemplateAuto then
		S:HandleItemButton(GupPet_IngameFrameTemplateAuto)
		GupPet_IngameFrameTemplateAutoIcon:SetTexture("Interface\\Icons\\Ability_Mount_Drake_Azure")
		GupPet_IngameFrameTemplateAutoIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateGround then
		S:HandleItemButton(GupPet_IngameFrameTemplateGround)
		GupPet_IngameFrameTemplateGroundIcon:SetTexture("Interface\\Icons\\Ability_Mount_Mammoth_Black")
		GupPet_IngameFrameTemplateGroundIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateFly then
		S:HandleItemButton(GupPet_IngameFrameTemplateFly)
		GupPet_IngameFrameTemplateFlyIcon:SetTexture("Interface\\Icons\\Ability_Mount_Drake_Bronze")
		GupPet_IngameFrameTemplateFlyIcon:SetDrawLayer('ARTWORK')
	end

	if GupPet_IngameFrameTemplateCompanion then
		S:HandleItemButton(GupPet_IngameFrameTemplateCompanion)
		GupPet_IngameFrameTemplateCompanionIcon:SetTexture("Interface\\Icons\\INV_Box_PetCarrier_01")
		GupPet_IngameFrameTemplateCompanionIcon:SetDrawLayer('ARTWORK')
	end
]]

	S:HandleFrame(GupPet_InterfaceOptionsFrame)
	S:HandleFrame(GupPet_InterfaceOptionsFrameOptions)
	S:HandleFrame(GupPet_InterfaceOptionsFrameMountsCompanions)
	S:HandleFrame(GupPet_InterfaceOptionsFrameHelp)
	-- S:HandleButton(GupPet_IngameFrameTemplateMoveBottomRight)
	-- S:HandleButton(GupPet_IngameFrameTemplateMoveTopRight)
	-- S:HandleButton(GupPet_IngameFrameTemplateMoveBottomLeft)
	-- S:HandleButton(GupPet_IngameFrameTemplateMoveTopLeft)
	S:HandleTab(GupPet_InterfaceOptionsFrameTab1)
	S:HandleTab(GupPet_InterfaceOptionsFrameTab2)
	S:HandleTab(GupPet_InterfaceOptionsFrameTab3)
	S:HandleTab(GupPet_InterfaceOptionsFrameTab4)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabAdd)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabRemove)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabAquatic)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabGround)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabFly)
	S:HandleTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabCompanion)
end

AS:RegisterSkin('GupPet')
