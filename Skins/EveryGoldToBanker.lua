local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EveryGoldToBanker') then return end

local name = 'EveryGoldToBankerSkin'
function AS:SkinEveryGoldToBanker()
	AS:SkinFrame(EveryGoldToBankerCalculator)
	AS:SkinFrame(SettingFrame)
	AS:SkinEditBox(AmountEditBox)
	AmountEditBox:Height(22)
	AS:SkinEditBox(ReceiverEditBox)
	ReceiverEditBox:Height(22)
	AS:SkinEditBox(DefaultAmountEditBox)
	DefaultAmountEditBox:Height(22)
	AS:SkinEditBox(DefaultReceiverEditBox)
	DefaultReceiverEditBox:Height(22)
	AS:SkinButton(CheckButton)
	AS:SkinButton(SendButton)
	AS:SkinButton(SettingButton)
	AS:SkinButton(DoneSettingButton)
	TitleFrame:StripTextures()
	AmountFrame:StripTextures()
	ResponseFrame:StripTextures()
	ReceiverFrame:StripTextures()
	DefaultAmountFrame:StripTextures()
	DefaultReceiverFrame:StripTextures()
end

AS:RegisterSkin(name, AS.SkinEveryGoldToBanker)