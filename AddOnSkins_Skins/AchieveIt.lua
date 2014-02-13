local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AchieveIt') then return end

local name = 'AchieveItSkin'
function AS:SkinAchieveIt(event, addon)
	if addon == 'Blizzard_AchievementUI' then
		AS:Delay(1, function()
			for i = 1, 20 do
				local frame = _G['AchievementFrameCategoriesContainerButton'..i]
				local lastframe = _G['AchievementFrameCategoriesContainerButton'..i-1]
				
				frame:StripTextures()
				frame:StyleButton()				
			end
			AS:SkinButton(AchieveIt_Locate_Button)
			AchieveIt_Locate_Button:ClearAllPoints()
			AchieveIt_Locate_Button:SetPoint('TOPLEFT', AchievementFrame, 250, 5)
		end)
	end
end

AS:RegisterSkin(name, AS.SkinAchieveIt, 'ADDON_LOADED')