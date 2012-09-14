if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("BROKENPIECEOFSHIT") then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c

local name = 'AdiBagsSkin'
local function SkinFrame(frame)
	local region = frame.HeaderRightRegion
	frame:StripTextures()
	frame:SetTemplate('Transparent')
	_G[frame:GetName()..'Bags']:StripTextures()
	_G[frame:GetName()..'Bags']:SetTemplate('Transparent')
	U.SkinCloseButton(frame.CloseButton)
	for i = 1, 3 do
		U.SkinButton(region.widgets[i].widget, true)
	end
end

local function AdiSkin(self,event)
	if event == 'PLAYER_ENTERING_WORLD' then
		while not AdiBagsContainer1 do
			ToggleBackpack()
		end
		ToggleBackpack()
		local A = LibStub('AceAddon-3.0'):GetAddon('AdiBags', true)
		local f = AdiBagsContainer1
		SkinFrame(f)
		U.SkinEditBox(AdiBagsSearchFrame)
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
			U.SkinButton(vendorButton, true)
			f:AddHeaderWidget(vendorButton, -5)
		end
	elseif event == 'BANKFRAME_OPENED' then
		SkinFrame(AdiBagsContainer2)
		U.UnregisterEvent("BANKFRAME_OPENED")
	end
end

U.RegisterSkin(name,AdiSkin,"BANKFRAME_OPENED")