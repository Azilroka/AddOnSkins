local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AchieveIt') then return end

function AS:AchieveIt(event, addon)
	if addon == 'Blizzard_AchievementUI' then
		AS:Delay(1, function()
			for i = 1, 20 do
				local frame = _G['AchievementFrameCategoriesContainerButton'..i]
				AS:StripTextures(frame)
				AS:StyleButton(frame)				
			end
			AchieveIt_Locate_Button.label:ClearAllPoints()
			AchieveIt_Locate_Button.label:SetJustifyH('CENTER')
			AchieveIt_Locate_Button.label:SetPoint('CENTER') 
			AS:SkinButton(AchieveIt_Locate_Button, true)
			AchieveIt_Locate_Button:ClearAllPoints()
			AchieveIt_Locate_Button:SetPoint('TOPLEFT', AchievementFrame, 250, 5)
		end)
	end
end

AS:RegisterSkin('AchieveIt', AS.AchieveIt, 'ADDON_LOADED')