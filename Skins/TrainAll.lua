local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Train-All') then return end

function AS:TrainAll(event, addon)
	if addon == 'Blizzard_TrainerUI' or IsAddOnLoaded('Blizzard_TrainerUI') then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(TrainAllButton, 'Default')
			--AS:SkinFrame(TrainButton, 'Default')
		end)
		AS:UnregisterSkinEvent('TrainAll', event)
	end
end

AS:RegisterSkin('TrainAll', AS.TrainAll, 'ADDON_LOADED')