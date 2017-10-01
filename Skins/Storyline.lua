-- Check these files for DecUI-specific edits - Decard
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Storyline') then return end

function AS:Storyline()
	AS:SkinFrame(Storyline_NPCFrame, 'Transparent')
	AS:SkinCloseButton(Storyline_NPCFrameClose)
	Storyline_NPCFrame:SetTemplate("Transparent")

	--Reposition Menu
	Storyline_NPCFrameLock:ClearAllPoints()
	Storyline_NPCFrameLock:Point('RIGHT', Storyline_NPCFrameClose, 'LEFT', -626, 0)
end

AS:RegisterSkin('Storyline', AS.Storyline)