-- Check these files for DecUI-specific edits - Decard
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArtifactTab') then return end

function AS:ArtifactTab()

	-- AS:SkinButton(128935)
	-- AS:SkinButton(ArtifactTab_createEquipedButton)
	-- for i = 1, ArtifactTab:GetNumChildren() do
		-- local object = select(i, ArtifactTab:GetChildren())
		-- if object:IsObjectType('Button') then
			-- if object:GetText() ~= nil then
				-- AS:SkinButton(object, true)
			-- else
				-- AS:SkinCloseButton(object, true)
			-- end
		-- end
	-- end
end

AS:RegisterSkin('ArtifactTab', AS.ArtifactTab)