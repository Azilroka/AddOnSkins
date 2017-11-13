local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdiBags') then return end

local function SkinFrame(frame)
	local region = frame.HeaderRightRegion
	AS:SkinFrame(frame)
	AS:SkinFrame(_G[frame:GetName()..'Bags'], 'Default', true)
	AS:SkinCloseButton(frame.CloseButton)
	for i = 1, 5 do
		local widget = region.widgets[i] and region.widgets[i].widget
		if widget then
			if widget:IsObjectType('Button') then
				AS:SkinButton(widget, true)
			elseif widget:IsObjectType('EditBox') then
				AS:SkinEditBox(widget)
			end
		end
	end
	AS:SkinTexture(frame.BagSlotButton:GetNormalTexture())
end

function AS:AdiBags(event)
	local AdiBags = LibStub('AceAddon-3.0'):GetAddon('AdiBags')

	if event == 'PLAYER_ENTERING_WORLD' then
		AS:Delay(1, function()
			if not AdiBagsContainer1 then ToggleBackpack() ToggleBackpack() end
			if AdiBagsContainer1 then
				SkinFrame(AdiBagsContainer1)
				AdiBagsContainer1SearchBox:SetPoint('TOPRIGHT', AdiBagsSimpleLayeredRegion2, 'TOPRIGHT', -75, -1)
			end
		end)
	elseif event == 'BANKFRAME_OPENED' then
		AS:Delay(0.1, function()
			if AdiBagsContainer2 then
				SkinFrame(AdiBagsContainer2)
				AS:UnregisterSkinEvent('AdiBags', event)
			end
		end)
	end
end

AS:RegisterSkin('AdiBags', AS.AdiBags, 'BANKFRAME_OPENED')