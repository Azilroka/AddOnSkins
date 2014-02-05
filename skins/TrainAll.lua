local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('TrainAll') then return end

local name = 'TrainAllSkin'
function AS:SkinTrainAll(event, addon)
	if addon == 'Blizzard_TrainerUI' then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
			AS:SkinFrame(ClassTrainerTrainButton, 'Default')
		end)
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinTrainAll, 'ADDON_LOADED')