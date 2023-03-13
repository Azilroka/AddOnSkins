local AS, L, S, R = unpack(AddOnSkins)

function R:Storyline()
	S:HandleFrame(Storyline_NPCFrame)
	S:HandleCloseButton(Storyline_NPCFrameClose)

	S:Desaturate(Storyline_NPCFrameLock)
	S:Desaturate(Storyline_NPCFrameResizeButton)
	S:Desaturate(Storyline_NPCFrameConfigButton)

	--Reposition Menu
	Storyline_NPCFrameResizeButton:ClearAllPoints()
	Storyline_NPCFrameResizeButton:SetPoint('TOPRIGHT', Storyline_NPCFrame, 'BOTTOMRIGHT', 0, 32)
	Storyline_NPCFrameLock:ClearAllPoints()
	Storyline_NPCFrameLock:SetPoint('BOTTOM', Storyline_NPCFrameConfigButton, 'TOP', 0, 4)
	Storyline_NPCFrameConfigButton:ClearAllPoints()
	Storyline_NPCFrameConfigButton:SetPoint('BOTTOM', Storyline_NPCFrameResizeButton, 'TOP', 1, 2)
end

AS:RegisterSkin('Storyline')
