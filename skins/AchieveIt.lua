local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'AchieveItSkin'
function AS:SkinAchieveIt(event,addonName)
	if event == "PLAYER_ENTERING_WORLD" then return end

	if addonName == "Blizzard_AchievementUI" then
		AchievementFrame:HookScript("OnShow", function(self)
			for i=1, 20 do
				local frame = _G["AchievementFrameCategoriesContainerButton"..i]
				local lastframe = _G["AchievementFrameCategoriesContainerButton"..i-1]
				
				frame:StripTextures()
				frame:StyleButton()				
			end
		end)
		E:Delay(1,function()
			for i=1, 20 do
				local frame = _G["AchievementFrameCategoriesContainerButton"..i]
				local lastframe = _G["AchievementFrameCategoriesContainerButton"..i-1]
				
				frame:StripTextures()
				frame:StyleButton()				
			end
			if AchieveIt_Locate_Button then
				S:HandleButton(AchieveIt_Locate_Button)
				AchieveIt_Locate_Button:ClearAllPoints()
				AchieveIt_Locate_Button:SetPoint("TOPLEFT", AchievementFrame, 250, 5)
			end
		end)
	end
end

AS:RegisterSkin(name, AS.SkinAchieveIt, "ADDON_LOADED")