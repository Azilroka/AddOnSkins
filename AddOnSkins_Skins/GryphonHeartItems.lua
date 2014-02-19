local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GHI') then return end

local name = 'GryphonheartItemsSkin'
function AS:SkinGryphonheartItems()
	hooksecurefunc('GHI_ButtonUI', function()
		AS:SkinIconButton(GHI_ButtonSquared)
	end)
	hooksecurefunc('GHI_ToggleBackpack', function()
		if not GHI_ContainerFrame1.IsSkinned then
			AS:SkinFrame(GHI_ContainerFrame1)
			for i = 1, 36 do
				AS:SkinIconButton(_G['GHI_ContainerFrame1Item'..i])
				_G['GHI_ContainerFrame1Item'..i].IsSkinned = true
			end
			AS:SkinCloseButton(GHI_ContainerFrame1CloseButton)
			GHI_ContainerFrame1CloseButton.IsSkinned = true
			GHI_ContainerFrame1Plate.IsSkinned = true
			GHI_ContainerFrame1PortraitButton.IsSkinned = true
			for i = 1, GHI_ContainerFrame1:GetNumChildren() do
				local Region = select(i, GHI_ContainerFrame1:GetChildren())
				if Region:GetObjectType() == 'Button' and not Region.IsSkinned then
					AS:SkinButton(Region)
				end
			end
		end
	end)
	AS:Delay(1, function()
		GHI_ToggleBackpack()
		GHI_ToggleBackpack()
	end)
end

AS:RegisterSkin(name, AS.SkinGryphonheartItems)