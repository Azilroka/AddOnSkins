local AS, L, S, R = unpack(AddOnSkins)

function R:TrainAll(event, addon)
	if addon == 'Blizzard_TrainerUI' or IsAddOnLoaded('Blizzard_TrainerUI') then
		ClassTrainerFrame:HookScript('OnShow', function(self)
			if not TrainAllButton.isSkinned then
				S:StripTextures(TrainAllButton)
				S:HandleButton(TrainAllButton)
			end
		end)
		AS:UnregisterSkinEvent('TrainAll', event)
	end
end

AS:RegisterSkin('Train-All', R.TrainAll, 'ADDON_LOADED')
