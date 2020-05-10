local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NovaWorldBuffs') then return end

function AS:SkinNovaFrame(frame)
	if frame then
		if frame.timerFrame then AS:SkinFrame(frame.timerFrame) end
		if frame.noLayerFrame then AS:SkinFrame(frame.noLayerFrame) end
		if frame.tooltip then AS:SkinTooltip(frame.tooltip) end
		if frame.texture then AS:SkinTexture(frame.texture, true) end
	end
end


function AS:NovaWorldBuffs()
	if (NWB.isLayered) then
		local count = 0;
		for layer, data in NWB:pairsByKeys(NWB.data.layers) do
			count = count + 1;
			for k, v in pairs(NWB.worldBuffMapMarkerTypes) do
				AS:SkinNovaFrame(_G[k .. layer .. "NWBWorldMap"])
			end
		end
	end

	for k, v in pairs(NWB.worldBuffMapMarkerTypes) do
		AS:SkinNovaFrame(_G[k .. "NWBWorldMap"])
	end
	
	AS:SkinNovaFrame(_G["NWBDMF"])
	AS:SkinFrame(_G["NWBDMFTimerFrame"])
	AS:SkinFrame(_G["NWBbuffListFrame"])
	AS:SkinFrame(_G["NWBlayerFrame"])
	
	AS:SkinTooltip(_G["NWBDMFContinentTooltip"])
	AS:SkinTooltip(_G["NWBlayerDragTooltip"])
	AS:SkinTooltip(_G["NWBVersionDragTooltip"])
	AS:SkinTooltip(_G["NWBbuffListDragTooltip"])

	local Buttons = {
		NWBbuffListFrameConfButton,
		NWBbufflistFrameTimersButton,
		NWBbuffListFrameWipeButton,
		NWBlayerFrameConfButton,
		NWBlayerFrameBuffsButton,
	}

	for _, Button in pairs(Buttons) do
		if Button then AS:SkinButton(Button, true) end
	end

	NWBbufflistFrameTimersButton:SetPoint("CENTER", -58, -18)
	NWBbuffListFrameWipeButton:SetPoint("BOTTOMRIGHT", -4, 4)

	NWBlayerFrameBuffsButton:SetPoint("CENTER", -58, -18)

	NWBbuffListFrameFS:SetPoint("TOP", 0, -1)
	NWBlayerFrameFS:SetPoint("TOP", 0, -1)

	NWBbuffListFrame.EditBox:SetPoint("TOPLEFT", 2, 0)
	NWBlayerFrame.EditBox:SetPoint("TOPLEFT", 2, 0)

	AS:SkinCloseButton(NWBbuffListFrameClose, true)
	AS:SkinCloseButton(NWBlayerFrameClose, true)

	nefNWBWorldMapBuffCmdFS:Hide()
end

AS:RegisterSkin('NovaWorldBuffs', AS.NovaWorldBuffs)
