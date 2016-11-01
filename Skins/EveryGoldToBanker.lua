local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EveryGoldToBanker') then return end

function AS:EveryGoldToBanker()
	AS:SkinFrame(EveryGoldToBankerCalculator)
	AS:SkinFrame(SettingFrame)
	AS:SkinEditBox(AmountEditBox)
	AmountEditBox:SetHeight(22)
	AS:SkinEditBox(ReceiverEditBox)
	ReceiverEditBox:SetHeight(22)
	AS:SkinEditBox(DefaultAmountEditBox)
	DefaultAmountEditBox:SetHeight(22)
	AS:SkinEditBox(DefaultReceiverEditBox)
	DefaultReceiverEditBox:SetHeight(22)
	AS:SkinButton(CheckButton)
	AS:SkinButton(SendButton)
	AS:SkinButton(SettingButton)
	AS:SkinButton(DoneSettingButton)
	AS:StripTextures(TitleFrame)
	AS:StripTextures(AmountFrame)
	AS:StripTextures(ResponseFrame)
	AS:StripTextures(ReceiverFrame)
	AS:StripTextures(DefaultAmountFrame)
	AS:StripTextures(DefaultReceiverFrame)
end

AS:RegisterSkin('EveryGoldToBanker', AS.EveryGoldToBanker)