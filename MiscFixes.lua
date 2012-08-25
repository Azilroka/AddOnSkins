if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if IsAddOnLoaded("TomTom") then if TomTomBlock then TomTomBlock:SetTemplate("Transparent") end end
if IsAddOnLoaded("SymbiosisTip") then SymbiosisTip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end) end
LoadAddOn("acb_CastBar")
if IsAddOnLoaded("acb_CastBar") then
local SkinAZCastBar = CreateFrame("Frame")
	SkinAZCastBar:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinAZCastBar:SetScript("OnEvent", function(self)
	print("AzCastBar Skinning")
	AzCastBarPluginPlayer:StripTextures() AzCastBarPluginPlayer:CreateBackdrop()
	AzCastBarPluginTarget:StripTextures() AzCastBarPluginTarget:CreateBackdrop()
	AzCastBarPluginFocus:StripTextures() AzCastBarPluginFocus:CreateBackdrop()
	AzCastBarPluginMirror:StripTextures() AzCastBarPluginMirror:CreateBackdrop()
	AzCastBarPluginPet:StripTextures() AzCastBarPluginPet:CreateBackdrop()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)
end

cSkinTab(CharacterFrameTab5)

----------------------------------------
-- Loot auto confirm
----------------------------------------
if (LootConfirm == "True") then

local LootConfirmer = CreateFrame("Frame")
LootConfirmer:RegisterEvent("CONFIRM_DISENCHANT_ROLL");
LootConfirmer:RegisterEvent("CONFIRM_LOOT_ROLL");
	LootConfirmer:SetScript("OnEvent",
		function(self, event, ...)
		local arg1, arg2 = ...;
		ConfirmLootRoll(arg1, arg2);
	end)

StaticPopupDialogs["CONFIRM_LOOT_ROLL"] = nil
end

--Minimap Button Skinning thanks to Sinaris

if IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("SinarisUI") then return end

local buttons = {
	"QueueStatusMinimapButton",
	"MiniMapTrackingButton",
	"MiniMapMailFrame",
	"HelpOpenTicketButton",
	"ElvConfigToggle",
	"DBMMinimapButton",
	"UpperRepExpBarHolder",
}

local function SkinButton(frame)
	if(frame:GetObjectType() ~= "Button") then return end

	for i, buttons in pairs(buttons) do
		if(frame:GetName() ~= nil) then
			if(frame:GetName():match(buttons)) then return end
		end
	end

	frame:SetPushedTexture(nil)
	frame:SetHighlightTexture(nil)
	frame:SetDisabledTexture(nil)
	frame:Size(24)

	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if(region:GetObjectType() == "Texture") then
			local tex = region:GetTexture()

			if(tex and (tex:find("Border") or tex:find("Background") or tex:find("AlphaMask"))) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:Point("TOPLEFT", frame, "TOPLEFT", 2, -2)
				region:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
				region:SetDrawLayer( "ARTWORK" )
				if(frame:GetName() == "PS_MinimapButton") then
					region.SetPoint = S.dummy
				end
			end
		end
	end

	frame:SetTemplate("Default")
end

local UISkinMinimapButtons = CreateFrame("Frame")
UISkinMinimapButtons:RegisterEvent("PLAYER_LOGIN")
UISkinMinimapButtons:SetScript("OnEvent", function(self, event)
	for i = 1, Minimap:GetNumChildren() do
		SkinButton(select(i, Minimap:GetChildren()))
	end

	self = nil
end )