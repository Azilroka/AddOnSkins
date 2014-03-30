local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TrainAll') then return end

local name = 'TrainAllSkin'
function AS:SkinTrainAll(event, addon)
	if addon == 'Blizzard_TrainerUI' or IsAddOnLoaded('Blizzard_TrainerUI') then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
			AS:SkinFrame(ClassTrainerTrainButton, 'Default')
		end)
		AS:UnregisterSkinEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinTrainAll, 'ADDON_LOADED')