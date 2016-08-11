local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RCLootCouncil') then return end

function AS:RCLootCouncil()
	local RCSessionFrame = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil"):GetModule("RCSessionFrame")
	hooksecurefunc(RCSessionFrame, "Show", function()
		AS:SkinFrame(DefaultRCSessionSetupFrame, nil, nil, true)
		AS:StripTextures(DefaultRCSessionSetupFrame.content, true)
		AS:StripTextures(DefaultRCSessionSetupFrame.title, true)
		AS:SkinCheckBox(DefaultRCSessionSetupFrameToggle)
	end)

	local RCLootFrame = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil"):GetModule("RCLootFrame")
	hooksecurefunc(RCLootFrame, "Show", function()
		AS:SkinFrame(DefaultRCLootFrame.content, nil, nil, true)
		AS:StripTextures(DefaultRCLootFrame.title, true)
	end)

	local RCVotingFrame = LibStub("AceAddon-3.0"):GetAddon("RCLootCouncil"):GetModule("RCVotingFrame")
	hooksecurefunc(RCVotingFrame, "Show", function()
		AS:SkinFrame(DefaultRCLootCouncilFrame.content, nil, nil, true)
		AS:StripTextures(DefaultRCLootCouncilFrame.title, true)
		AS:SkinButton(DefaultRCLootCouncilFrame.abortBtn)
		AS:SkinButton(DefaultRCLootCouncilFrame.filter)
		AS:SkinButton(DefaultRCLootCouncilFrame.disenchant)
	end)
end

AS:RegisterSkin('RCLootCouncil', AS.RCLootCouncil)