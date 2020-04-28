local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NovaWorldBuffs') then return end

function AS:NovaWorldBuffs()
	local Frames = {
		nefNWBWorldMap.noLayerFrame,
		onyWorldMapTimerFrame,
		nefWorldMapTimerFrame,
		rendWorldMapTimerFrame,
		NWBDMFTimerFrame,
		NWBbuffListFrame,
		NWBlayerFrame,
	}

	for _, Frame in pairs(Frames) do
		if Frame then AS:SkinFrame(Frame) end
	end

	local Tooltips = {
		onyWorldMapTooltip,
		nefWorldMapTooltip,
		rendWorldMapTooltip,
		NWBDMFTooltip,
		NWBDMFContinentTooltip,
		NWBlayerDragTooltip,
		NWBVersionDragTooltip,
		NWBbuffListDragTooltip,
	}

	for _, Tooltip in pairs(Tooltips) do
		if Tooltip then AS:SkinTooltip(Tooltip) end
	end
	
	local Textures = {
		onyNWBWorldMap.texture,
		nefNWBWorldMap.texture,
		rendNWBWorldMap.texture,
		NWBDMF.texture,
	}

	for _, Texture in pairs(Textures) do
		if Texture then AS:SkinTexture(Texture, true) end
	end

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
