local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MasterPlan') then return end

function AS:MasterPlan(event, addon)
	if addon == 'MasterPlan' or IsAddOnLoaded('MasterPlan') then
		AS:SkinButton(MPCompleteAll)
		AS:SkinButton(MPPokeTentativeParties)
		AS:SkinTab(GarrisonMissionFrameTab3)
		AS:SkinTab(GarrisonMissionFrameTab4)
		AS:SkinTab(GarrisonShipyardFrameTab3)
		AS:SkinTab(GarrisonLandingPageTab4)
		AS:SkinButton(MPLootSummaryDone)

		local kids = {MasterPlanMissionList:GetChildren()}
		for i = 1, #kids do
			if kids[i].lootFrame then
				AS:SkinFrame(kids[i].lootFrame)
				AS:SkinCloseButton(kids[i].lootFrame.Dismiss2)
				kids[i].lootFrame.Dismiss2:SetPoint("TOPRIGHT", kids[i].lootFrame, "TOPRIGHT", -3, -3)
				break
			end
		end

		AS:UnregisterSkinEvent('ADDON_LOADED')
	end
end

AS:RegisterSkin('MasterPlan', AS.MasterPlan, "ADDON_LOADED")