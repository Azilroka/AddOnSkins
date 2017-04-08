local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Keyed') then return end

function AS:Keyed()
	AS:SkinFrame(KeyedFrame)
	AS:SkinFrame(KeyedFrameInset)
	AS:SkinButton(KeyedFrameGetKeystonesButton)
	AS:SkinCheckBox(KeyedFrameShowOutOfDateButton)
	AS:SkinCheckBox(KeyedFrameShowMinimapButton)
	AS:SkinCloseButton(KeyedFrameCloseButton)
	KeystoneListScrollFrame:StripTextures(true)
	AS:SkinScrollBar(KeystoneListScrollFrameScrollBar)
	for i=1, 3 do
		AS:SkinButton(_G["KeyedFrameColumnHeader"..i], true)
	end
	KeyedFrameColumnHeader1:SetPoint("TOPLEFT", 4, -57)
	if GetKeystoneData() > 19 then 
		KeyedFrameColumnHeader3:SetWidth(63)
	else
		KeyedFrameColumnHeader3:SetWidth(48)
	end
end

AS:RegisterSkin('Keyed', AS.Keyed)