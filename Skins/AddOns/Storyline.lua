local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Storyline') then return end

function AS:Storyline()
	AS:SkinFrame(Storyline_NPCFrame)
	AS:SkinCloseButton(Storyline_NPCFrameClose)

	AS:Desaturate(Storyline_NPCFrameLock)
	AS:Desaturate(Storyline_NPCFrameResizeButton)
	AS:Desaturate(Storyline_NPCFrameConfigButton)

	--Reposition Menu
	Storyline_NPCFrameResizeButton:ClearAllPoints()
	Storyline_NPCFrameResizeButton:Point('TOPRIGHT', Storyline_NPCFrame, 'BOTTOMRIGHT', 0, 32)
	Storyline_NPCFrameLock:ClearAllPoints()
	Storyline_NPCFrameLock:Point('BOTTOM', Storyline_NPCFrameConfigButton, 'TOP', 0, 4)
	Storyline_NPCFrameConfigButton:ClearAllPoints()
	Storyline_NPCFrameConfigButton:Point('BOTTOM', Storyline_NPCFrameResizeButton, 'TOP', 1, 2)
end

AS:RegisterSkin('Storyline', AS.Storyline)
