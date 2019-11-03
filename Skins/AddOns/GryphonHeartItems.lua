local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GHI') then return end

function AS:GryphonheartItems()
	local holder = ExtraActionBarFrame:GetParent()
	GHI_ExtraButtonFrame:SetParent(holder)
	GHI_ExtraButtonFrame:ClearAllPoints()
	GHI_ExtraButtonFrame:SetPoint('CENTER', holder, 'CENTER')

	hooksecurefunc('GHI_ButtonUI', function()
		AS:SkinIconButton(GHI_ButtonSquared)
	end)

	hooksecurefunc('GHI_ToggleBackpack', function()
		if GHI_ContainerFrame1.IsButtonsDone then return end
		for k = 1, GHI_ContainerFrame1:GetNumChildren() do
			local Region = select(k, GHI_ContainerFrame1:GetChildren())
			if Region:IsObjectType('Button') and not Region.IsSkinned then
				AS:SkinButton(Region)
				Region.IsSkinned = true
			end
		end
		GHI_ContainerFrame1.IsButtonsDone = true
	end)

	hooksecurefunc('GHI_ContainerFrame_GenerateFrame', function(frame, size, itemname, icon, specialTexture)
		local name = frame:GetName()
		AS:Kill(_G[name.."BackgroundTop"])
		AS:Kill(_G[name.."BackgroundMiddle1"])
		AS:Kill(_G[name.."BackgroundBottom"])
		AS:Kill(_G[name.."BackgroundMiddle2"])
		AS:Kill(_G[name.."Background1Slot"])

		AS:SkinFrame(frame, nil, true)
		AS:SkinCloseButton(_G[name..'CloseButton'])
		AS:SkinTexture(_G[name.."Portrait"])
		AS:SetInside(_G[name.."Portrait"], _G[name.."PortraitButton"])
		_G[name.."PortraitButton"]:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -2)

		_G[name..'CloseButton'].IsSkinned = true
		_G[name..'Plate'].IsSkinned = true
		_G[name..'PortraitButton'].IsSkinned = true
		for j = 1, size, 1 do
			AS:SkinIconButton(_G[name..'Item'..j], true)
			_G[name..'Item'..j].IsSkinned = true
			_G[name..'Item'..j]:HookScript('OnUpdate', function(self)
				local itemGuid, texture, count, stacklocked, quality = GHI_ContainerAPI().GetAPI().GHI_GetContainerItemInfo(self.containerGuid, self.slotID)
				if quality and quality > 1 then
					local r, g, b = GetItemQualityColor(quality)
					self:SetBackdropBorderColor(r, g, b)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end)
end

AS:RegisterSkin('GryphonHeartItems', AS.GryphonheartItems)
