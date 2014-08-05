local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GHI') then return end

local name = 'GryphonHeartItemsSkin'
function AS:SkinGryphonheartItems()
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
		local name = frame:GetName();
		_G[name.."BackgroundTop"]:Kill()
		_G[name.."BackgroundMiddle1"]:Kill()
		_G[name.."BackgroundBottom"]:Kill()
		_G[name.."BackgroundMiddle2"]:Kill()
		_G[name.."Background1Slot"]:Kill()

		AS:SkinFrame(frame, nil, true)
		AS:SkinCloseButton(_G[name..'CloseButton'])
		print(_G[name..'CloseButton']:GetPoint())
		AS:SkinTexture(_G[name.."Portrait"])
		_G[name.."Portrait"]:SetDrawLayer('OVERLAY')
		_G[name.."Portrait"]:SetInside(_G[name.."PortraitButton"])
		_G[name.."PortraitButton"]:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -2)

		_G[name..'CloseButton'].IsSkinned = true
		_G[name..'Plate'].IsSkinned = true
		_G[name..'PortraitButton'].IsSkinned = true
		for j = 1, size, 1 do
			AS:SkinIconButton(_G[name..'Item'..j], true)
			_G[name..'Item'..j].IsSkinned = true
			_G[name..'Item'..j]:HookScript('OnUpdate', function(self)
				local itemGuid, texture, count, stacklocked, quality = GHI_ContainerAPI().GetAPI().GHI_GetContainerItemInfo(self.containerGuid, self.slotID)
				local backdrop = self.backdrop or self.Backdrop
				backdrop:SetAllPoints()
				if quality and quality > 1 then
					local r, g, b = GetItemQualityColor(quality)
					backdrop:SetBackdropBorderColor(r, g, b)
				else
					backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			if IsAddOnLoaded('ElvUI') then ElvUI[1]:RegisterCooldown(_G[name.."Item".. j.."Cooldown"]) end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinGryphonheartItems)