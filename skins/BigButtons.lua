local U = unpack(select(2,...))

U.numBigButtons = 0
local buttons = {}
local function CreateBigButton(name,itemId,type,action,check,...)
	local size = 33
	if U.elv and U.c.PixelMode then size = 31 end
	
	if not BigButtonHolder then
		local bbholder = CreateFrame("Frame","BigButtonHolder",U.elv and U.c.UIParent or UIParent)
		bbholder:Size(30)
		bbholder:Point('TOP', U.elv and U.c.UIParent or UIParent, 'TOP', 0, -250)

		if U.elv then U.c:CreateMover(bbholder, 'BigButtons', 'Big Buttons', nil, nil, nil, 'ALL,ACTIONBARS') end

		U.UpdateBigButtonHolder = function()
			bbholder:SetSize(size*U.numBigButtons,50)
			bbholder:Point('TOP', U.elv and U.c.UIParent or UIParent, 'TOP', 0, -250)
		
			if U.numBigButtons > 0 then
				bbholder:Show()
			else
				bbholder:Hide()
			end
		end
	end

	local button = CreateFrame("Button", name.."Button", bbholder, "SecureActionButtonTemplate")
	button:Size(30)
	button:SetMovable(true)
	button:SetTemplate("Default")
	button:SetAttribute("type", type);
	button:SetAttribute(type, action);
	UIFrameFadeOut(button, 0.2, button:GetAlpha(), 0)
	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetPoint("CENTER")
	local func = type == 'spell' and _G["GetSpellInfo"] or _G["GetItemInfo"]
	local index = type == 'spell' and 3 or 10
	button.icon:SetTexture(select(index, func(itemId)))
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	local iconSize = U.elv and U.c.PixelMode and button:GetSize()-1 or button:GetSize()-4
	button.icon:Size(iconSize)
	for i = 1,select('#',...) do
		local event = select(i,...)
		button:RegisterEvent(event)
	end
	buttons[name] = false
	button:SetScript("OnEvent", function(self,event)
		if not U.CheckOption("BigButtons") then return end
		if not InCombatLockdown() then
			if check() then
				self:Show()
				if not buttons[name] then buttons[name] = true; U.numBigButtons = U.numBigButtons + 1 end
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				self:SetPoint("LEFT", BigButtonHolder, "LEFT", (U.numBigButtons -1) * size, 0)
			else
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				if buttons[name] then buttons[name] = false; U.numBigButtons = U.numBigButtons - 1 end
				self:Hide()
			end
			U.UpdateBigButtonHolder()
		else
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
		end
		if event == "PLAYER_REGEN_ENABLED" then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end)
end

local FishingButton = CreateBigButton("Fishing",131474,'spell','Fishing',function() return IsEquippedItemType("Fishing Poles") end,"PLAYER_ENTERING_WORLD","UNIT_INVENTORY_CHANGED")
local SurveyButton = CreateBigButton("Survey",80451,'spell','Survey',function() return false end,"PLAYER_ENTERING_WORLD","UNIT_INVENTORY_CHANGED","ARTIFACT_DIG_SITE_UPDATED")
local RustyWateringCanButton = CreateBigButton("RusyWateringCan",79104,'item','Rusty Watering Can',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(79104) == 1 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local VintageBugSprayerButton = CreateBigButton("VintageBugSprayer",80513,'item','Vintage Bug Sprayer',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80513) == 1 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local DentedShovelButton = CreateBigButton("DentedShovel",89880,'item','Dented Shovel',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89880) == 1 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local MasterPlowButton = CreateBigButton("MasterPlow",89815,'item','Master Plow',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89815) == 1 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local GreenCabbageSeedsButton = CreateBigButton("GreenCabbageSeeds",79102,'item','Green Cabbage Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(79102) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local JuicycunchCarrotSeedsButton = CreateBigButton("JuicycrunchCarrotSeeds",80590,'item','Juicycrunch Carrot Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80590) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local ScallionSeedsButton = CreateBigButton("ScallionSeeds",80591,'item','Scallion Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80591) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local MoguPumpkinSeedsButton = CreateBigButton("MoguPumpkinSeeds",80592,'item','Mogu Pumpkin Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80592) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local RedBlossomLeekSeedsButton = CreateBigButton("RedBlossomLeekSeeds",80593,'item','Red Blossom Leek Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80593) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local PinkTurnipSeedsButton = CreateBigButton("PinkTurnipSeeds",80594,'item','Pink Turnip Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80594) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local WhiteTurnipSeedsButton = CreateBigButton("WhiteTurnipSeeds",80595,'item','White Turnip Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(80595) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local SnakerootSeedButton = CreateBigButton("SnakerootSeed",85215,'item','Snakeroot Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85215) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local EnigmaSeedButton = CreateBigButton("EnigmaSeed",85216,'item','Enigma Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85216) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local MagebulbSeedButton = CreateBigButton("MagebulbSeed",85217,'item','Magebulb Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85217) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local OminousSeedButton = CreateBigButton("OminousSeed",85219,'item','Ominous Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85219) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local StripedMelonSeedsButton = CreateBigButton("StripedMelonSeeds",89239,'item','Striped Melon Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89239) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local AutumnBlossomSaplingButton = CreateBigButton("AutumnBlossomSapling",85267,'item','Autumn Blossom Sapling',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85267) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local SpringBlossomSaplingButton = CreateBigButton("SpringBlossomSapling",85268,'item','Spring Blossom Sapling',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85268) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local WinterBlossomSaplingButton = CreateBigButton("WinterBlossomSapling",85269,'item','Winter Blossom Sapling',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(85269) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local WindshearCactusSeedButton = CreateBigButton("WindshearCactusSeed",89197,'item','Windshear Cactus Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89197) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local RaptorleafSeedButton = CreateBigButton("RaptorleafSeed",89202,'item','Raptorleaf Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89202) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local SongbellSeedButton = CreateBigButton("SongbellSeed",89233,'item','Songbell Seed',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89233) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local WitchberrySeedsButton = CreateBigButton("WitchberrySeeds",89326,'item','Witchberry Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89326) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")
local JadeSquashSeedsButton = CreateBigButton("JadeSquashSeeds",89328,'item','Jade Squash Seeds',function() return GetSubZoneText() == "Sunsong Ranch" and GetItemCount(89328) > 0 end,"PLAYER_ENTERING_WORLD","ZONE_CHANGED","UNIT_INVENTORY_CHANGED")