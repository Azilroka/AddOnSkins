if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("AdiBags") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local function SkinFrame(frame)
	local region = frame.HeaderRightRegion
	frame:StripTextures()
	frame:SetTemplate('Transparent')
	_G[frame:GetName()..'Bags']:StripTextures()
	_G[frame:GetName()..'Bags']:SetTemplate('Transparent')
	cSkinCloseButton(frame.CloseButton)
	for i = 1, 3 do
		cSkinButton(region.widgets[i].widget, true)
	end
	frame.Anchor:EnableMouse(false)
end


local AdiSkin = CreateFrame('Frame')
AdiSkin:RegisterEvent('PLAYER_ENTERING_WORLD')
AdiSkin:RegisterEvent('BANKFRAME_OPENED')
AdiSkin:SetScript('OnEvent', function(self, event, addon)
if (UISkinOptions.AdiBagsSkin ~= "Enabled") then return end
	if event == 'PLAYER_ENTERING_WORLD' then
		while not AdiBagsContainer1 do
			ToggleBackpack()
		end
		ToggleBackpack()
		local A = LibStub('AceAddon-3.0'):GetAddon('AdiBags', true)
		local f = AdiBagsContainer1
		SkinFrame(f)
		cSkinEditBox(AdiBagsSearchFrame)
	if IsAddOnLoaded("Tukui") then
		AdiBagsSearchFrame:Point("TOPRIGHT", AdiBagsSimpleLayeredRegion2, "TOPRIGHT", -75, -1)
	end
	if IsAddOnLoaded("ElvUI") then
		local B = c:GetModule('Bags')

		local vendorButton = CreateFrame('Button', nil, f, 'UIPanelButtonTemplate')
		vendorButton.bagName = f.bagName
		vendorButton:SetText('S')
		vendorButton:SetWidth(20)
		vendorButton:SetHeight(20)
		A.SetupTooltip(vendorButton, {
			'Vendor Grays',
			'Hold Shift:' ..' ' .. 'Delete Grays',
		}, 'ANCHOR_TOPLEFT', 0, 8)
		vendorButton:SetScript('OnClick', function() B:VendorGrayCheck() end)
		cSkinButton(vendorButton, true)
		f:AddHeaderWidget(vendorButton, -5)

		local x = LeftChatToggleButton:GetLeft()
		local y = LeftChatToggleButton:GetTop() + 1

		A.db.profile.positionMode = 'manual'
		A.db.profile.positions['Backpack'].xOffset = -x
		A.db.profile.positions['Backpack'].yOffset = y
		A.db.profile.positions['Bank'].xOffset = x
		A.db.profile.positions['Bank'].yOffset = y
		A.db.profile.positions['Bank'].point = 'BOTTOMLEFT'
	end
		AdiSkin:UnregisterEvent('PLAYER_ENTERING_WORLD')
	elseif event == 'BANKFRAME_OPENED' then
				SkinFrame(AdiBagsContainer2)
		AdiSkin:UnregisterEvent('BANKFRAME_OPENED')
	end
end)