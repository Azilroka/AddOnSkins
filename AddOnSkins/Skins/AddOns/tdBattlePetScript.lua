local AS, L, S, R = unpack(AddOnSkins)

function R:tdBattlePetScript()
	--/run LibStub('AceAddon-3.0'):GetAddon('tdBattlePetScript'):GetModule('UI.MainPanel').MainPanel:SetTemplate()
	local tdBattlePetScript = LibStub('AceAddon-3.0'):GetAddon('PetBattleScripts'):GetModule('UI.MainPanel')

	S:HandleFrame(tdBattlePetScript.MainPanel, nil, nil, true)
	for i = 1, tdBattlePetScript.MainPanel:GetNumChildren() do
		local frame = select(i, tdBattlePetScript.MainPanel:GetChildren())
		if frame:IsObjectType("Frame") then
			for j = 1, frame:GetNumRegions() do
				local region = select(j, frame:GetRegions())
				if region.GetTexture and region:GetTexture() and type(region:GetTexture() == "string") then
					if strfind(strlower(region:GetTexture()), "ui%-background%-marble") then
						S:StripTextures(frame)
					elseif strfind(strlower(region:GetTexture()), "ui%-panel%-minimizebutton") then
						S:HandleCloseButton(frame)
					end
				end
			end
		end
	end

	local BlockDialog = tdBattlePetScript.BlockDialog
	S:HandleFrame(BlockDialog)
	BlockDialog:SetFrameStrata("DIALOG")
	BlockDialog:SetFrameLevel(10000)
	BlockDialog.Text:SetFont(AS.Font, 12)
	S:HandleButton(BlockDialog.AcceptButton)
	S:HandleButton(BlockDialog.CancelButton)
	S:HandleEditBox(BlockDialog.EditBox)
	tdBattlePetScript.MainPanel.Portrait.Border:Hide()
	S:HandleScrollBar(tdBattlePetScript.ScriptList.scrollBar)

	S:HandleButton(_G.tdBattlePetScriptAutoButton)
end

AS:RegisterSkin('tdBattlePetScript')
