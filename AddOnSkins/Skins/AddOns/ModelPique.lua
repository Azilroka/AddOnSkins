local AS, L, S, R = unpack(AddOnSkins)

function R:ModelPique()
	S:HandleFrame(ModelPiqueFrame)
	S:HandleButton(ModelPiqueFrameCancelButton)
	S:HandleCloseButton(ModelPiqueFrameCloseButton)
	S:Kill(ModelPiqueFramePortrait)

	--Reposition Frame
	ModelPiqueModel:ClearAllPoints()
	ModelPiqueModel:SetPoint('BOTTOMLEFT', ModelPiqueFrame, 'BOTTOMLEFT', 5, 5)

	--Reposition buttons
	ModelPiqueFrameCancelButton:ClearAllPoints()
	ModelPiqueFrameCancelButton:SetPoint('BOTTOMRIGHT', ModelPiqueFrame, 'BOTTOMRIGHT', -8, 8)
	ModelPiqueFrameCloseButton:ClearAllPoints()
	ModelPiqueFrameCloseButton:SetPoint('TOPRIGHT', ModelPiqueFrame, 'TOPRIGHT', 0, 0)

	--Resize Frame
	ModelPiqueFrame:SetSize(327, 410)
end

AS:RegisterSkin('ModelPique')
