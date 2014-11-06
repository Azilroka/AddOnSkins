local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TrainAll') then return end

function AS:TrainAll(event, addon)
	if addon == 'Blizzard_TrainerUI' or IsAddOnLoaded('Blizzard_TrainerUI') then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
			AS:SkinFrame(ClassTrainerTrainButton, 'Default')
		end)
		AS:UnregisterSkinEvent('TrainAll', event)
	end
end

AS:RegisterSkin('TrainAll', AS.TrainAll, 'ADDON_LOADED')