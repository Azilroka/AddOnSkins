local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Saddlebag') then return end

function AS:Saddlebag()
	local Saddlebag = LibStub("AceAddon-3.0"):GetAddon("Saddlebag")
	hooksecurefunc(Saddlebag, 'auctionButton', function()
		if not SaddlebagFrame.isSkinned then
			AS:SkinFrame(SaddlebagFrame)
			AS:SkinButton(SaddlebagFrameButton)
			AS:SkinScrollBar(SaddlebagScrollFrameScrollBar)
			SaddlebagFrame.isSkinned = true
		end
	end)
end

AS:RegisterSkin('Saddlebag', AS.Saddlebag)
