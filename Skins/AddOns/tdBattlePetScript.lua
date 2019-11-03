local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('tdBattlePetScript') then return end

function AS:tdBattlePetScript()
	--/run LibStub('AceAddon-3.0'):GetAddon('tdBattlePetScript'):GetModule('UI.MainPanel').MainPanel:SetTemplate()
	local tdBattlePetScript = LibStub('AceAddon-3.0'):GetAddon('tdBattlePetScript'):GetModule('UI.MainPanel')

	AS:SkinFrame(tdBattlePetScript.MainPanel, nil, nil, true)
	for i = 1, tdBattlePetScript.MainPanel:GetNumChildren() do
		local frame = select(i, tdBattlePetScript.MainPanel:GetChildren())
		if frame:IsObjectType("Frame") then
			for j = 1, frame:GetNumRegions() do
				local region = select(j, frame:GetRegions())
				if region.GetTexture and region:GetTexture() and type(region:GetTexture() == "string") then
					if strfind(strlower(region:GetTexture()), "ui%-background%-marble") then
						AS:StripTextures(frame)
					elseif strfind(strlower(region:GetTexture()), "ui%-panel%-minimizebutton") then
						AS:SkinCloseButton(frame)
					end
				end
			end
		end
	end

	tdBattlePetScript.MainPanel.Portrait.Border:Hide()
	AS:SkinScrollBar(tdBattlePetScript.ScriptList.scrollBar)
end

AS:RegisterSkin('tdBattlePetScript', AS.tdBattlePetScript)
