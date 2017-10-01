-- Check these files for DecUI-specific edits - Decard
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ModelPique') then return end

function AS:ModelPique()
	AS:SkinFrame(ModelPiqueFrame)
	ModelPiqueFrame:SetTemplate("Transparent")
	AS:SkinButton(ModelPiqueFrameCancelButton)
	AS:SkinCloseButton(ModelPiqueFrameCloseButton)
	ModelPiqueFramePortrait:Kill()

	--Reposition Frame
	ModelPiqueModel:ClearAllPoints()
	ModelPiqueModel:Point('BOTTOMLEFT', ModelPiqueFrame, 'BOTTOMLEFT', 5, 5)

	--Reposition buttons
	ModelPiqueFrameCancelButton:ClearAllPoints()
	ModelPiqueFrameCancelButton:Point('BOTTOMRIGHT', ModelPiqueFrame, 'BOTTOMRIGHT', -8, 8)
	ModelPiqueFrameCloseButton:ClearAllPoints()
	ModelPiqueFrameCloseButton:Point('TOPRIGHT', ModelPiqueFrame, 'TOPRIGHT', 0, 0)

	--Resize Frame
	ModelPiqueFrame:Size(327, 410)
end

AS:RegisterSkin('ModelPique', AS.ModelPique)