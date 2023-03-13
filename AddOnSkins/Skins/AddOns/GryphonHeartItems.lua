local AS, L, S, R = unpack(AddOnSkins)

function R:GHI()
	local holder = ExtraActionBarFrame:GetParent()
	GHI_ExtraButtonFrame:SetParent(holder)
	GHI_ExtraButtonFrame:ClearAllPoints()
	GHI_ExtraButtonFrame:SetPoint('CENTER', holder, 'CENTER')

	hooksecurefunc('GHI_ButtonUI', function()
		S:HandleItemButton(GHI_ButtonSquared)
	end)

	hooksecurefunc('GHI_ToggleBackpack', function()
		if GHI_ContainerFrame1.IsButtonsDone then return end
		for k = 1, GHI_ContainerFrame1:GetNumChildren() do
			local Region = select(k, GHI_ContainerFrame1:GetChildren())
			if Region:IsObjectType('Button') and not Region.IsSkinned then
				S:HandleButton(Region)
				Region.IsSkinned = true
			end
		end
		GHI_ContainerFrame1.IsButtonsDone = true
	end)

	hooksecurefunc('GHI_ContainerFrame_GenerateFrame', function(frame, size, itemname, icon, specialTexture)
		local name = frame:GetName()
		S:Kill(_G[name.."BackgroundTop"])
		S:Kill(_G[name.."BackgroundMiddle1"])
		S:Kill(_G[name.."BackgroundBottom"])
		S:Kill(_G[name.."BackgroundMiddle2"])
		S:Kill(_G[name.."Background1Slot"])

		S:HandleFrame(frame, nil, true)
		S:HandleCloseButton(_G[name..'CloseButton'])
		S:HandleIcon(_G[name.."Portrait"])
		S:SetInside(_G[name.."Portrait"], _G[name.."PortraitButton"])
		_G[name.."PortraitButton"]:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -2)

		_G[name..'CloseButton'].IsSkinned = true
		_G[name..'Plate'].IsSkinned = true
		_G[name..'PortraitButton'].IsSkinned = true
		for j = 1, size, 1 do
			S:HandleItemButton(_G[name..'Item'..j], true)
			_G[name..'Item'..j].IsSkinned = true
			_G[name..'Item'..j]:HookScript('OnUpdate', function(self)
				local itemGuid, texture, count, stacklocked, quality = GHI_ContainerAPI().GetAPI().GHI_GetContainerItemInfo(self.containerGuid, self.slotID)
				if quality and quality > 1 then
					local r, g, b = GetItemQualityColor(quality)
					self:SetBackdropBorderColor(r, g, b)
				else
					self:SetBackdropBorderColor(unpack(S.borderColor))
				end
			end)
		end
	end)
end

AS:RegisterSkin('GHI')
