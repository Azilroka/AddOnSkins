local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdiBags') then return end

local name = 'AdiBagsSkin'
function AS:SkinAdiBags(event)
	local AdiBags = LibStub('AceAddon-3.0'):GetAddon('AdiBags')

	--hooksecurefunc(AdiBags, 'HookBagFrameCreation', function(self) print(self) end)

	local function SkinFrame(frame)
		local region = frame.HeaderRightRegion
		AS:SkinFrame(frame)
		AS:SkinFrame(_G[frame:GetName()..'Bags'], 'Default', true)
		AS:SkinCloseButton(frame.CloseButton)
		for i = 1, 3 do
			AS:SkinButton(region.widgets[i].widget, true)
		end
	end

	if event == 'PLAYER_ENTERING_WORLD' then
		AS:Delay(1, function()
			if not AdiBagsContainer1 then ToggleBackpack() ToggleBackpack() end
			if AdiBagsContainer1 then
				SkinFrame(AdiBagsContainer1)
				AS:SkinEditBox(AdiBagsContainer1SearchBox)
				AdiBagsContainer1SearchBox:Point('TOPRIGHT', AdiBagsSimpleLayeredRegion2, 'TOPRIGHT', -75, -1)
			end
		end)
	elseif event == 'BANKFRAME_OPENED' then
		AS:Delay(1, function()
			if AdiBagsContainer2 then
				SkinFrame(AdiBagsContainer2)
				AS:UnregisterSkinEvent(name, event)
			end
		end)
	end
end

AS:RegisterSkin(name, AS.SkinAdiBags, 'BANKFRAME_OPENED')