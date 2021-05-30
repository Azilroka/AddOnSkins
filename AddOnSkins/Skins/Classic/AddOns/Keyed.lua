local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Keyed') then return end

function AS:Keyed()
	AS:SkinFrame(KeyedFrame)
	AS:SkinFrame(KeyedFrameInset)
	AS:SkinCheckBox(KeyedFrameShowMinimapButton)
	AS:SkinCloseButton(KeyedFrameCloseButton)
	AS:StripTextures(KeystoneListScrollFrame, true)
	AS:SkinScrollBar(KeystoneListScrollFrameScrollBar)

	for i = 1, 3 do
		AS:SkinButton(_G["KeyedFrameColumnHeader"..i], true)
	end

	KeyedFrameColumnHeader1:SetPoint("TOPLEFT", 4, -57)
	KeyedFrameColumnHeader3:SetWidth(48)
end

AS:RegisterSkin('Keyed', AS.Keyed)
